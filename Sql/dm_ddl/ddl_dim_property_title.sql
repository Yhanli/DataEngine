CREATE TABLE IF NOT EXISTS `STAGE`.`StagePropertyTitle`
(
    `FILENAME`                          VARCHAR(200)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT

    ,`WKT`                              LONGTEXT
    ,`ID`                               VARCHAR(100)
    ,`TITLE_NO`                         VARCHAR(200)
    ,`STATUS`                           VARCHAR(200)
    ,`TYPE`                             VARCHAR(200)
    ,`LAND_DISTRICT`                    VARCHAR(200)
    ,`ISSUE_DATE`                       VARCHAR(200)
    ,`GUARANTEE_STATUS`                 VARCHAR(200)
    ,`ESTATE_DESCRIPTION`               LONGTEXT
    ,`NUMBER_OWNERS`                    VARCHAR(100)
    ,`SPATIAL_EXTENTS_SHARED`           VARCHAR(100)
    ,KEY(`ROWID`)
);
CREATE TABLE IF NOT EXISTS `DQ`.`DQPropertyTitle`
(
    `FILENAME`                          VARCHAR(200)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT

    ,`WKT`                              LONGTEXT
    ,`ID`                               VARCHAR(100)
    ,`TITLE_NO`                         VARCHAR(200)
    ,`STATUS`                           VARCHAR(200)
    ,`TYPE`                             VARCHAR(200)
    ,`LAND_DISTRICT`                    VARCHAR(200)
    ,`ISSUE_DATE`                       VARCHAR(200)
    ,`GUARANTEE_STATUS`                 VARCHAR(200)
    ,`ESTATE_DESCRIPTION`               LONGTEXT
    ,`NUMBER_OWNERS`                    VARCHAR(100)
    ,`SPATIAL_EXTENTS_SHARED`           VARCHAR(100)
    ,KEY(`ROWID`)
);

