TRUNCATE TABLE DQ.DQAddress;
INSERT INTO DQ.DQAddress
(
    ROWID
    ,ADDRESS_ID_CHECK
    ,CHANGE_ID_CHECK
    ,PRIMARY_ADDRESS_ID_CHECK
    ,ADDRESS_LIFECYCLE_STAGE_CHECK
    ,ADDRESS_PROVIDER_CHECK
    ,ADDRESS_MANAGER_CHECK
    ,ADDRESSABLE_OBJECT_ID_CHECK
    ,ADDRESS_CLASS_CHECK
    ,PARCEL_ID_CHECK
    ,VALID
)
SELECT
       ROWID
     ,@ADDRESS_ID_CHECK:=(                      CASE 	WHEN ADDRESS_ID IS NULL THEN 1
                                                        WHEN ADDRESS_ID = '' THEN 1
                                                        ELSE 0
    END)
     ,@CHANGE_ID_CHECK:=(	                    CASE 	WHEN CHANGE_ID IS NULL THEN 1
                                                        WHEN CHANGE_ID = '' THEN 1
                                                        ELSE 0
    END)
     ,@PRIMARY_ADDRESS_ID_CHECK:=(	            CASE    WHEN PRIMARY_ADDRESS_ID IS NULL THEN 1
                                                        WHEN PRIMARY_ADDRESS_ID = '' THEN 1
                                                        ELSE 0
    END)
     ,@ADDRESS_LIFECYCLE_STAGE_CHECK:=(	        CASE 	WHEN ADDRESS_LIFECYCLE_STAGE IS NULL THEN 1
                                                        WHEN ADDRESS_LIFECYCLE_STAGE = '' THEN 1
                                                        ELSE 0
    END)
     ,@ADDRESS_PROVIDER_CHECK:=(	            CASE 	WHEN ADDRESS_PROVIDER IS NULL THEN 1
                                                        WHEN ADDRESS_PROVIDER = '' THEN 1
                                                        ELSE 0
    END)
     ,@ADDRESS_MANAGER_CHECK:=(	                CASE 	WHEN ADDRESS_MANAGER IS NULL THEN 1
                                                        WHEN ADDRESS_MANAGER = '' THEN 1
                                                        ELSE 0
    END)
     ,@ADDRESSABLE_OBJECT_ID_CHECK:=(	        CASE 	WHEN ADDRESSABLE_OBJECT_ID IS NULL THEN 1
                                                        WHEN ADDRESSABLE_OBJECT_ID = '' THEN 1
                                                        ELSE 0
    END)
     ,@ADDRESS_CLASS_CHECK:=(	                CASE 	WHEN ADDRESS_CLASS IS NULL THEN 1
                                                        WHEN ADDRESS_CLASS = '' THEN 1
                                                        ELSE 0
    END)
     ,@PARCEL_ID_CHECK:=(	                    CASE 	WHEN PARCEL_ID IS NULL THEN 1
                                                        WHEN PARCEL_ID = '' THEN 1
                                                        ELSE 0
    END)

     ,(@ADDRESS_ID_CHECK + @PARCEL_ID_CHECK + @ADDRESSABLE_OBJECT_ID_CHECK) = 0
FROM STAGE.StageAddress
;