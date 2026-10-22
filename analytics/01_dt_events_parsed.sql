CREATE OR REPLACE DYNAMIC TABLE DEMO_PARALLELS.ANALYTICS.DT_EVENTS_PARSED
  TARGET_LAG = '1 minute'
  WAREHOUSE = DEMO_WH
AS
SELECT
    r.ID                                                          AS RAW_EVENT_ID,
    f.VALUE:"name"::VARCHAR                                       AS EVENT_NAME,
    PARSE_JSON(r.BODY):"hwid"::VARCHAR                            AS HWID,
    PARSE_JSON(r.BODY):"version"::VARCHAR                         AS VERSION,
    PARSE_JSON(r.BODY):"arch"::VARCHAR                            AS ARCH,
    PARSE_JSON(r.BODY):"hw_model"::VARCHAR                        AS HW_MODEL,
    PARSE_JSON(r.BODY):"os":"name"::VARCHAR                       AS OS_NAME,
    PARSE_JSON(r.BODY):"os":"version"::VARCHAR                    AS OS_VERSION,
    PARSE_JSON(r.BODY):"license":"edition"::VARCHAR               AS LICENSE_EDITION,
    PARSE_JSON(r.BODY):"license":"status"::VARCHAR                AS LICENSE_STATUS,
    PARSE_JSON(r.BODY):"sessionId"::VARCHAR                       AS SESSION_ID,
    r.RECEIVED_AT::TIMESTAMP_NTZ                                  AS RECEIVED_AT
FROM DEMO_PARALLELS.RAW.RAW_EVENTS r,
     LATERAL FLATTEN(INPUT => PARSE_JSON(r.BODY):"events") f;
