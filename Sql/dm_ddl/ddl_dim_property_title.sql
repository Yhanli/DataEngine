CREATE TABLE IF NOT EXISTS STAGE.StagePropertyTitle
(
    FILENAME                          VARCHAR(255)
    ,BATCHDATEKEY                     INT
    ,ROWID                            INT AUTO_INCREMENT

    ,WKT                              LONGTEXT
    ,ID                               VARCHAR(128)
    ,TITLE_NO                         VARCHAR(255)
    ,STATUS                           VARCHAR(255)
    ,TYPE                             VARCHAR(255)
    ,LAND_DISTRICT                    VARCHAR(255)
    ,ISSUE_DATE                       VARCHAR(255)
    ,GUARANTEE_STATUS                 VARCHAR(255)
    ,ESTATE_DESCRIPTION               LONGTEXT
    ,NUMBER_OWNERS                    VARCHAR(128)
    ,SPATIAL_EXTENTS_SHARED           VARCHAR(128)
    ,KEY(ROWID)
);
CREATE TABLE IF NOT EXISTS DQ.DQPropertyTitle
(
    ROWID                                   INT
    ,WKT_CHECK                              INT
    ,ID_CHECK                               INT
    ,TITLE_NO_CHECK                         INT
    ,STATUS_CHECK                           INT
    ,TYPE_CHECK                             INT
    ,LAND_DISTRICT_CHECK                    INT
    ,ISSUE_DATE_CHECK                       INT
    ,GUARANTEE_STATUS_CHECK                 INT
    ,ESTATE_DESCRIPTION_CHECK               INT
    ,NUMBER_OWNERS_CHECK                    INT
    ,SPATIAL_EXTENTS_SHARED_CHECK           INT
    ,VALID                                  INT

    ,KEY(ROWID)
);

CREATE TABLE IF NOT EXISTS ETL.ETLPropertyTitle
(
    PropertyTitleKey                    INT
    ,WKT                                MULTIPOLYGON
    ,ID                                 INT
    ,TitleNo                            VARCHAR(255)
    ,Status                             VARCHAR(128)
    ,Type                               VARCHAR(128)
    ,LandDistrict                       VARCHAR(128)
    ,IssueDate                          DATETIME
    ,GuaranteeStatus                    VARCHAR(128)
    ,EstateDescription                  LONGTEXT
    ,NumberOwners                       INT
    ,SpatialExtentsShared               VARCHAR(64)

    ,KEY(PropertyTitleKey)
);

CREATE TABLE IF NOT EXISTS DataWH.DimPropertyTitle
(
    PropertyTitleKey                    INT
    ,ID                                 INT
    ,TitleNo                            VARCHAR(255)
    ,Status                             VARCHAR(128)
    ,Type                               VARCHAR(128)
    ,LandDistrict                       VARCHAR(128)
    ,IssueDate                          DATETIME
    ,GuaranteeStatus                    VARCHAR(128)
    ,EstateDescription                  LONGTEXT
    ,NumberOwners                       INT
    ,SpatialExtentsShared               VARCHAR(64)

    ,KEY(PropertyTitleKey)
    ,INDEX IDIdx(ID)
    ,INDEX TitleNoIdx(TitleNo)

);


CREATE TABLE IF NOT EXISTS DataWH.DimTitleBoundary
(
    TitleBoundaryKey                    INT
    ,WKT                                MULTIPOLYGON
    ,ID                                 INT

    ,KEY(TitleBoundaryKey)
    ,INDEX IDIdx(ID)

);