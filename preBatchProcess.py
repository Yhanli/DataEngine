import pandas as pd
import configparser
import sys

conf = configparser.ConfigParser()

try:
    conf.read('.env')
except Exception as e:
    print(f"no config file found {e}")
    sys.exit()


def drop_columns(data, to_keep):
    for col in data.columns:
        if col not in to_keep:
            data = data.drop(col, axis=1)
    return data


def split_title_owner():
    """:cvar None
        Process to split the multiple owners to individual owner by title_no
    """
    print("Transforming : nz-property-titles-including-owners to individual owner")
    path = f'{conf["DATA"]["DATA_FOLDER"]}/nz-property-titles-including-owners'
    data = pd.read_csv(f"{path}.csv", encoding='utf-8-sig')

    data = drop_columns(data, [
        'id', 'title_no', 'owners'
    ])
    data['owners'] = data['owners'].str.split(", ")
    data = data.apply(pd.Series.explode)
    data = data.rename(columns={'owners': 'owner'})
    data.to_csv(f'{path}-split.csv', encoding='utf-8-sig', index=False)
    print("Transformed : nz-property-titles-including-owners to individual owner")


def runPreProcess():
    print("Start PreProcess: -------------------------------------------")
    split_title_owner()
    print("End PreProcess: ---------------------------------------------")

