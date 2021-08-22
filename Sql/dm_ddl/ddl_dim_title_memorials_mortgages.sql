CREATE TABLE IF NOT EXISTS `STAGE`.`StageTitleMemorialsMortgages`
(
    `FILENAME`                          VARCHAR(200)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT

    ,`ID`                               VARCHAR(100)
    ,`TITLE_NO`                         VARCHAR(200)
    ,`LAND_DISTRICT`                    VARCHAR(200)
    ,`MEMORIAL_TEXT`                    MEDIUMTEXT
    ,`CURRENT`                          VARCHAR(10)
    ,`INSTRUMENT_NUMBER`                VARCHAR(100)
    ,`INSTRUMENT_LODGED_DATETIME`       VARCHAR(100)
    ,`INSTRUMENT_TYPE`                  VARCHAR(200)
    ,`ENCUMBRANCEES`                    TEXT


    ,KEY(`ROWID`)
);
CREATE TABLE IF NOT EXISTS `DQ`.`DQTitleMemorialsMortgages`
(
    `FILENAME`                          VARCHAR(200)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT

    ,`ID`                               VARCHAR(100)
    ,`TITLE_NO`                         VARCHAR(200)
    ,`LAND_DISTRICT`                    VARCHAR(200)
    ,`MEMORIAL_TEXT`                    MEDIUMTEXT
    ,`CURRENT`                          VARCHAR(10)
    ,`INSTRUMENT_NUMBER`                VARCHAR(100)
    ,`INSTRUMENT_LODGED_DATETIME`       VARCHAR(100)
    ,`INSTRUMENT_TYPE`                  VARCHAR(200)
    ,`ENCUMBRANCEES`                    TEXT

    ,KEY(`ROWID`)
);

