TRUNCATE TABLE DQ.DQTitleOwner;
INSERT INTO DQ.DQTitleOwner
(
    ROWID
    ,ID_CHECK
    ,TITLE_NO_CHECK
    ,OWNER_CHECK
    ,VALID
)
SELECT
    ROWID
     ,@ID_CHECK:=(      CASE 	WHEN ID IS NULL THEN 1
                                WHEN ID = '' THEN 1
                                ELSE 0
    END)
     ,@TITLE_NO_CHECK:=(CASE 	WHEN TITLE_NO IS NULL THEN 1
                                WHEN TITLE_NO = '' THEN 1
                                ELSE 0
    END)
     ,@OWNER_CHECK:=(	CASE 	WHEN OWNER IS NULL THEN 1
                                WHEN OWNER = '' THEN 1
                                ELSE 0
    END)
     ,(@ID_CHECK + @TITLE_NO_CHECK + @OWNER_CHECK) = 0
FROM STAGE.StageTitleOwner sto
;