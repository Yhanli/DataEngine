CREATE TABLE IF NOT EXISTS `STAGE`.`StageStreetAddress`
(
    `FILENAME`                          VARCHAR(200)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT

    ,`WKT`                              LONGTEXT
    ,`ADDRESS_ID`                       VARCHAR(100)
    ,`CHANGE_ID`                        VARCHAR(200)
    ,`ADDRESS_TYPE`                     VARCHAR(200)
    ,`UNIT_VALUE`                       VARCHAR(200)
    ,`ADDRESS_NUMBER`                   VARCHAR(100)
    ,`ADDRESS_NUMBER_SUFFIX`            VARCHAR(100)
    ,`ADDRESS_NUMBER_HIGH`              VARCHAR(200)
    ,`WATER_ROUTE_NAME`                 VARCHAR(200)
    ,`WATER_NAME`                       VARCHAR(200)
    ,`SUBURB_LOCALITY`                  VARCHAR(200)
    ,`TOWN_CITY`                        VARCHAR(100)
    ,`FULL_ADDRESS_NUMBER`              VARCHAR(100)
    ,`FULL_ROAD_NAME`                   VARCHAR(100)
    ,`FULL_ADDRESS`                     VARCHAR(100)
    ,`ROAD_SECTION_ID`                  VARCHAR(100)
    ,`GD2000_XCOORD`                    VARCHAR(100)
    ,`GD2000_YCOORD`                    VARCHAR(100)
    ,`WATER_ROUTE_NAME_ASCII`           VARCHAR(100)
    ,`WATER_NAME_ASCII`                 VARCHAR(200)
    ,`SUBURB_LOCALITY_ASCII`            VARCHAR(200)
    ,`TOWN_CITY_ASCII`                  VARCHAR(200)
    ,`FULL_ROAD_NAME_ASCII`             VARCHAR(100)
    ,`FULL_ADDRESS_ASCII`               VARCHAR(100)
    ,`SHAPE_X`                          VARCHAR(200)
    ,`SHAPE_Y`                          VARCHAR(200)
    ,KEY(`ROWID`)
);
CREATE TABLE IF NOT EXISTS `DQ`.`DQStreetAddress`
(
    `FILENAME`                          VARCHAR(200)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT

    ,`WKT`                              LONGTEXT
    ,`ADDRESS_ID`                       VARCHAR(100)
    ,`CHANGE_ID`                        VARCHAR(200)
    ,`ADDRESS_TYPE`                     VARCHAR(200)
    ,`UNIT_VALUE`                       VARCHAR(200)
    ,`ADDRESS_NUMBER`                   VARCHAR(100)
    ,`ADDRESS_NUMBER_SUFFIX`            VARCHAR(100)
    ,`ADDRESS_NUMBER_HIGH`              VARCHAR(200)
    ,`WATER_ROUTE_NAME`                 VARCHAR(200)
    ,`WATER_NAME`                       VARCHAR(200)
    ,`SUBURB_LOCALITY`                  VARCHAR(200)
    ,`TOWN_CITY`                        VARCHAR(100)
    ,`FULL_ADDRESS_NUMBER`              VARCHAR(100)
    ,`FULL_ROAD_NAME`                   VARCHAR(100)
    ,`FULL_ADDRESS`                     VARCHAR(100)
    ,`ROAD_SECTION_ID`                  VARCHAR(100)
    ,`GD2000_XCOORD`                    VARCHAR(100)
    ,`GD2000_YCOORD`                    VARCHAR(100)
    ,`WATER_ROUTE_NAME_ASCII`           VARCHAR(100)
    ,`WATER_NAME_ASCII`                 VARCHAR(200)
    ,`SUBURB_LOCALITY_ASCII`            VARCHAR(200)
    ,`TOWN_CITY_ASCII`                  VARCHAR(200)
    ,`FULL_ROAD_NAME_ASCII`             VARCHAR(100)
    ,`FULL_ADDRESS_ASCII`               VARCHAR(100)
    ,`SHAPE_X`                          VARCHAR(200)
    ,`SHAPE_Y`                          VARCHAR(200)

    ,KEY(`ROWID`)
);

