TRUNCATE TABLE ETL.ETLPropertyTitle;
INSERT INTO ETL.ETLPropertyTitle
(
    PropertyTitleKey
    ,WKT
    ,ID
    ,TitleNo
    ,Status
    ,Type
    ,LandDistrict
    ,IssueDate
    ,GuaranteeStatus
    ,EstateDescription
    ,NumberOwners
    ,SpatialExtentsShared
)
SELECT

    st.ROWID

    ,ST_GeomFromText(WKT)
    ,CAST(ID AS UNSIGNED)
    ,TITLE_NO
    ,STATUS
    ,TYPE
    ,LAND_DISTRICT
    ,CAST(ISSUE_DATE AS DATETIME)
    ,GUARANTEE_STATUS
    ,ESTATE_DESCRIPTION
    ,CAST(NUMBER_OWNERS AS UNSIGNED)
    ,SPATIAL_EXTENTS_SHARED

FROM STAGE.StagePropertyTitle st
INNER JOIN DQ.DQPropertyTitle dq
    ON st.ROWID = dq.ROWID
    AND dq.VALID = 1
;

TRUNCATE TABLE DataWH.DimPropertyTitle;
INSERT INTO DataWH.DimPropertyTitle(
    SELECT
        PropertyTitleKey
         ,ID
         ,TitleNo
         ,Status
         ,Type
         ,LandDistrict
         ,IssueDate
         ,GuaranteeStatus
         ,EstateDescription
         ,NumberOwners
         ,SpatialExtentsShared
    FROM ETL.ETLPropertyTitle
);

TRUNCATE TABLE DataWH.DimTitleBoundary;
INSERT INTO DataWH.DimTitleBoundary(
    SELECT
        PropertyTitleKey
         ,WKT
         ,ID
    FROM ETL.ETLPropertyTitle
);