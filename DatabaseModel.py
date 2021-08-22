import pymysql
import sys
import configparser
from sqlalchemy import create_engine

conf = configparser.ConfigParser()

try:
    conf.read('.env')
except Exception as e:
    print(f"no config file found {e}")
    sys.exit()


class DatabaseModel:
    def __init__(self):
        self.DB = pymysql.connect(
            user=conf['DB']['USER'],
            password=conf['DB']['PASS'],
            host=conf['DB']['HOST'],
            database=conf['DB']['DB'],
            port=int(conf['DB']['PORT'])
        )
        self.CURSOR = self.DB.cursor()
        self.CURSOR.execute('SET SQL_MODE=ANSI_QUOTES')
        self.ENGINE = create_engine(f'mysql://{conf["DB"]["USER"]}:{conf["DB"]["PASS"]}@{conf["DB"]["HOST"]}:{conf["DB"]["PORT"]}')

    def execute_sql_file(self, filepath):
        with open(filepath, 'r') as fp:
            for block in fp.read().split(';'):
                if len(block.strip()) < 5:
                    continue
                self.CURSOR.execute(block)
        self.DB.commit()

    def close(self):
        self.DB.close()
        self.ENGINE.dispose()
