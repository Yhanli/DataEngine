CREATE TABLE IF NOT EXISTS STAGE.StageTitleAddress
(
    FILENAME                          VARCHAR(255)
    ,BATCHDATEKEY                     INT
    ,ROWID                            INT AUTO_INCREMENT

    ,CERTIFICATEOFTITLE               TEXT
    ,FULLADDRESS                      VARCHAR(128)
    ,ADDRESS                          VARCHAR(128)
    ,EXTERNALSUBURB                   VARCHAR(255)

    ,KEY(ROWID)
);

CREATE TABLE IF NOT EXISTS DQ.DQTitleAddress
(
    ROWID                                  INT

    ,CERTIFICATEOFTITLE_CHECK               INT
    ,FULLADDRESS_CHECK                      INT
    ,ADDRESS_CHECK                          INT
    ,EXTERNALSUBURB_CHECK                   INT
    ,VALID                                  INT

    ,KEY(ROWID)
);

CREATE TABLE IF NOT EXISTS ETL.ETLTitleAddress
(
    TitleAddressKey                     INT
    ,CertificateOfTitle                 VARCHAR(128)
    ,FullAddress                        VARCHAR(128)
    ,Address                            VARCHAR(128)
    ,ExternalSuburb                     VARCHAR(128)

    ,KEY(TitleAddressKey)
);

CREATE TABLE IF NOT EXISTS DataWH.DimTitleAddress
(
    TitleAddressKey                     INT
    ,CertificateOfTitle                 VARCHAR(128)
    ,FullAddress                        VARCHAR(128)
    ,Address                            VARCHAR(128)
    ,ExternalSuburb                     VARCHAR(128)

    ,KEY(TitleAddressKey)
    ,INDEX CertificateOfTitleIdx(CertificateOfTitle)
    ,INDEX AddressIdx(Address)
);