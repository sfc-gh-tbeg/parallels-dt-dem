CREATE OR REPLACE DYNAMIC TABLE DEMO_PARALLELS.STAGING.STG_INSTALLER_EVENTS_FLAT
  TARGET_LAG = '1 day'
  WAREHOUSE = DEMO_WH
  REFRESH_MODE = INCREMENTAL
  INITIALIZE = ON_CREATE
  CLUSTER BY (TO_DATE(created_at))
  COMMENT = 'Installer events flattened to one row per event'
AS
SELECT
    r.ID                                                 AS raw_id,
    f.INDEX                                              AS ev_idx,
    TRY_TO_TIMESTAMP_NTZ(r.RECEIVED_AT)                  AS created_at,
    PARSE_JSON(r.BODY):hwid::STRING                      AS hwid,
    f.VALUE:type::STRING                                 AS event_code,
    TRY_TO_TIMESTAMP_NTZ(r.RECEIVED_AT)                  AS event_time,
    PARSE_JSON(r.BODY):version::STRING                   AS build_version,
    PARSE_JSON(r.BODY):os::STRING                        AS os_locale,
    PARSE_JSON(r.BODY):os::STRING                        AS os_version,
    NULL::STRING                                         AS os_type,
    NULL::STRING                                         AS browser,
    PARSE_JSON(r.BODY):sessionId::STRING                 AS session_uuid
FROM DEMO_PARALLELS.RAW.RAW_EVENTS r,
     LATERAL FLATTEN(INPUT => PARSE_JSON(r.BODY):events) f
WHERE PARSE_JSON(r.BODY):sessionId IS NOT NULL;
