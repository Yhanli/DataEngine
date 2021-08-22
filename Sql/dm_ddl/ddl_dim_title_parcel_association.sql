CREATE TABLE IF NOT EXISTS `STAGE`.`StageTitleParcelAssociation`
(
    `FILENAME`                          VARCHAR(200)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT

    ,`ID`                               VARCHAR(100)
    ,`TITLE_NO`                         VARCHAR(200)
    ,`PAR_ID`                           VARCHAR(100)
    ,`SOURCE`                           VARCHAR(200)

    ,KEY(`ROWID`)
);
CREATE TABLE IF NOT EXISTS `DQ`.`StageTitleParcelAssociation`
(
    `FILENAME`                          VARCHAR(200)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT

    ,`ID`                               VARCHAR(100)
    ,`TITLE_NO`                         VARCHAR(200)
    ,`PAR_ID`                           VARCHAR(100)
    ,`SOURCE`                           VARCHAR(200)

    ,KEY(`ROWID`)
);

