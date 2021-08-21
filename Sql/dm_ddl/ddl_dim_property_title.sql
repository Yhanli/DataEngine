CREATE TABLE IF NOT EXISTS `STAGE`.`StagePropertyTitle`
(
    `FILENAME`                          VARCHAR(50)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT

    ,`WKT`                              TEXT
    ,`ID`                               VARCHAR(10)
    ,`TITLE_NO`                         VARCHAR(20)
    ,`STATUS`                           VARCHAR(20)
    ,`TYPE`                             VARCHAR(20)
    ,`LAND_DISTRICT`                    VARCHAR(20)
    ,`ISSUE_DATE`                       VARCHAR(20)
    ,`GUARANTEE_STATUS`                 VARCHAR(10)
    ,`ESTATE_DESCRIPTION`               VARCHAR(100)
    ,`NUMBER_OWNERS`                    VARCHAR(10)
    ,`SPATIAL_EXTENTS_SHARED`           VARCHAR(10)
    ,KEY(`ROWID`)
);
CREATE TABLE IF NOT EXISTS `DQ`.`DQPropertyTitle`
(
    `FILENAME`                          VARCHAR(50)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT

    ,`WKT`                              TEXT
    ,`ID`                               VARCHAR(10)
    ,`TITLE_NO`                         VARCHAR(20)
    ,`STATUS`                           VARCHAR(20)
    ,`TYPE`                             VARCHAR(20)
    ,`LAND_DISTRICT`                    VARCHAR(20)
    ,`ISSUE_DATE`                       VARCHAR(20)
    ,`GUARANTEE_STATUS`                 VARCHAR(10)
    ,`ESTATE_DESCRIPTION`               VARCHAR(100)
    ,`NUMBER_OWNERS`                    VARCHAR(10)
    ,`SPATIAL_EXTENTS_SHARED`           VARCHAR(10)
    ,KEY(`ROWID`)
);

