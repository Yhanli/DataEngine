CREATE TABLE IF NOT EXISTS `STAGE`.`StageTitleAddress`
(
    `FILENAME`                          VARCHAR(200)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT

    ,`CERTIFICATEOFTITLE`               VARCHAR(500)
    ,`FULLADDRESS`                      VARCHAR(100)
    ,`ADDRESS`                          VARCHAR(100)
    ,`EXTERNALSUBURB`                   VARCHAR(200)

    ,KEY(`ROWID`)
);
CREATE TABLE IF NOT EXISTS `DQ`.`DQTitleAddress`
(
    `FILENAME`                          VARCHAR(200)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT

    ,`CERTIFICATEOFTITLE`               VARCHAR(500)
    ,`FULLADDRESS`                      VARCHAR(100)
    ,`ADDRESS`                          VARCHAR(100)
    ,`EXTERNALSUBURB`                   VARCHAR(200)

    ,KEY(`ROWID`)
);

