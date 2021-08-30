CREATE TABLE IF NOT EXISTS STAGE.StagePropertyTitleWithOwner
(
    FILENAME                          VARCHAR(255)
    ,BATCHDATEKEY                     INT
    ,ROWID                            INT AUTO_INCREMENT

    ,WKT                              LONGTEXT
    ,ID                               VARCHAR(128)
    ,TITLE_NO                         VARCHAR(255)
    ,STATUS                           VARCHAR(128)
    ,TYPE                             VARCHAR(128)
    ,LAND_DISTRICT                    VARCHAR(255)
    ,ISSUE_DATE                       VARCHAR(128)
    ,GUARANTEE_STATUS                 VARCHAR(128)
    ,ESTATE_DESCRIPTION               LONGTEXT
    ,OWNERS                           LONGTEXT
    ,SPATIAL_EXTENTS_SHARED           VARCHAR(128)
    ,KEY(ROWID)
);
CREATE TABLE IF NOT EXISTS DQ.DQPropertyTitleWithOwner
(
    FILENAME                          VARCHAR(255)
    ,BATCHDATEKEY                     INT
    ,ROWID                            INT AUTO_INCREMENT

    ,WKT                              LONGTEXT
    ,ID                               VARCHAR(128)
    ,TITLE_NO                         VARCHAR(255)
    ,STATUS                           VARCHAR(128)
    ,TYPE                             VARCHAR(128)
    ,LAND_DISTRICT                    VARCHAR(255)
    ,ISSUE_DATE                       VARCHAR(128)
    ,GUARANTEE_STATUS                 VARCHAR(128)
    ,ESTATE_DESCRIPTION               LONGTEXT
    ,OWNERS                           LONGTEXT
    ,SPATIAL_EXTENTS_SHARED           VARCHAR(128)
    ,KEY(ROWID)
);

