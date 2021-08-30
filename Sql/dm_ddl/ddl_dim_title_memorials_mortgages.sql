CREATE TABLE IF NOT EXISTS STAGE.StageTitleMemorialsMortgages
(
    FILENAME                          VARCHAR(255)
    ,BATCHDATEKEY                     INT
    ,ROWID                            INT AUTO_INCREMENT

    ,ID                               VARCHAR(128)
    ,TITLE_NO                         VARCHAR(255)
    ,LAND_DISTRICT                    VARCHAR(255)
    ,MEMORIAL_TEXT                    MEDIUMTEXT
    ,CURRENT                          VARCHAR(10)
    ,INSTRUMENT_NUMBER                VARCHAR(128)
    ,INSTRUMENT_LODGED_DATETIME       VARCHAR(128)
    ,INSTRUMENT_TYPE                  VARCHAR(255)
    ,ENCUMBRANCEES                    TEXT


    ,KEY(ROWID)
);
CREATE TABLE IF NOT EXISTS DQ.DQTitleMemorialsMortgages
(
    ROWID                                   INT
    ,ID_CHECK                               INT
    ,TITLE_NO_CHECK                         INT
    ,LAND_DISTRICT_CHECK                    INT
    ,MEMORIAL_TEXT_CHECK                    INT
    ,CURRENT_CHECK                          INT
    ,INSTRUMENT_NUMBER_CHECK                INT
    ,INSTRUMENT_LODGED_DATETIME_CHECK       INT
    ,INSTRUMENT_TYPE_CHECK                  INT
    ,ENCUMBRANCEES_CHECK                    INT
    ,VALID                                  INT

    ,KEY(ROWID)
);

CREATE TABLE IF NOT EXISTS ETL.ETLTitleMemorialsMortgages
(
    TitleMemorialsMortgagesKey              INT
    ,ID                                     INT
    ,TitleNo                                VARCHAR(128)
    ,LandDistrict                           VARCHAR(128)
    ,MemorialText                           VARCHAR(128)
    ,Current                                VARCHAR(128)
    ,InstrumentNumber                       VARCHAR(128)
    ,InstrumentLodgedDatetime               DATETIME
    ,InstrumentType                         VARCHAR(128)
    ,Encumbrancees                          VARCHAR(255)

    ,KEY(TitleMemorialsMortgagesKey)
);

CREATE TABLE IF NOT EXISTS DataWH.DimMorgageInstrumentType #make distinct
(
    InstrumentTypeKey                       INT AUTO_INCREMENT
    ,InstrumentType                         VARCHAR(128)

    ,KEY(InstrumentTypeKey)
    ,INDEX InstrumentTypeIdx(InstrumentType)
);

CREATE TABLE IF NOT EXISTS DataWH.DimLandDistrict #make distinct
(
    LandDistrictKey                         INT AUTO_INCREMENT
    ,LandDistrict                           VARCHAR(128)
    ,KEY(LandDistrictKey)
    ,INDEX LandDistrictIdx(LandDistrict)
);

CREATE TABLE IF NOT EXISTS DataWH.DimEncumbrancees #make distinct
(
    EncumbranceesKey                        INT AUTO_INCREMENT
    ,Encumbrancees                          VARCHAR(255)
    ,KEY(EncumbranceesKey)
    ,INDEX LandDistrictIdx(Encumbrancees)
);

CREATE TABLE IF NOT EXISTS DataWH.FactTitleMemorialsMortgages
(
    TitleMemorialsMortgagesKey              INT
    ,ID                                     INT
    ,TitleNo                                VARCHAR(128)
    ,LandDistrictKey                        INT
    ,MemorialText                           VARCHAR(128)
    ,Current                                VARCHAR(128)
    ,InstrumentNumber                       VARCHAR(128)
    ,InstrumentLodgedDatetime               DATETIME
    ,InstrumentTypeKey                      INT
    ,EncumbranceesKey                       INT

    ,KEY(TitleMemorialsMortgagesKey)
);
