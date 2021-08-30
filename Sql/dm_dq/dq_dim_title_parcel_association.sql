TRUNCATE TABLE DQ.DQTitleParcelAssociation;
INSERT INTO DQ.DQTitleParcelAssociation
(
    ROWID
    ,ID_CHECK
    ,TITLE_NO_CHECK
    ,PAR_ID_CHECK
    ,SOURCE_CHECK
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
     ,@PAR_ID_CHECK:=(                          CASE 	WHEN PAR_ID IS NULL THEN 1
                                                        WHEN PAR_ID = '' THEN 1
                                                        WHEN PAR_ID = 'NULL' THEN 1
                                                        ELSE 0
    END)
     ,@SOURCE_CHECK:=(                          CASE 	WHEN SOURCE IS NULL THEN 1
                                                        WHEN SOURCE = '' THEN 1
                                                        WHEN SOURCE = 'NULL' THEN 1
                                                        ELSE 0
    END)

     ,(@ID_CHECK + @TITLE_NO_CHECK + @PAR_ID_CHECK) = 0
FROM STAGE.StageTitleParcelAssociation
;

