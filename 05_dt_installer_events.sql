-- Dynamic Table: Flatten Installer events (sessionId IS NOT NULL)
-- Refresh: incremental, 1 day lag, on DEMO_WH
CREATE OR REPLACE DYNAMIC TABLE DEMO_ALLUDO_EVENTS.FLATTENED_EVENTS.INSTALLER_EVENTS_FLAT
  TARGET_LAG = '1 day'
  WAREHOUSE = DEMO_WH
  AS
    SELECT
      r.ID                                                  AS raw_id,
      f.INDEX                                               AS ev_idx,
      r.RECEIVED_AT::TIMESTAMP_NTZ                          AS created_at,
      PARSE_JSON(r.BODY):hwid::VARCHAR                      AS hwid,
      f.VALUE:event_id::VARCHAR                             AS event_code,
      f.VALUE:occured_at::TIMESTAMP_NTZ                     AS event_time,
      PARSE_JSON(r.BODY):version::VARCHAR                   AS build_version,
      PARSE_JSON(r.BODY):osLocale::VARCHAR                  AS os_locale,
      PARSE_JSON(r.BODY):osVersion::VARCHAR                 AS os_version,
      PARSE_JSON(r.BODY):osType::VARCHAR                    AS os_type,
      PARSE_JSON(r.BODY):browser::VARCHAR                   AS browser,
      PARSE_JSON(r.BODY):sessionId::VARCHAR                 AS session_uuid
    FROM DEMO_ALLUDO_EVENTS.PLATFORM_EVENTS.RAW_EVENTS r,
      LATERAL FLATTEN(INPUT => PARSE_JSON(r.BODY):events) f
    WHERE PARSE_JSON(r.BODY):sessionId IS NOT NULL;
