TRUNCATE TABLE DQ.DQPropertyTitle;
INSERT INTO DQ.DQPropertyTitle
(
    ROWID
    ,WKT_CHECK
    ,ID_CHECK
    ,TITLE_NO_CHECK
    ,STATUS_CHECK
    ,TYPE_CHECK
    ,LAND_DISTRICT_CHECK
    ,ISSUE_DATE_CHECK
    ,GUARANTEE_STATUS_CHECK
    ,ESTATE_DESCRIPTION_CHECK
    ,NUMBER_OWNERS_CHECK
    ,SPATIAL_EXTENTS_SHARED_CHECK
    ,VALID
)
SELECT
       ROWID
     ,@WKT_CHECK:=(                             CASE 	WHEN WKT IS NULL THEN 1
                                                        WHEN WKT = '' THEN 1
                                                        ELSE 0
    END)
     ,@ID_CHECK:=(                              CASE 	WHEN ID IS NULL THEN 1
                                                        WHEN ID = '' THEN 1
                                                        ELSE 0
    END)
     ,@TITLE_NO_CHECK:=(                        CASE 	WHEN TITLE_NO IS NULL THEN 1
                                                        WHEN TITLE_NO = '' THEN 1
                                                        ELSE 0
    END)
     ,@STATUS_CHECK:=(                          CASE 	WHEN STATUS IS NULL THEN 1
                                                        WHEN STATUS = '' THEN 1
                                                        ELSE 0
    END)
     ,@TYPE_CHECK:=(                            CASE 	WHEN TYPE IS NULL THEN 1
                                                        WHEN TYPE = '' THEN 1
                                                        ELSE 0
    END)
     ,@LAND_DISTRICT_CHECK:=(                   CASE 	WHEN LAND_DISTRICT IS NULL THEN 1
                                                        WHEN LAND_DISTRICT = '' THEN 1
                                                        ELSE 0
    END)
     ,@ISSUE_DATE_CHECK:=(                      CASE 	WHEN ISSUE_DATE IS NULL THEN 1
                                                        WHEN ISSUE_DATE = '' THEN 1
                                                        WHEN STR_TO_DATE(ISSUE_DATE,'%Y/%m/%d %H:%i:%s')=0 THEN 1
                                                        ELSE 0
    END)
     ,@GUARANTEE_STATUS_CHECK:=(                CASE 	WHEN GUARANTEE_STATUS IS NULL THEN 1
                                                        WHEN GUARANTEE_STATUS = '' THEN 1
                                                        ELSE 0
    END)
     ,@ESTATE_DESCRIPTION_CHECK:=(              CASE 	WHEN ESTATE_DESCRIPTION IS NULL THEN 1
                                                        WHEN ESTATE_DESCRIPTION = '' THEN 1
                                                        ELSE 0
    END)
     ,@NUMBER_OWNERS_CHECK:=(                   CASE 	WHEN NUMBER_OWNERS IS NULL THEN 1
                                                        WHEN NUMBER_OWNERS = '' THEN 1
                                                        ELSE 0
    END)
     ,@SPATIAL_EXTENTS_SHARED_CHECK:=(          CASE 	WHEN SPATIAL_EXTENTS_SHARED IS NULL THEN 1
                                                        WHEN SPATIAL_EXTENTS_SHARED = '' THEN 1
                                                        ELSE 0
    END)
     ,(@WKT_CHECK + @ID_CHECK + @TITLE_NO_CHECK + @ISSUE_DATE_CHECK + @ESTATE_DESCRIPTION_CHECK) = 0
FROM STAGE.StagePropertyTitle
;