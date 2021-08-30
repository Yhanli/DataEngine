CREATE TABLE IF NOT EXISTS STAGE.StageStreetAddress
(
    FILENAME                          VARCHAR(255)
    ,BATCHDATEKEY                     INT
    ,ROWID                            INT AUTO_INCREMENT

    ,WKT                              LONGTEXT
    ,ADDRESS_ID                       VARCHAR(128)
    ,CHANGE_ID                        VARCHAR(255)
    ,ADDRESS_TYPE                     VARCHAR(255)
    ,UNIT_VALUE                       VARCHAR(255)
    ,ADDRESS_NUMBER                   VARCHAR(128)
    ,ADDRESS_NUMBER_SUFFIX            VARCHAR(128)
    ,ADDRESS_NUMBER_HIGH              VARCHAR(255)
    ,WATER_ROUTE_NAME                 VARCHAR(255)
    ,WATER_NAME                       VARCHAR(255)
    ,SUBURB_LOCALITY                  VARCHAR(255)
    ,TOWN_CITY                        VARCHAR(128)
    ,FULL_ADDRESS_NUMBER              VARCHAR(128)
    ,FULL_ROAD_NAME                   VARCHAR(128)
    ,FULL_ADDRESS                     VARCHAR(128)
    ,ROAD_SECTION_ID                  VARCHAR(128)
    ,GD2000_XCOORD                    VARCHAR(128)
    ,GD2000_YCOORD                    VARCHAR(128)
    ,WATER_ROUTE_NAME_ASCII           VARCHAR(128)
    ,WATER_NAME_ASCII                 VARCHAR(255)
    ,SUBURB_LOCALITY_ASCII            VARCHAR(255)
    ,TOWN_CITY_ASCII                  VARCHAR(255)
    ,FULL_ROAD_NAME_ASCII             VARCHAR(128)
    ,FULL_ADDRESS_ASCII               VARCHAR(128)
    ,SHAPE_X                          VARCHAR(255)
    ,SHAPE_Y                          VARCHAR(255)
    ,KEY(ROWID)
);

CREATE TABLE IF NOT EXISTS DQ.DQStreetAddress
(
    ROWID                                   INT

    ,WKT_CHECK                              INT
    ,ADDRESS_ID_CHECK                       INT
    ,CHANGE_ID_CHECK                        INT
    ,ADDRESS_TYPE_CHECK                     INT
    ,UNIT_VALUE_CHECK                       INT
    ,ADDRESS_NUMBER_CHECK                   INT
    ,ADDRESS_NUMBER_SUFFIX_CHECK            INT
    ,ADDRESS_NUMBER_HIGH_CHECK              INT
    ,WATER_ROUTE_NAME_CHECK                 INT
    ,WATER_NAME_CHECK                       INT
    ,SUBURB_LOCALITY_CHECK                  INT
    ,TOWN_CITY_CHECK                        INT
    ,FULL_ADDRESS_NUMBER_CHECK              INT
    ,FULL_ROAD_NAME_CHECK                   INT
    ,FULL_ADDRESS_CHECK                     INT
    ,ROAD_SECTION_ID_CHECK                  INT
    ,GD2000_XCOORD_CHECK                    INT
    ,GD2000_YCOORD_CHECK                    INT
    ,WATER_ROUTE_NAME_ASCII_CHECK           INT
    ,WATER_NAME_ASCII_CHECK                 INT
    ,SUBURB_LOCALITY_ASCII_CHECK            INT
    ,TOWN_CITY_ASCII_CHECK                  INT
    ,FULL_ROAD_NAME_ASCII_CHECK             INT
    ,FULL_ADDRESS_ASCII_CHECK               INT
    ,SHAPE_X_CHECK                          INT
    ,SHAPE_Y_CHECK                          INT
    ,VALID                                  INT

    ,KEY(ROWID)
);

CREATE TABLE IF NOT EXISTS ETL.ETLStreetAddress
(
    StreetAddressKey                        INT
    ,WKT                                    POINT
    ,AddressID                              INT
    ,ChangeID                               INT
    ,AddressType                            VARCHAR(128)
    ,UnitValue                              INT
    ,AddressNumber                          VARCHAR(128)
    ,AddressNumberSuffix                    VARCHAR(128)
    ,AddressNumberHigh                      VARCHAR(128)
    ,WaterRouteName                         VARCHAR(128)
    ,WaterName                              VARCHAR(128)
    ,SuburbLocality                         VARCHAR(128)
    ,TownCity                               VARCHAR(128)
    ,FullAddressNumber                      VARCHAR(128)
    ,FullRoadName                           VARCHAR(128)
    ,FullAddress                            VARCHAR(255)
    ,RoadSectionID                          INT
    ,GD2000Xcoord                           VARCHAR(128)
    ,GD2000Ycoord                           VARCHAR(128)
    ,WaterRouteNameAscii                    VARCHAR(128)
    ,WaterNameAscii                         VARCHAR(128)
    ,SuburbLocalityAscii                    VARCHAR(128)
    ,TownCityAscii                          VARCHAR(128)
    ,FullRoadNameAscii                      VARCHAR(128)
    ,FullAddressAscii                       VARCHAR(255)
    ,ShapeX                                 VARCHAR(128)
    ,ShapeY                                 VARCHAR(128)

    ,KEY(StreetAddressKey)
);

CREATE TABLE IF NOT EXISTS DataWH.DimSuburbTown #Distinct the SuburbTown
(
    SuburbTownKey                           INT AUTO_INCREMENT
    ,SuburbLocality                         VARCHAR(128)
    ,TownCity                               VARCHAR(128)

    ,KEY(SuburbTownKey)
    ,INDEX SuburbTownIdx(SuburbLocality,TownCity)

);

CREATE TABLE IF NOT EXISTS DataWH.DimStreetRoad #Distinct the FullRoadName
(
    StreetRoadKey                           INT AUTO_INCREMENT
    ,FullRoadName                           VARCHAR(128)
    ,RoadSectionID                          INT
    ,SuburbTownKey                          INT
    ,KEY(StreetRoadKey)
    ,INDEX FullRoadNameIdx(FullRoadName,RoadSectionID)

);

CREATE TABLE IF NOT EXISTS DataWH.DimAddressInfo
(
    AddressInfoKey                          INT AUTO_INCREMENT
    ,WKT                                    POINT
    ,AddressID                              INT
    ,AddressType                            VARCHAR(128)
    ,UnitValue                              INT
    ,AddressNumber                          VARCHAR(128)
    ,AddressNumberSuffix                    VARCHAR(128)
    ,AddressNumberHigh                      VARCHAR(128)
    ,WaterRouteName                         VARCHAR(128)
    ,WaterName                              VARCHAR(128)
    ,FullAddressNumber                      VARCHAR(128)
    ,FullAddress                            VARCHAR(255)
    ,GD2000XCoord                           VARCHAR(128)
    ,GD2000YCoord                           VARCHAR(128)

    ,KEY(AddressInfoKey)
    ,INDEX AddressIDIdx(AddressID)
);

CREATE TABLE IF NOT EXISTS DataWH.DimStreetAddress
(
    StreetAddressKey                        INT
    ,AddressID                              INT
    ,ChangeID                               INT
    ,StreetRoadKey                          INT
    ,SuburbTownKey                          INT

    ,KEY(StreetAddressKey)
    ,INDEX AddressIDIdx(AddressID)
);