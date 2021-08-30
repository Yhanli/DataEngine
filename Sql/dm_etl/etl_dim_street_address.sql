TRUNCATE TABLE ETL.ETLStreetAddress;
INSERT INTO ETL.ETLStreetAddress
(
    StreetAddressKey
    ,WKT
    ,AddressID
    ,ChangeID
    ,AddressType
    ,UnitValue
    ,AddressNumber
    ,AddressNumberSuffix
    ,AddressNumberHigh
    ,WaterRouteName
    ,WaterName
    ,SuburbLocality
    ,TownCity
    ,FullAddressNumber
    ,FullRoadName
    ,FullAddress
    ,RoadSectionID
    ,GD2000Xcoord
    ,GD2000Ycoord
    ,WaterRouteNameAscii
    ,WaterNameAscii
    ,SuburbLocalityAscii
    ,TownCityAscii
    ,FullRoadNameAscii
    ,FullAddressAscii
    ,ShapeX
    ,ShapeY
)
SELECT

    st.ROWID

    ,ST_GeomFromText(WKT)
    ,CAST(ADDRESS_ID AS UNSIGNED)
    ,CAST(CHANGE_ID AS UNSIGNED)
    ,ADDRESS_TYPE
    , IF(UNIT_VALUE = 'NULL', 0, CAST(UNIT_VALUE AS UNSIGNED))
    ,ADDRESS_NUMBER
    ,ADDRESS_NUMBER_SUFFIX
    ,ADDRESS_NUMBER_HIGH
    ,WATER_ROUTE_NAME
    ,WATER_NAME
    ,SUBURB_LOCALITY
    ,TOWN_CITY
    ,FULL_ADDRESS_NUMBER
    ,FULL_ROAD_NAME
    ,FULL_ADDRESS
    ,CAST(ROAD_SECTION_ID AS UNSIGNED)
    ,GD2000_XCOORD
    ,GD2000_YCOORD
    ,WATER_ROUTE_NAME_ASCII
    ,WATER_NAME_ASCII
    ,SUBURB_LOCALITY_ASCII
    ,TOWN_CITY_ASCII
    ,FULL_ROAD_NAME_ASCII
    ,FULL_ADDRESS_ASCII
    ,SHAPE_X
    ,SHAPE_Y

FROM STAGE.StageStreetAddress st
INNER JOIN DQ.DQStreetAddress dq
    ON st.ROWID = dq.ROWID
    AND dq.VALID = 1
;


TRUNCATE TABLE DataWH.DimSuburbTown;
INSERT INTO DataWH.DimSuburbTown
(
    SuburbLocality
    ,TownCity
)
(
    SELECT
         DISTINCT
                 SuburbLocality
                ,TownCity

    FROM ETL.ETLStreetAddress
);


TRUNCATE TABLE DataWH.DimStreetRoad;
INSERT INTO DataWH.DimStreetRoad
(
    FullRoadName
    ,RoadSectionID
    ,SuburbTownKey
)
(
    SELECT
        DISTINCT
                FullRoadName
                ,RoadSectionID
                ,SuburbTownKey

    FROM ETL.ETLStreetAddress sa
    INNER JOIN DataWH.DimSuburbTown st
        ON st.SuburbLocality = sa.SuburbLocality
        AND st.TownCity = sa.TownCity
);

TRUNCATE TABLE DataWH.DimAddressInfo;
INSERT INTO DataWH.DimAddressInfo(
    SELECT
         ROW_NUMBER() OVER ()
         ,WKT
         ,AddressID
         ,AddressType
         ,UnitValue
         ,AddressNumber
         ,AddressNumberSuffix
         ,AddressNumberHigh
         ,WaterRouteName
         ,WaterName
         ,FullAddressNumber
         ,FullAddress
         ,GD2000XCoord
         ,GD2000YCoord

    FROM ETL.ETLStreetAddress
);

TRUNCATE TABLE DataWH.DimStreetAddress;
INSERT INTO DataWH.DimStreetAddress(
    SELECT
        StreetAddressKey
         ,AddressID
         ,ChangeID
         ,StreetRoadKey
         ,SuburbTownKey


    FROM ETL.ETLStreetAddress sa
    INNER JOIN DataWH.DimStreetRoad sr
        ON sa.FullRoadName = sr.FullRoadName
        AND sa.RoadSectionID = sr.RoadSectionID
);