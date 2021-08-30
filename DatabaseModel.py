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
            port=int(conf['DB']['PORT'])
        )
        self.CURSOR = self.DB.cursor()
        self.CURSOR.execute('SET SQL_MODE=ANSI_QUOTES')
        self.ENGINE = create_engine(
            f'mysql://{conf["DB"]["USER"]}:{conf["DB"]["PASS"]}@{conf["DB"]["HOST"]}:{conf["DB"]["PORT"]}')

    def execute_sql_file(self, filepath):
        with open(filepath, 'r') as fp:
            for block in fp.read().split(';'):
                if len(block.strip()) < 5:
                    continue
                self.CURSOR.execute(block)
        self.DB.commit()

    def execute_single(self, sql, data):
        self.CURSOR.execute(sql, data)
        self.DB.commit()

    def execute_return_all(self, sql):
        self.CURSOR.execute(sql)
        fields = map(lambda x: x[0], self.CURSOR.description)
        return [dict(zip(fields, row)) for row in self.CURSOR.fetchall()]

    def execute_return_one(self, sql):
        self.CURSOR.execute(sql)
        fields = map(lambda x: x[0], self.CURSOR.description)
        return [dict(zip(fields, row)) for row in self.CURSOR.fetchall()][-1]

    def execute_fetchone(self, sql):
        self.CURSOR.execute(sql)
        return self.CURSOR.fetchone()

    def close(self):
        self.DB.close()
        self.ENGINE.dispose()
