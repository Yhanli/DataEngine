CREATE TABLE IF NOT EXISTS `STAGE`.`StagePropertyTitleWithOwner`
(
    `FILENAME`                          VARCHAR(200)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT

    ,`WKT`                              LONGTEXT
    ,`ID`                               VARCHAR(100)
    ,`TITLE_NO`                         VARCHAR(200)
    ,`STATUS`                           VARCHAR(100)
    ,`TYPE`                             VARCHAR(100)
    ,`LAND_DISTRICT`                    VARCHAR(200)
    ,`ISSUE_DATE`                       VARCHAR(100)
    ,`GUARANTEE_STATUS`                 VARCHAR(100)
    ,`ESTATE_DESCRIPTION`               LONGTEXT
    ,`OWNERS`                           LONGTEXT
    ,`SPATIAL_EXTENTS_SHARED`           VARCHAR(100)
    ,KEY(`ROWID`)
);
CREATE TABLE IF NOT EXISTS `DQ`.`DQPropertyTitleWithOwner`
(
    `FILENAME`                          VARCHAR(200)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT

    ,`WKT`                              LONGTEXT
    ,`ID`                               VARCHAR(100)
    ,`TITLE_NO`                         VARCHAR(200)
    ,`STATUS`                           VARCHAR(100)
    ,`TYPE`                             VARCHAR(100)
    ,`LAND_DISTRICT`                    VARCHAR(200)
    ,`ISSUE_DATE`                       VARCHAR(100)
    ,`GUARANTEE_STATUS`                 VARCHAR(100)
    ,`ESTATE_DESCRIPTION`               LONGTEXT
    ,`OWNERS`                           LONGTEXT
    ,`SPATIAL_EXTENTS_SHARED`           VARCHAR(100)
    ,KEY(`ROWID`)
);

