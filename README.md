# DataEngine
Engine to ingest data into database, DDL ETL DQ DWH


###### DataBase Flow Relationship

**Raw file from source must follow this flow**
Load -> Stage -> DQ -> ETL -> DIM/FACT (DWH)

**Data separate from Loaded Files**
ETL(Source) -> ETL(Destination) -> DIM/REPORT (Semantic) (DWH)

**Reporting (Semantic)**
DIM + FACT -> vETL/ETL -> Report(DWH)

**Dimensions**
Table relations/ object specific attributes
Table(Source) extracted column should drop to save space and linked by unique identifier

**Fact**
Record/Transaction which relate to object

**DQ**
Only have integrity check (1 or 0) for fields, output 1 to valid field. Consider valid if pass all required field test,
and test case need to be specified to column type.

AT ETL, Data Should be converted to the right type and should have the same data detail as stage table except for META.

FROM ETL to DWH, the data should be separated in to DIM and FACT for loaded data, Report can be generated at any form 
using DIM and Fact. Also Report process data can cycle back to ETL as view(prefered) or table for later use
