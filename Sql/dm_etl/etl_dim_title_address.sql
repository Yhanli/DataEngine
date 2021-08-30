TRUNCATE TABLE ETL.ETLTitleAddress;
INSERT INTO ETL.ETLTitleAddress
SELECT

    st.ROWID
    ,CERTIFICATEOFTITLE
    ,FULLADDRESS
    ,ADDRESS
    ,EXTERNALSUBURB


FROM STAGE.StageTitleAddress st
INNER JOIN DQ.DQTitleAddress dq
    ON st.ROWID = dq.ROWID
    AND dq.VALID = 1
;


TRUNCATE TABLE DataWH.DimTitleAddress;
INSERT INTO DataWH.DimTitleAddress
SELECT
    TitleAddressKey
    ,CertificateOfTitle
    ,FullAddress
    ,Address
    ,ExternalSuburb
FROM ETL.ETLTitleAddress
;
