TRUNCATE TABLE DQ.DQStreetAddress;
INSERT INTO DQ.DQStreetAddress
(
    ROWID
    ,WKT_CHECK
    ,ADDRESS_ID_CHECK
    ,CHANGE_ID_CHECK
    ,ADDRESS_TYPE_CHECK
    ,UNIT_VALUE_CHECK
    ,ADDRESS_NUMBER_CHECK
    ,ADDRESS_NUMBER_SUFFIX_CHECK
    ,ADDRESS_NUMBER_HIGH_CHECK
    ,WATER_ROUTE_NAME_CHECK
    ,WATER_NAME_CHECK
    ,SUBURB_LOCALITY_CHECK
    ,TOWN_CITY_CHECK
    ,FULL_ADDRESS_NUMBER_CHECK
    ,FULL_ROAD_NAME_CHECK
    ,FULL_ADDRESS_CHECK
    ,ROAD_SECTION_ID_CHECK
    ,GD2000_XCOORD_CHECK
    ,GD2000_YCOORD_CHECK
    ,WATER_ROUTE_NAME_ASCII_CHECK
    ,WATER_NAME_ASCII_CHECK
    ,SUBURB_LOCALITY_ASCII_CHECK
    ,TOWN_CITY_ASCII_CHECK
    ,FULL_ROAD_NAME_ASCII_CHECK
    ,FULL_ADDRESS_ASCII_CHECK
    ,SHAPE_X_CHECK
    ,SHAPE_Y_CHECK
    ,VALID
)
SELECT
       ROWID
     ,@WKT_CHECK:=(                             CASE 	WHEN WKT IS NULL THEN 1
                                                        WHEN WKT = '' THEN 1
                                                        WHEN WKT = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@ADDRESS_ID_CHECK:=(                      CASE 	WHEN ADDRESS_ID IS NULL THEN 1
                                                        WHEN ADDRESS_ID = '' THEN 1
                                                        WHEN ADDRESS_ID = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@CHANGE_ID_CHECK:=(                       CASE 	WHEN CHANGE_ID IS NULL THEN 1
                                                        WHEN CHANGE_ID = '' THEN 1
                                                        WHEN CHANGE_ID = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@ADDRESS_TYPE_CHECK:=(                    CASE 	WHEN ADDRESS_TYPE IS NULL THEN 1
                                                        WHEN ADDRESS_TYPE = '' THEN 1
                                                        WHEN ADDRESS_TYPE = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@UNIT_VALUE_CHECK:=(                      CASE 	WHEN UNIT_VALUE IS NULL THEN 1
                                                        WHEN UNIT_VALUE = '' THEN 1
                                                        WHEN UNIT_VALUE = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@ADDRESS_NUMBER_CHECK:=(                  CASE 	WHEN ADDRESS_NUMBER IS NULL THEN 1
                                                        WHEN ADDRESS_NUMBER = '' THEN 1
                                                        WHEN ADDRESS_NUMBER = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@ADDRESS_NUMBER_SUFFIX_CHECK:=(           CASE 	WHEN ADDRESS_NUMBER_SUFFIX IS NULL THEN 1
                                                        WHEN ADDRESS_NUMBER_SUFFIX = '' THEN 1
                                                        WHEN ADDRESS_NUMBER_SUFFIX = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@ADDRESS_NUMBER_HIGH_CHECK:=(             CASE 	WHEN ADDRESS_NUMBER_HIGH IS NULL THEN 1
                                                        WHEN ADDRESS_NUMBER_HIGH = '' THEN 1
                                                        WHEN ADDRESS_NUMBER_HIGH = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@WATER_ROUTE_NAME_CHECK:=(                CASE 	WHEN WATER_ROUTE_NAME IS NULL THEN 1
                                                        WHEN WATER_ROUTE_NAME = '' THEN 1
                                                        WHEN WATER_ROUTE_NAME = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@WATER_NAME_CHECK:=(                      CASE 	WHEN WATER_NAME IS NULL THEN 1
                                                        WHEN WATER_NAME = '' THEN 1
                                                        WHEN WATER_NAME = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@SUBURB_LOCALITY_CHECK:=(                 CASE 	WHEN SUBURB_LOCALITY IS NULL THEN 1
                                                        WHEN SUBURB_LOCALITY = '' THEN 1
                                                        WHEN SUBURB_LOCALITY = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@TOWN_CITY_CHECK:=(                       CASE 	WHEN TOWN_CITY IS NULL THEN 1
                                                        WHEN TOWN_CITY = '' THEN 1
                                                        WHEN TOWN_CITY = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@FULL_ADDRESS_NUMBER_CHECK:=(             CASE 	WHEN FULL_ADDRESS_NUMBER IS NULL THEN 1
                                                        WHEN FULL_ADDRESS_NUMBER = '' THEN 1
                                                        WHEN FULL_ADDRESS_NUMBER = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@FULL_ROAD_NAME_CHECK:=(                  CASE 	WHEN FULL_ROAD_NAME IS NULL THEN 1
                                                        WHEN FULL_ROAD_NAME = '' THEN 1
                                                        WHEN FULL_ROAD_NAME = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@FULL_ADDRESS_CHECK:=(                    CASE 	WHEN FULL_ADDRESS IS NULL THEN 1
                                                        WHEN FULL_ADDRESS = '' THEN 1
                                                        WHEN FULL_ADDRESS = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@ROAD_SECTION_ID_CHECK:=(                 CASE 	WHEN ROAD_SECTION_ID IS NULL THEN 1
                                                        WHEN ROAD_SECTION_ID = '' THEN 1
                                                        WHEN ROAD_SECTION_ID = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@GD2000_XCOORD_CHECK:=(                   CASE 	WHEN GD2000_XCOORD IS NULL THEN 1
                                                        WHEN GD2000_XCOORD = '' THEN 1
                                                        WHEN GD2000_XCOORD = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@GD2000_YCOORD_CHECK:=(                   CASE 	WHEN GD2000_YCOORD IS NULL THEN 1
                                                        WHEN GD2000_YCOORD = '' THEN 1
                                                        WHEN GD2000_YCOORD = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@WATER_ROUTE_NAME_ASCII_CHECK:=(          CASE 	WHEN WATER_ROUTE_NAME_ASCII IS NULL THEN 1
                                                        WHEN WATER_ROUTE_NAME_ASCII = '' THEN 1
                                                        WHEN WATER_ROUTE_NAME_ASCII = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@WATER_NAME_ASCII_CHECK:=(                CASE 	WHEN WATER_NAME_ASCII IS NULL THEN 1
                                                        WHEN WATER_NAME_ASCII = '' THEN 1
                                                        WHEN WATER_NAME_ASCII = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@SUBURB_LOCALITY_ASCII_CHECK:=(           CASE 	WHEN SUBURB_LOCALITY_ASCII IS NULL THEN 1
                                                        WHEN SUBURB_LOCALITY_ASCII = '' THEN 1
                                                        WHEN SUBURB_LOCALITY_ASCII = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@TOWN_CITY_ASCII_CHECK:=(                 CASE 	WHEN TOWN_CITY_ASCII IS NULL THEN 1
                                                        WHEN TOWN_CITY_ASCII = '' THEN 1
                                                        WHEN TOWN_CITY_ASCII = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@FULL_ROAD_NAME_ASCII_CHECK:=(            CASE 	WHEN FULL_ROAD_NAME_ASCII IS NULL THEN 1
                                                        WHEN FULL_ROAD_NAME_ASCII = '' THEN 1
                                                        WHEN FULL_ROAD_NAME_ASCII = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@FULL_ADDRESS_ASCII_CHECK:=(              CASE 	WHEN FULL_ADDRESS_ASCII IS NULL THEN 1
                                                        WHEN FULL_ADDRESS_ASCII = '' THEN 1
                                                        WHEN FULL_ADDRESS_ASCII = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@SHAPE_X_CHECK:=(                         CASE 	WHEN SHAPE_X IS NULL THEN 1
                                                        WHEN SHAPE_X = '' THEN 1
                                                        WHEN SHAPE_X = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@SHAPE_Y_CHECK:=(                         CASE 	WHEN SHAPE_Y IS NULL THEN 1
                                                        WHEN SHAPE_Y = '' THEN 1
                                                        WHEN SHAPE_Y = 'NULL' THEN 1
                                                        ELSE 0
    END)


     ,(@WKT_CHECK + @ADDRESS_ID_CHECK + @CHANGE_ID_CHECK + @FULL_ADDRESS_CHECK + @SHAPE_Y_CHECK
    + @SHAPE_Y_CHECK + @SUBURB_LOCALITY_CHECK) = 0
FROM STAGE.StageStreetAddress
;