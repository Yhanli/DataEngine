CREATE TABLE IF NOT EXISTS `STAGE`.`StageTitleAddress`
(
    `FILENAME`                          VARCHAR(50)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT

    ,`CERTIFICATEOFTITLE`               VARCHAR(20)
    ,`FULLADDRESS`                      VARCHAR(100)
    ,`ADDRESS`                          VARCHAR(100)
    ,`EXTERNALSUBURB`                   VARCHAR(20)

    ,KEY(`ROWID`)
);
CREATE TABLE IF NOT EXISTS `DQ`.`DQTitleAddress`
(
    `FILENAME`                          VARCHAR(50)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT

    ,`CERTIFICATEOFTITLE`               VARCHAR(20)
    ,`FULLADDRESS`                      VARCHAR(100)
    ,`ADDRESS`                          VARCHAR(100)
    ,`EXTERNALSUBURB`                   VARCHAR(20)

    ,KEY(`ROWID`)
);

