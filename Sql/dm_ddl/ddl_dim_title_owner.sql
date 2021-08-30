CREATE TABLE IF NOT EXISTS STAGE.StageTitleOwner
(
    FILENAME                          VARCHAR(255)
    ,BATCHDATEKEY                     INT
    ,ROWID                            INT AUTO_INCREMENT

    ,ID                               VARCHAR(128)
    ,TITLE_NO                         VARCHAR(255)
    ,OWNER                            VARCHAR(255)
    ,KEY(ROWID)
);
CREATE TABLE IF NOT EXISTS DQ.DQTitleOwner
(

    ROWID                             INT

    ,ID_CHECK                         INT
    ,TITLE_NO_CHECK                   INT
    ,OWNER_CHECK                      INT
    ,VALID                            INT
    ,KEY(ROWID)
);

CREATE TABLE IF NOT EXISTS ETL.ETLTitleOwner
(
    TitleOwnerKey                     INT
    ,ID                               INT
    ,TitleNo                          VARCHAR(255)
    ,Owner                            VARCHAR(255)

    ,KEY(TitleOwnerKey)
);


CREATE TABLE IF NOT EXISTS DataWH.DimTitleOwner
(
    TitleOwnerKey                     INT
    ,ID                               INT
    ,TitleNo                          VARCHAR(255)
    ,Owner                            VARCHAR(255)

    ,KEY(TitleOwnerKey)
    ,INDEX TitleOwnerIdx(TitleNo)
    ,INDEX OwnerTitleIdx(Owner)
);

