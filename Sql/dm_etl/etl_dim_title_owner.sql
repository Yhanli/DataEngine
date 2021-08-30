TRUNCATE TABLE ETL.ETLTitleOwner;
INSERT INTO ETL.ETLTitleOwner
    (
     TitleOwnerKey
     ,ID
     ,TitleNo
     ,Owner
    )
SELECT
     sto.ROWID
     ,CAST(sto.ID AS UNSIGNED )
     ,TITLE_NO
     ,OWNER
FROM STAGE.StageTitleOwner sto
INNER JOIN DQ.DQTitleOwner dto
    ON sto.ROWID = dto.ROWID
    AND dto.VALID = 1
;

TRUNCATE TABLE DataWH.DimTitleOwner;
INSERT INTO DataWH.DimTitleOwner(
    SELECT *
    FROM ETL.ETLTitleOwner
);