import os
import re
from datetime import datetime
from DatabaseModel import DatabaseModel


class Admin:
    def __init__(self, DB):
        self.DB = DB

    def run_init_sqls(self):
        for file in filter(lambda file_name: 'initiate' in file_name, os.listdir('Sql/Admin')):
            print(f"INITIATING : {file}")
            file_path = (os.path.join(os.getcwd(), f'Sql/Admin/{file}'))
            self.DB.execute_sql_file(file_path)

    def run_audit_reset(self):
        print("RESETTING ALL AUDIT !")
        _check = input("Type 'YES' to confirm drop all audit table: ")
        if 'yes' in _check.lower().strip():
            file_path = (os.path.join(os.getcwd(), f'Sql/Admin/truncate_audit.sql'))
            self.DB.execute_sql_file(file_path)
            print("RESET COMPLETE")
        else:
            print("RESET CANCELLED")


class Auditor:
    def __init__(self):
        self.DB = DatabaseModel()
        self.STATUS = ["RUNNING", "COMPLETED", "FAILED"]

    # Audit Stage -----------------------------------------------------

    def start_stage(self, TableName, FileName):
        sql = f'INSERT INTO STAGE.StageAudit (TableName, FileName,StartDateTime,Status) VALUES (%s,%s,%s,%s)'
        time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        self.DB.execute_single(sql, (TableName, FileName, time, self.STATUS[0]))
        return time

    def failed_stage(self, StartTime, ErrorMsg):
        sql = f'UPDATE STAGE.StageAudit SET FinishDateTime=%s, Status=%s, ErrorOutput=%s WHERE StartDateTime=%s'
        time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        self.DB.execute_single(sql, (time, self.STATUS[2], ErrorMsg, StartTime))

    def finish_stage(self, StartTime, TableName):
        cnt_sql = f'SELECT COUNT(1) AS RecordCount FROM STAGE.{TableName}'
        result = self.DB.execute_return_all(cnt_sql)
        sql = f'UPDATE STAGE.StageAudit SET FinishDateTime=%s, Status=%s, Result=%s WHERE StartDateTime=%s'
        time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        self.DB.execute_single(sql, (time, self.STATUS[1], str(result), StartTime))

    # Audit DQ -----------------------------------------------------

    def start_dq(self, TableName, SourceTableName):
        sql = f'INSERT INTO DQ.DQAudit (TableName,SourceTableName,StartDateTime,Status) VALUES (%s,%s,%s,%s)'
        time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        self.DB.execute_single(sql, (TableName, SourceTableName, time, self.STATUS[0]))
        return time

    def failed_dq(self, StartTime, ErrorMsg):
        sql = f'UPDATE DQ.DQAudit SET FinishDateTime=%s, Status=%s, ErrorOutput=%s WHERE StartDateTime=%s'
        time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        self.DB.execute_single(sql, (time, self.STATUS[2], ErrorMsg, StartTime))

    def finish_dq(self, StartTime, TableName):
        cnt_pass_fail = f'SELECT SUM(IF(VALID = 1, 1, 0)) AS Pass, SUM(IF(VALID = 0, 1, 0)) AS Fail FROM DQ.{TableName}'
        cnt_all = f'SELECT COUNT(1) AS RecordCount FROM DQ.{TableName}'
        result = self.DB.execute_return_all(cnt_all)
        pass_fail = self.DB.execute_return_one(cnt_pass_fail)

        sql = f'UPDATE DQ.DQAudit SET FinishDateTime=%s, Status=%s, Result=%s, PassRecords=%s, FailRecords=%s  ' \
              f'WHERE StartDateTime=%s'
        time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        self.DB.execute_single(sql,
                               (time, self.STATUS[1], str(result), pass_fail['Pass'], pass_fail['Fail'], StartTime))

    # Audit ETL -----------------------------------------------------

    def start_etl(self, TableName, SourceTableName, time=None):
        sql = f'INSERT INTO ETL.ETLAudit (TableName,SourceTableName,StartDateTime,Status) VALUES (%s,%s,%s,%s)'
        time = datetime.now().strftime('%Y-%m-%d %H:%M:%S') if time is None else time
        self.DB.execute_single(sql, (TableName, SourceTableName, time, self.STATUS[0]))
        return time

    def failed_etl(self, StartTime, TableName, ErrorMsg):
        sql = f'UPDATE ETL.ETLAudit SET FinishDateTime=%s, Status=%s, ErrorOutput=%s WHERE StartDateTime=%s ' \
              f'AND TableName=%s'
        time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        self.DB.execute_single(sql, (time, self.STATUS[2], ErrorMsg, StartTime, TableName))

    def finish_etl(self, StartTime, TableName):
        db_name = 'ETL'
        if 'dim' in TableName[:3].lower():
            db_name = 'DataWH'
        cnt_sql = f'SELECT COUNT(1) AS RecordCount FROM {db_name}.{TableName}'
        result = self.DB.execute_return_all(cnt_sql)
        sql = f'UPDATE ETL.ETLAudit SET FinishDateTime=%s, Status=%s, Result=%s WHERE StartDateTime=%s ' \
              f'AND TableName=%s'
        time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        self.DB.execute_single(sql, (time, self.STATUS[1], str(result), StartTime, TableName))
