import configparser
import csv
import sys
from datetime import datetime
import traceback

import pandas as pd

import petl

from DatabaseModel import DatabaseModel
from SupportModels import Auditor

conf = configparser.ConfigParser()

try:
    conf.read('.env')
except Exception as e:
    print(f"no config file found {e}")
    sys.exit()

DB = DatabaseModel()
auditor = Auditor()


class ActionModel:
    def __init__(self, attrib):
        self.ID = attrib["ID"]
        self.NAME = attrib["NAME"]
        self.TYPE = attrib["TYPE"]
        self.STATUS = attrib["STATUS"]
        self.DDL_CODE = attrib["DDL_CODE"]
        self.DQ_CODE = attrib["DQ_CODE"]
        self.ETL_CODE = attrib["ETL_CODE"]
        self.COPY_CODE = attrib["COPY_CODE"]
        self.FILE_PREFIX = attrib["FILE_PREFIX"]
        self.STAGE_TABLE = attrib["STAGE_TABLE"]
        self.DQ_TABLE = attrib["DQ_TABLE"]
        self.ETL_TABLE = attrib["ETL_TABLE"]
        self.TARGET_TABLE = attrib["TARGET_TABLE"]
        self.CHILD_TABLES = attrib["CHILD_TABLES"].split('|') if attrib["CHILD_TABLES"] else []
        self.BATCH_DATE_KEY = datetime.now().strftime('%Y%m%d')

        self.STAGED = False

        self.STAGE_START_DATETIME = None
        self.DQ_START_DATETIME = None
        self.ETL_START_DATETIME = None

    def is_valid(self):
        return True if self.STATUS == '1' else False

    def is_enabled(self):
        return True if self.STATUS == '1' else False

    def run_ddl(self):
        if self.DDL_CODE:
            try:
                DB.execute_sql_file(f'Sql/dm_ddl/{self.DDL_CODE}')
                print(f"DDL SUCCESS : {self.DDL_CODE}")
            except Exception as e:
                print(f"DDL FAIL : {self.DDL_CODE}, {e}")

    def run_stage(self):
        global DB
        if self.STAGE_TABLE:
            if auditor.check_stage_audit(self.STAGE_TABLE, self.FILE_PREFIX):
                print(f"INFO : File has been extracted {self.FILE_PREFIX}")
                return

            self.STAGE_START_DATETIME = auditor.start_stage(self.STAGE_TABLE, self.FILE_PREFIX)
            try:
                print(f'Staging : {self.STAGE_TABLE}')
                DB.CURSOR.execute('USE STAGE;')
                data = petl.io.csv.fromcsv(f'{conf["DATA"]["DATA_FOLDER"]}/{self.FILE_PREFIX}.csv',
                                           encoding='utf-8-sig')
                data = petl.addfield(data, "FILENAME", self.FILE_PREFIX)
                data = petl.addfield(data, "BATCHDATEKEY", self.BATCH_DATE_KEY)
                for header in petl.header(data):
                    data = petl.rename(data, header, header.upper())
                petl.io.todb(data, DB.DB, self.STAGE_TABLE)
                print(f"SUCCESS : Staged {self.STAGE_TABLE} using {self.FILE_PREFIX}.csv")
                auditor.finish_stage(self.STAGE_START_DATETIME, self.STAGE_TABLE)
                self.STAGED = True
                return True
            except Exception as e:
                auditor.failed_stage(self.STAGE_START_DATETIME, str(traceback.format_exc()), self.STAGE_TABLE)

                print(f"FAIL : Staging {self.STAGE_TABLE} with {self.FILE_PREFIX}, {e} , trying with pandas")
                # traceback.print_exc()
                DB.close()
                DB = DatabaseModel()
                status = self.run_stage_pandas()
                return status
        else:
            return True

    def run_stage_pandas(self):
        try:
            data = pd.read_csv(f'{conf["DATA"]["DATA_FOLDER"]}/{self.FILE_PREFIX}.csv', encoding='utf-8-sig',
                               dtype='unicode')
            data.insert(loc=0, column='FILENAME', value=self.FILE_PREFIX)
            data.insert(loc=0, column='BATCHDATEKEY', value=self.BATCH_DATE_KEY)
            rename = {x: x.upper() for x in data.columns}
            data = data.rename(columns=rename)
            data.to_sql(self.STAGE_TABLE, con=DB.ENGINE, schema='STAGE', if_exists="append", index=False)
            print(f"SUCCESS : Staged {self.STAGE_TABLE} using {self.FILE_PREFIX}.csv")
            auditor.finish_stage(self.STAGE_START_DATETIME, self.STAGE_TABLE)
            self.STAGED = True
            return True

        except Exception as e:
            print(f"FAIL : Staging {self.STAGE_TABLE} with {self.FILE_PREFIX}, {e} ")
            auditor.failed_stage(self.STAGE_START_DATETIME, str(traceback.format_exc()), self.STAGE_TABLE)
            # traceback.print_exc()
            return False

    def destroy_stage(self):
        try:
            DB.CURSOR.execute('USE STAGE;')
            DB.CURSOR.execute(f'DROP TABLE IF EXISTS "{self.STAGE_TABLE}"')
            DB.DB.commit()
            print(f"SUCCESS : Destroyed {self.STAGE_TABLE}")
        except Exception as e:
            print(f"FAIL : Destroying {self.STAGE_TABLE}, {e}")
            return False

    def run_dq(self):
        DB.CURSOR.execute('USE DQ;')
        if self.DQ_CODE and self.STAGED:
            self.DQ_START_DATETIME = auditor.start_dq(self.DQ_TABLE, self.STAGE_TABLE)
            try:
                DB.execute_sql_file(f'Sql/dm_dq/{self.DQ_CODE}')
                print(f"DQ SUCCESS : {self.DQ_CODE}")
                auditor.finish_dq(self.DQ_START_DATETIME, self.DQ_TABLE)
            except Exception as e:
                auditor.failed_dq(self.DQ_START_DATETIME, str(traceback.format_exc()), self.DQ_TABLE)
                print(f"DQ FAIL : {self.DQ_CODE}, {e}")

    def destroy_dq(self):
        try:
            DB.CURSOR.execute('USE DQ;')
            DB.CURSOR.execute(f'DROP TABLE IF EXISTS "{self.DQ_TABLE}"')
            DB.DB.commit()
            print(f"SUCCESS : Destroyed {self.DQ_TABLE}")
        except Exception as e:
            print(f"FAIL : Destroying {self.DQ_TABLE}, {e}")
            return False

    def run_etl(self):
        DB.CURSOR.execute('USE ETL;')
        if self.ETL_CODE and self.STAGED:
            self.ETL_START_DATETIME = auditor.start_etl(self.ETL_TABLE, self.STAGE_TABLE)
            for table in self.CHILD_TABLES:
                auditor.start_etl(table, self.STAGE_TABLE, self.ETL_START_DATETIME)

            try:
                DB.execute_sql_file(f'Sql/dm_etl/{self.ETL_CODE}')
                auditor.finish_etl(self.ETL_START_DATETIME, self.ETL_TABLE)
                for table in self.CHILD_TABLES:
                    auditor.finish_etl(self.ETL_START_DATETIME, table)
                    print(f"ETL SUCCESS : {self.ETL_CODE} - {table}")
                print(f"ETL SUCCESS : {self.ETL_CODE} - {self.ETL_TABLE}")

            except Exception as e:
                auditor.failed_etl(self.ETL_START_DATETIME, self.ETL_TABLE, str(traceback.format_exc()))
                for table in self.CHILD_TABLES:
                    auditor.failed_etl(self.ETL_START_DATETIME, table, str(traceback.format_exc()))
                print(f"ETL FAIL : {self.ETL_CODE}, {e}")

    def destroy_etl(self):
        try:
            DB.CURSOR.execute('USE ETL;')
            DB.CURSOR.execute(f'DROP TABLE IF EXISTS "{self.ETL_TABLE}"')
            DB.DB.commit()
            print(f"SUCCESS : Destroyed {self.ETL_TABLE}")
        except Exception as e:
            print(f"FAIL : Destroying {self.ETL_TABLE}, {e}")
            return False

    def destroy_dwh(self):
        try:
            DB.CURSOR.execute('USE DataWH;')
            DB.CURSOR.execute(f'DROP TABLE IF EXISTS "{self.TARGET_TABLE}"')
            DB.DB.commit()
            print(f"SUCCESS : Destroyed {self.TARGET_TABLE}")
        except Exception as e:
            print(f"FAIL : Destroying {self.TARGET_TABLE}, {e}")
            return False


