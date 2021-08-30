TRUNCATE TABLE ETL.ETLTitleParcelAssociation;
INSERT INTO ETL.ETLTitleParcelAssociation
SELECT

    st.ROWID
    ,ID
    ,TITLE_NO
    ,PAR_ID
    ,SOURCE


FROM STAGE.StageTitleParcelAssociation st
INNER JOIN DQ.DQTitleParcelAssociation dq
    ON st.ROWID = dq.ROWID
    AND dq.VALID = 1
;


TRUNCATE TABLE DataWH.DimTitleParcelAssociation;
INSERT INTO DataWH.DimTitleParcelAssociation
SELECT
    TitleParcelAssociationKey
    ,ID
    ,TitleNo
    ,ParID
    ,Source
FROM ETL.ETLTitleParcelAssociation
;
