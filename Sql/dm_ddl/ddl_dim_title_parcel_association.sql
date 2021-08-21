CREATE TABLE IF NOT EXISTS `STAGE`.`StageTitleParcelAssociation`
(
    `FILENAME`                          VARCHAR(50)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT

    ,`ID`                               VARCHAR(10)
    ,`TITLE_NO`                         VARCHAR(20)
    ,`PAR_ID`                           VARCHAR(10)
    ,`SOURCE`                           VARCHAR(20)

    ,KEY(`ROWID`)
);
CREATE TABLE IF NOT EXISTS `DQ`.`StageTitleParcelAssociation`
(
    `FILENAME`                          VARCHAR(50)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT

    ,`ID`                               VARCHAR(10)
    ,`TITLE_NO`                         VARCHAR(20)
    ,`PAR_ID`                           VARCHAR(10)
    ,`SOURCE`                           VARCHAR(20)

    ,KEY(`ROWID`)
);

