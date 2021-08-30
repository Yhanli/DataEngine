TRUNCATE TABLE DQ.DQTitleAddress;
INSERT INTO DQ.DQTitleAddress
(
    ROWID
    ,CERTIFICATEOFTITLE_CHECK
    ,FULLADDRESS_CHECK
    ,ADDRESS_CHECK
    ,EXTERNALSUBURB_CHECK
    ,VALID
)
SELECT
       ROWID
     ,@CERTIFICATEOFTITLE_CHECK:=(              CASE 	WHEN CERTIFICATEOFTITLE IS NULL THEN 1
                                                        WHEN CERTIFICATEOFTITLE = '' THEN 1
                                                        WHEN CERTIFICATEOFTITLE = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@FULLADDRESS_CHECK:=(                     CASE 	WHEN FULLADDRESS IS NULL THEN 1
                                                        WHEN FULLADDRESS = '' THEN 1
                                                        WHEN FULLADDRESS = 'NULL' THEN 1
                                                        ELSE 0
    END)

     ,@ADDRESS_CHECK:=(                         CASE 	WHEN ADDRESS IS NULL THEN 1
                                                        WHEN ADDRESS = '' THEN 1
                                                        WHEN ADDRESS = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@EXTERNALSUBURB_CHECK:=(                  CASE 	WHEN EXTERNALSUBURB IS NULL THEN 1
                                                        WHEN EXTERNALSUBURB = '' THEN 1
                                                        WHEN EXTERNALSUBURB = 'NULL' THEN 1
                                                        ELSE 0
    END)

     ,(@CERTIFICATEOFTITLE_CHECK + @FULLADDRESS_CHECK) = 0
FROM STAGE.StageTitleAddress
;

