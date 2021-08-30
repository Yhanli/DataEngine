TRUNCATE TABLE ETL.ETLTitleMemorialsMortgages;
INSERT INTO ETL.ETLTitleMemorialsMortgages
SELECT

    st.ROWID
    ,CAST(ID AS UNSIGNED)
    ,TITLE_NO
    ,LAND_DISTRICT
    ,MEMORIAL_TEXT
    ,CURRENT
    ,INSTRUMENT_NUMBER
    ,CAST(INSTRUMENT_LODGED_DATETIME AS DATETIME)
    ,INSTRUMENT_TYPE
    ,ENCUMBRANCEES

FROM STAGE.StageTitleMemorialsMortgages st
INNER JOIN DQ.DQTitleMemorialsMortgages dq
    ON st.ROWID = dq.ROWID
    AND dq.VALID = 1
;

TRUNCATE TABLE DataWH.DimMorgageInstrumentType;
INSERT INTO DataWH.DimMorgageInstrumentType
(
    InstrumentType
)
(
    SELECT
        DISTINCT InstrumentType
    FROM ETL.ETLTitleMemorialsMortgages
);


TRUNCATE TABLE DataWH.DimLandDistrict;
INSERT INTO DataWH.DimLandDistrict
(
    LandDistrict
)
(
    SELECT
        DISTINCT LandDistrict
    FROM ETL.ETLTitleMemorialsMortgages
);


TRUNCATE TABLE DataWH.DimEncumbrancees;
INSERT INTO DataWH.DimEncumbrancees
(
    Encumbrancees
)
(
    SELECT
        DISTINCT Encumbrancees
    FROM ETL.ETLTitleMemorialsMortgages
);


TRUNCATE TABLE DataWH.FactTitleMemorialsMortgages;
INSERT INTO DataWH.FactTitleMemorialsMortgages(
    SELECT
        TitleMemorialsMortgagesKey
        ,ID
        ,TitleNo
        ,LandDistrictKey
        ,MemorialText
        ,Current
        ,InstrumentNumber
        ,InstrumentLodgedDatetime
        ,InstrumentTypeKey
        ,EncumbranceesKey

    FROM ETL.ETLTitleMemorialsMortgages tmm
    INNER JOIN DataWH.DimMorgageInstrumentType mit
            ON tmm.InstrumentType = mit.InstrumentType
    INNER JOIN DataWH.DimLandDistrict ld
           ON tmm.LandDistrict = ld.LandDistrict
    INNER JOIN DataWH.DimEncumbrancees en
           ON tmm.Encumbrancees = en.Encumbrancees
);