CREATE SCHEMA IF NOT EXISTS DEMO_PARALLELS.STAGING;

CREATE OR REPLACE DYNAMIC TABLE DEMO_PARALLELS.STAGING.STG_PD_EVENTS_FLAT
  TARGET_LAG = '1 day'
  WAREHOUSE = DEMO_WH
  REFRESH_MODE = INCREMENTAL
  INITIALIZE = ON_CREATE
  CLUSTER BY (TO_DATE(created_at))
  COMMENT = 'PD desktop events flattened to one row per event'
AS
SELECT
    r.ID                                                 AS raw_id,
    f.INDEX                                              AS ev_idx,
    TRY_TO_TIMESTAMP_NTZ(r.RECEIVED_AT)                  AS created_at,
    PARSE_JSON(r.BODY):hwid::STRING                      AS hwid,
    f.VALUE:type::STRING                                 AS event_code,
    TRY_TO_TIMESTAMP_NTZ(r.RECEIVED_AT)                  AS event_time,
    f.VALUE:guest_os::STRING                             AS comment,
    PARSE_JSON(r.BODY):version::STRING                   AS build_version,
    PARSE_JSON(r.BODY):arch::STRING                      AS os_arch,
    PARSE_JSON(r.BODY):hw_model::STRING                  AS hw_model,
    PARSE_JSON(r.BODY):os::STRING                        AS os_locale,
    PARSE_JSON(r.BODY):os::STRING                        AS os_version,
    f.VALUE:guest_os::STRING                             AS guest_os_version,
    NULL::STRING                                         AS guest_os_arch,
    PARSE_JSON(r.BODY):license.edition::STRING           AS license_edition,
    PARSE_JSON(r.BODY):license.type::STRING              AS license_status,
    PARSE_JSON(r.BODY):license.type::STRING              AS license_type,
    NULL::STRING                                         AS ab_switches
FROM DEMO_PARALLELS.RAW.RAW_EVENTS r,
     LATERAL FLATTEN(INPUT => PARSE_JSON(r.BODY):events) f
WHERE PARSE_JSON(r.BODY):sessionId IS NULL;
