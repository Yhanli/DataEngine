TRUNCATE TABLE ETL.ETLAddress;
INSERT INTO ETL.ETLAddress
    (
        AddressKey
        ,AddressID
        ,ChangeID
        ,PrimaryAddressID
        ,AddressLifecycleStage
        ,AddressProvider
        ,AddressManager
        ,AddressableObjectID
        ,AddressClass
        ,ParcelID
    )
SELECT
       sa.ROWID
     ,CAST(ADDRESS_ID AS UNSIGNED)
     ,CAST(CHANGE_ID AS UNSIGNED)
     ,CAST(PRIMARY_ADDRESS_ID AS UNSIGNED)
     ,ADDRESS_LIFECYCLE_STAGE
     ,ADDRESS_PROVIDER
     ,ADDRESS_MANAGER
     ,CAST(ADDRESSABLE_OBJECT_ID AS UNSIGNED)
     ,ADDRESS_CLASS
     ,CAST(PARCEL_ID AS UNSIGNED)

FROM STAGE.StageAddress sa
INNER JOIN DQ.DQAddress da
    ON sa.ROWID = da.ROWID
    AND da.VALID = 1
;

TRUNCATE TABLE DataWH.DimAddress;
INSERT INTO DataWH.DimAddress(
    SELECT *
    FROM ETL.ETLAddress
);