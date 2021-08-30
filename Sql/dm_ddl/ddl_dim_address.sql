CREATE TABLE IF NOT EXISTS STAGE.StageAddress
(
    FILENAME                            VARCHAR(200)
    ,BATCHDATEKEY                       INT
    ,ROWID                              INT AUTO_INCREMENT
    ,ADDRESS_ID                         VARCHAR(128)
    ,CHANGE_ID                          VARCHAR(128)
    ,PRIMARY_ADDRESS_ID                 VARCHAR(200)
    ,ADDRESS_LIFECYCLE_STAGE            VARCHAR(128)
    ,ADDRESS_PROVIDER                   VARCHAR(128)
    ,ADDRESS_MANAGER                    VARCHAR(128)
    ,ADDRESSABLE_OBJECT_ID              VARCHAR(128)
    ,ADDRESS_CLASS                      VARCHAR(128)
    ,PARCEL_ID                          VARCHAR(128)
    ,KEY(ROWID)
);
CREATE TABLE IF NOT EXISTS DQ.DQAddress
(
    ROWID                               INT
    ,ADDRESS_ID_CHECK                   INT
    ,CHANGE_ID_CHECK                    INT
    ,PRIMARY_ADDRESS_ID_CHECK           INT
    ,ADDRESS_LIFECYCLE_STAGE_CHECK      INT
    ,ADDRESS_PROVIDER_CHECK             INT
    ,ADDRESS_MANAGER_CHECK              INT
    ,ADDRESSABLE_OBJECT_ID_CHECK        INT
    ,ADDRESS_CLASS_CHECK                INT
    ,PARCEL_ID_CHECK                    INT
    ,VALID                              INT

    ,KEY(ROWID)
);

CREATE TABLE IF NOT EXISTS ETL.ETLAddress
(
    AddressKey                          INT
    ,AddressID                          INT
    ,ChangeID                           INT
    ,PrimaryAddressID                   INT
    ,AddressLifecycleStage              VARCHAR(128)
    ,AddressProvider                    VARCHAR(128)
    ,AddressManager                     VARCHAR(128)
    ,AddressableObjectID                INT
    ,AddressClass                       VARCHAR(128)
    ,ParcelID                           INT

    ,KEY(AddressKey)
);

CREATE TABLE IF NOT EXISTS DataWH.DimAddress
(
    AddressKey                          INT
    ,AddressID                          INT
    ,ChangeID                           INT
    ,PrimaryAddressID                   INT
    ,AddressLifecycleStage              VARCHAR(128)
    ,AddressProvider                    VARCHAR(128)
    ,AddressManager                     VARCHAR(128)
    ,AddressableObjectID                INT
    ,AddressClass                       VARCHAR(128)
    ,ParcelID                           INT

    ,KEY(AddressKey)
    ,INDEX AddressIDIdx(AddressID)
    ,INDEX ParcelIDIdx(ParcelID)
);