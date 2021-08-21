from DatabaseModel import DatabaseModel
from ActionModel import ActionListModel

actions = ActionListModel()


def destroy_all():
    actions.destroy_all_stage()
    actions.destroy_all_dq()
    actions.destroy_all_etl()
    actions.destroy_all_dwh()


def start_process():
    actions.run_all_ddl()
    actions.run_all_stage()


if __name__ == '__main__':
    # destroy_all()
    start_process()
