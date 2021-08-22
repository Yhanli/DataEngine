
import configparser
import csv
import sys
from datetime import datetime
import traceback

import petl

from DatabaseModel import DatabaseModel
from sqlalchemy import create_engine
import pandas as pd
conf = configparser.ConfigParser()

try:
    conf.read('.env')
except Exception as e:
    print(f"no config file found {e}")
    sys.exit()

engine = create_engine(f'mysql://{conf["DB"]["USER"]}:{conf["DB"]["PASS"]}@{conf["DB"]["HOST"]}:{conf["DB"]["PORT"]}')

data = pd.read_csv('TestDataSource/nz-property-titles.csv', encoding='utf-8-sig')
data["FILENAME"] = "test.csv"
data["BATCHDATEKEY"] = "1234566778"
rename = {x :x.upper() for x in data.columns}
data = data.rename(columns=rename)

# data = petl.addfield(data, "FILENAME", self.FILE_PREFIX)
# data = petl.addfield(data, "BATCHDATEKEY", self.BATCH_DATE_KEY)
# for header in petl.header(data):
#     data = petl.rename(data, header, header.upper())
# petl.io.todb(data, DB.DB, self.STAGE_TABLE)

print(data)
data.to_sql("StagePropertyTitle", con=engine, schema='STAGE', if_exists="replace")

engine.dispose()