class ActionListModel:
    def __init__(self):
        self.ACTIONS = []
        self.load_list()

        print(f'INFO: {len(self.ACTIONS)} actions loaded')

    def load_list(self):
        with open('Dictionary/DataFlow.csv', 'r') as fp:
            reader = csv.reader(fp)
            headers = next(reader, None)
            for row in reader:
                temp = {}
                for h, v in zip(headers, row):
                    temp[h] = v if v != '' else None
                action = ActionModel(temp)
                self.ACTIONS.append(action) if action.is_enabled() else ''

    def run_all_ddl(self):
        for action in self.ACTIONS:
            action.run_ddl()

    def run_all_stage(self):
        for action in self.ACTIONS:
            action.run_stage()

    def run_all_dq(self):
        for action in self.ACTIONS:
            action.run_dq()

    def run_all_etl(self):
        for action in self.ACTIONS:
            action.run_etl()

    def destroy_all_stage(self):
        for action in self.ACTIONS:
            action.destroy_stage()

    def destroy_all_dq(self):
        for action in self.ACTIONS:
            action.destroy_dq()

    def destroy_all_etl(self):
        for action in self.ACTIONS:
            action.destroy_etl()

    def destroy_all_dwh(self):
        for action in self.ACTIONS:
            action.destroy_dwh()
