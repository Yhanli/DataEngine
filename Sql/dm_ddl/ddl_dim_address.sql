CREATE TABLE IF NOT EXISTS `STAGE`.`StageAddress`
(
    `FILENAME`                          VARCHAR(50)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT
    ,`ADDRESS_ID`                       VARCHAR(10)
    ,`CHANGE_ID`                        VARCHAR(10)
    ,`PRIMARY_ADDRESS_ID`                  VARCHAR(200)
    ,`ADDRESS_LIFECYCLE_STAGE`          VARCHAR(10)
    ,`ADDRESS_PROVIDER`                 VARCHAR(10)
    ,`ADDRESS_MANAGER`                  VARCHAR(10)
    ,`ADDRESSABLE_OBJECT_ID`            VARCHAR(10)
    ,`ADDRESS_CLASS`                    VARCHAR(10)
    ,`PARCEL_ID`                        VARCHAR(10)
    ,KEY(`ROWID`)
);
CREATE TABLE IF NOT EXISTS `DQ`.`DQAddress`
(
    `FILENAME`                          VARCHAR(50)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT
    ,`ADDRESS_ID`                       VARCHAR(10)
    ,`CHANGE_ID`                        VARCHAR(10)
    ,`PRIMARY_ADDRESS_ID`                  VARCHAR(200)
    ,`ADDRESS_LIFECYCLE_STAGE`          VARCHAR(10)
    ,`ADDRESS_PROVIDER`                 VARCHAR(10)
    ,`ADDRESS_MANAGER`                  VARCHAR(10)
    ,`ADDRESSABLE_OBJECT_ID`            VARCHAR(10)
    ,`ADDRESS_CLASS`                    VARCHAR(10)
    ,`PARCEL_ID`                        VARCHAR(10)
    ,KEY(`ROWID`)
);

