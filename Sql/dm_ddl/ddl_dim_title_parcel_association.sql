CREATE TABLE IF NOT EXISTS STAGE.StageTitleParcelAssociation
(
    FILENAME                          VARCHAR(255)
    ,BATCHDATEKEY                     INT
    ,ROWID                            INT AUTO_INCREMENT

    ,ID                               VARCHAR(128)
    ,TITLE_NO                         VARCHAR(255)
    ,PAR_ID                           VARCHAR(128)
    ,SOURCE                           VARCHAR(255)

    ,KEY(ROWID)
);

CREATE TABLE IF NOT EXISTS DQ.DQTitleParcelAssociation
(
    ROWID                                   INT
    ,ID_CHECK                               INT
    ,TITLE_NO_CHECK                         INT
    ,PAR_ID_CHECK                           INT
    ,SOURCE_CHECK                           INT
    ,VALID                                  INT

    ,KEY(ROWID)
);

CREATE TABLE IF NOT EXISTS ETL.ETLTitleParcelAssociation
(
    TitleParcelAssociationKey               INT
    ,ID                                     INT
    ,TitleNo                                VARCHAR(128)
    ,ParID                                  INT
    ,Source                                 VARCHAR(128)

    ,KEY(TitleParcelAssociationKey)
);

CREATE TABLE IF NOT EXISTS DataWH.DimTitleParcelAssociation
(
    TitleParcelAssociationKey               INT
    ,ID                                     INT
    ,TitleNo                                VARCHAR(128)
    ,ParID                                  INT
    ,Source                                 VARCHAR(128)

    ,KEY(TitleParcelAssociationKey)
    ,INDEX TitleNoIdx(TitleNo)
);