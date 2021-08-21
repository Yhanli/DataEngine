import configparser
import csv
import sys
from datetime import datetime

import petl

from DatabaseModel import DatabaseModel

conf = configparser.ConfigParser()

try:
    conf.read('.env')
except Exception as e:
    print(f"no config file found {e}")
    sys.exit()

DB = DatabaseModel()


class ActionModel:
    def __init__(self, attrib):
        self.ID = attrib["ID"]
        self.NAME = attrib["NAME"]
        self.TYPE = attrib["TYPE"]
        self.STATUS = attrib["STATUS"]
        self.DDL_CODE = attrib["DDL_CODE"]
        self.ETL_CODE = attrib["ETL_CODE"]
        self.COPY_CODE = attrib["COPY_CODE"]
        self.FILE_PREFIX = attrib["FILE_PREFIX"]
        self.STAGE_TABLE = attrib["STAGE_TABLE"]
        self.DQ_TABLE = attrib["DQ_TABLE"]
        self.ETL_TABLE = attrib["ETL_TABLE"]
        self.TARGET_TABLE = attrib["TARGET_TABLE"]
        self.BATCH_DATE_KEY = datetime.now().strftime('%Y%m%d%H%M%S')

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
                print(f"DDL Fail : {self.DDL_CODE}, {e}")

    def staging(self):
        try:
            data = petl.io.csv.fromcsv(f'{conf["DATA"]["DATA_FOLDER"]}/{self.FILE_PREFIX}.csv', encoding='utf-8-sig')
            data = petl.addfield(data, "FILENAME", self.FILE_PREFIX)
            data = petl.addfield(data, "BATCHDATEKEY", self.BATCH_DATE_KEY)
            for header in petl.header(data):
                data = petl.rename(data, header, header.upper())
            petl.io.todb(data, DB.DB, self.STAGE_TABLE)
            print(f"Success : Staged {self.STAGE_TABLE} using {self.FILE_PREFIX}.csv")
            return True
        except Exception as e:
            print(f"Fail : Staging {self.STAGE_TABLE} with {self.FILE_PREFIX}, {e} ")
            return False

    def destroy_stage(self):
        try:
            DB.CURSOR.execute(f'DROP TABLE IF EXISTS "{self.STAGE_TABLE}"')
            DB.DB.commit()
            print(f"Success : Destroyed {self.STAGE_TABLE}")
        except Exception as e:
            print(f"Fail : Destroying {self.STAGE_TABLE}, {e}")
            return False

    def destroy_dq(self):
        try:
            DB.CURSOR.execute(f'DROP TABLE IF EXISTS "{self.DQ_TABLE}"')
            DB.DB.commit()
            print(f"Success : Destroyed {self.DQ_TABLE}")
        except Exception as e:
            print(f"Fail : Destroying {self.DQ_TABLE}, {e}")
            return False

    def destroy_etl(self):
        try:
            DB.CURSOR.execute(f'DROP TABLE IF EXISTS "{self.ETL_TABLE}"')
            DB.DB.commit()
            print(f"Success : Destroyed {self.ETL_TABLE}")
        except Exception as e:
            print(f"Fail : Destroying {self.ETL_TABLE}, {e}")
            return False

    def destroy_dwh(self):
        try:
            DB.CURSOR.execute(f'DROP TABLE IF EXISTS "{self.TARGET_TABLE}"')
            DB.DB.commit()
            print(f"Success : Destroyed {self.TARGET_TABLE}")
        except Exception as e:
            print(f"Fail : Destroying {self.TARGET_TABLE}, {e}")
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
            action.staging()

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

