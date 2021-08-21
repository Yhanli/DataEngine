CREATE TABLE IF NOT EXISTS `STAGE`.`StageStreetAddress`
(
    `FILENAME`                          VARCHAR(50)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT

    ,`WKT`                              VARCHAR(20)
    ,`ADDRESS_ID`                       VARCHAR(10)
    ,`CHANGE_ID`                        VARCHAR(20)
    ,`ADDRESS_TYPE`                     VARCHAR(20)
    ,`UNIT_VALUE`                       VARCHAR(20)
    ,`ADDRESS_NUMBER`                   VARCHAR(10)
    ,`ADDRESS_NUMBER_SUFFIX`            VARCHAR(10)
    ,`ADDRESS_NUMBER_HIGH`              VARCHAR(20)
    ,`WATER_ROUTE_NAME`                 VARCHAR(20)
    ,`WATER_NAME`                       VARCHAR(20)
    ,`SUBURB_LOCALITY`                  VARCHAR(20)
    ,`TOWN_CITY`                        VARCHAR(10)
    ,`FULL_ADDRESS_NUMBER`              VARCHAR(10)
    ,`FULL_ROAD_NAME`                   VARCHAR(100)
    ,`FULL_ADDRESS`                     VARCHAR(100)
    ,`ROAD_SECTION_ID`                  VARCHAR(10)
    ,`GD2000_XCOORD`                    VARCHAR(10)
    ,`GD2000_YCOORD`                    VARCHAR(10)
    ,`WATER_ROUTE_NAME_ASCII`           VARCHAR(100)
    ,`WATER_NAME_ASCII`                 VARCHAR(20)
    ,`SUBURB_LOCALITY_ASCII`            VARCHAR(20)
    ,`TOWN_CITY_ASCII`                  VARCHAR(20)
    ,`FULL_ROAD_NAME_ASCII`             VARCHAR(100)
    ,`FULL_ADDRESS_ASCII`               VARCHAR(100)
    ,`SHAPE_X`                          VARCHAR(20)
    ,`SHAPE_Y`                          VARCHAR(20)

    ,KEY(`ROWID`)
);
CREATE TABLE IF NOT EXISTS `DQ`.`DQStreetAddress`
(
    `FILENAME`                          VARCHAR(50)
    ,`BATCHDATEKEY`                     INT
    ,`ROWID`                            INT AUTO_INCREMENT

    ,`WKT`                              VARCHAR(20)
    ,`ADDRESS_ID`                       VARCHAR(10)
    ,`CHANGE_ID`                        VARCHAR(20)
    ,`ADDRESS_TYPE`                     VARCHAR(20)
    ,`UNIT_VALUE`                       VARCHAR(20)
    ,`ADDRESS_NUMBER`                   VARCHAR(10)
    ,`ADDRESS_NUMBER_SUFFIX`            VARCHAR(10)
    ,`ADDRESS_NUMBER_HIGH`              VARCHAR(20)
    ,`WATER_ROUTE_NAME`                 VARCHAR(20)
    ,`SUBURB_LOCALITY`                  VARCHAR(20)
    ,`TOWN_CITY`                        VARCHAR(10)
    ,`FULL_ADDRESS_NUMBER`              VARCHAR(10)
    ,`FULL_ROAD_NAME`                   VARCHAR(100)
    ,`FULL_ADDRESS`                     VARCHAR(100)
    ,`ROAD_SECTION_ID`                  VARCHAR(10)
    ,`GD2000_XCOORD`                    VARCHAR(10)
    ,`GD2000_YCOORD`                    VARCHAR(10)
    ,`WATER_ROUTE_NAME_ASCII`           VARCHAR(100)
    ,`WATER_NAME_ASCII`                 VARCHAR(20)
    ,`SUBURB_LOCALITY_ASCII`            VARCHAR(20)
    ,`TOWN_CITY_ASCII`                  VARCHAR(20)
    ,`FULL_ROAD_NAME_ASCII`             VARCHAR(100)
    ,`FULL_ADDRESS_ASCII`               VARCHAR(100)
    ,`SHAPE_X`                          VARCHAR(20)
    ,`SHAPE_Y`                          VARCHAR(20)

    ,KEY(`ROWID`)
);

