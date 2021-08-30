TRUNCATE TABLE DQ.DQTitleMemorialsMortgages;
INSERT INTO DQ.DQTitleMemorialsMortgages
(
     ROWID
    ,ID_CHECK
    ,TITLE_NO_CHECK
    ,LAND_DISTRICT_CHECK
    ,MEMORIAL_TEXT_CHECK
    ,CURRENT_CHECK
    ,INSTRUMENT_NUMBER_CHECK
    ,INSTRUMENT_LODGED_DATETIME_CHECK
    ,INSTRUMENT_TYPE_CHECK
    ,ENCUMBRANCEES_CHECK
    ,VALID
)
SELECT
       ROWID
     ,@ID_CHECK:=(                              CASE 	WHEN ID IS NULL THEN 1
                                                        WHEN ID = '' THEN 1
                                                        WHEN ID = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@TITLE_NO_CHECK:=(                        CASE 	WHEN TITLE_NO IS NULL THEN 1
                                                        WHEN TITLE_NO = '' THEN 1
                                                        WHEN TITLE_NO = 'NULL' THEN 1
                                                        ELSE 0
    END)

     ,@LAND_DISTRICT_CHECK:=(                   CASE 	WHEN LAND_DISTRICT IS NULL THEN 1
                                                        WHEN LAND_DISTRICT = '' THEN 1
                                                        WHEN LAND_DISTRICT = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@MEMORIAL_TEXT_CHECK:=(                   CASE 	WHEN MEMORIAL_TEXT IS NULL THEN 1
                                                        WHEN MEMORIAL_TEXT = '' THEN 1
                                                        WHEN MEMORIAL_TEXT = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@CURRENT_CHECK:=(                         CASE 	WHEN CURRENT IS NULL THEN 1
                                                        WHEN CURRENT = '' THEN 1
                                                        WHEN CURRENT = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@INSTRUMENT_NUMBER_CHECK:=(               CASE 	WHEN INSTRUMENT_NUMBER IS NULL THEN 1
                                                        WHEN INSTRUMENT_NUMBER = '' THEN 1
                                                        WHEN INSTRUMENT_NUMBER = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@INSTRUMENT_LODGED_DATETIME_CHECK:=(     CASE 	WHEN INSTRUMENT_LODGED_DATETIME IS NULL THEN 1
                                                        WHEN INSTRUMENT_LODGED_DATETIME = '' THEN 1
                                                        WHEN INSTRUMENT_LODGED_DATETIME = 'NULL' THEN 1
                                                        WHEN STR_TO_DATE(INSTRUMENT_LODGED_DATETIME,'%Y/%m/%d %H:%i:%s')=0 THEN 1

                                                        ELSE 0
    END)
     ,@INSTRUMENT_TYPE_CHECK:=(                CASE 	WHEN INSTRUMENT_TYPE IS NULL THEN 1
                                                        WHEN INSTRUMENT_TYPE = '' THEN 1
                                                        WHEN INSTRUMENT_TYPE = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@ENCUMBRANCEES_CHECK:=(                  CASE 	WHEN ENCUMBRANCEES IS NULL THEN 1
                                                        WHEN ENCUMBRANCEES = '' THEN 1
                                                        WHEN ENCUMBRANCEES = 'NULL' THEN 1
                                                        ELSE 0
    END)

     ,(@ID_CHECK + @TITLE_NO_CHECK + @INSTRUMENT_NUMBER_CHECK + @INSTRUMENT_LODGED_DATETIME_CHECK) = 0
FROM STAGE.StageTitleMemorialsMortgages
;

