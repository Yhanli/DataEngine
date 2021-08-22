import pandas as pd

df = pd.read_csv('DataSource/nz-title-memorials-list-including-mortgages-leases-easements.csv', encoding='utf-8-sig')

for col in df.columns:
    print(col, end=' ')
    select_col = df[col]
    print(max(select_col.to_frame().astype('str').applymap(lambda x: len(x)).max()))
