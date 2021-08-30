
CREATE TABLE IF NOT EXISTS STAGE.StageAudit
(
    AuditKey                            INT AUTO_INCREMENT
    ,TableName                          VARCHAR(100)
    ,FileName                           VARCHAR(100)
    ,StartDateTime                      DATETIME
    ,FinishDateTime                     DATETIME
    ,Status                             VARCHAR(20)
    ,Result                             LONGTEXT
    ,ErrorOutput                        LONGTEXT
    ,KEY(AuditKey)
);

CREATE TABLE IF NOT EXISTS DQ.DQAudit
(
    AuditKey                            INT AUTO_INCREMENT
    ,TableName                          VARCHAR(100)
    ,SourceTableName                    VARCHAR(100)
    ,StartDateTime                      DATETIME
    ,FinishDateTime                     DATETIME
    ,Status                             VARCHAR(20)
    ,Result                             LONGTEXT
    ,PassRecords                        INT
    ,FailRecords                        INT
    ,ErrorOutput                        LONGTEXT
    ,KEY(AuditKey)
);

CREATE TABLE IF NOT EXISTS ETL.ETLAudit
(
    AuditKey                            INT AUTO_INCREMENT
    ,TableName                          VARCHAR(100)
    ,SourceTableName                    VARCHAR(100)
    ,StartDateTime                      DATETIME
    ,FinishDateTime                     DATETIME
    ,Status                             VARCHAR(20)
    ,Result                             LONGTEXT
    ,ErrorOutput                        LONGTEXT
    ,KEY(AuditKey)
);