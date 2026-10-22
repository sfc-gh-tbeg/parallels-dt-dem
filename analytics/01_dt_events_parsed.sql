CREATE SCHEMA IF NOT EXISTS DEMO_PARALLELS.ANALYTICS;

CREATE OR REPLACE DYNAMIC TABLE DEMO_PARALLELS.ANALYTICS.DT_EVENTS_PARSED
  TARGET_LAG = '1 minute'
  WAREHOUSE = DEMO_WH
AS
WITH src AS (
    SELECT
        r.ID,
        r.NAMESPACE,
        TRY_PARSE_JSON(r.BODY::STRING) AS body,
        r.RECEIVED_AT
    FROM DEMO_PARALLELS.RAW.RAW_EVENTS r
)
SELECT
    s.ID                                   AS raw_id,
    s.NAMESPACE                            AS namespace,
    e.value:name::STRING                   AS event_name,
    s.body:hwid::STRING                    AS hwid,
    s.body:version::STRING                 AS version,
    s.body:arch::STRING                    AS arch,
    s.body:hw_model::STRING                AS hw_model,
    s.body:os:name::STRING                 AS os_name,
    s.body:os:version::STRING              AS os_version,
    s.body:license:edition::STRING         AS license_edition,
    s.body:license:status::STRING          AS license_status,
    s.body:session_id::STRING              AS session_id,  -- null for PD events
    s.RECEIVED_AT::TIMESTAMP_NTZ           AS received_at
FROM src s,
     LATERAL FLATTEN(input => s.body:events, OUTER => TRUE) e;
