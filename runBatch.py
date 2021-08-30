import os
from DatabaseModel import DatabaseModel
from ActionModel import ActionListModel
from preBatchProcess import *
from SupportModels import Admin
import logging

logging.basicConfig(level=logging.DEBUG)


DB = DatabaseModel()
actions = ActionListModel()
admin = Admin(DB)


def destroy_all_table():
    actions.destroy_all_stage()
    actions.destroy_all_dq()
    actions.destroy_all_etl()
    actions.destroy_all_dwh()


def start_process():
    actions.run_all_ddl()
    actions.run_all_stage()
    actions.run_all_dq()
    actions.run_all_etl()


if __name__ == '__main__':
    admin.run_init_sqls()
    # admin.run_audit_reset()
    # destroy_all_table()
    # runPreProcess()
    start_process()
