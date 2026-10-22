CREATE SCHEMA IF NOT EXISTS DEMO_PARALLELS.ANALYTICS;

CREATE OR REPLACE DYNAMIC TABLE DEMO_PARALLELS.ANALYTICS.DT_EVENTS_PARSED
  TARGET_LAG = '1 minute'
  WAREHOUSE = DEMO_WH
AS
WITH parsed AS (
    SELECT
        PARSE_JSON(BODY) AS body_json,
        RECEIVED_AT
    FROM DEMO_PARALLELS.RAW.RAW_EVENTS
)
SELECT
    e.VALUE:name::STRING              AS event_name,
    p.body_json:hwid::STRING          AS hwid,
    p.body_json:version::STRING       AS version,
    p.body_json:arch::STRING          AS arch,
    p.body_json:hw_model::STRING      AS hw_model,
    p.body_json:os.name::STRING       AS os_name,
    p.body_json:os.version::STRING    AS os_version,
    p.body_json:license.edition::STRING AS license_edition,
    p.body_json:license.status::STRING  AS license_status,
    p.body_json:session_id::STRING    AS session_id,
    p.RECEIVED_AT::TIMESTAMP_NTZ      AS received_at
FROM parsed p,
     LATERAL FLATTEN(input => p.body_json:events) e;
