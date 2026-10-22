-- Dynamic Table: Flatten PD Desktop events (sessionId IS NULL)
-- Refresh: incremental, 1 day lag, on DEMO_WH
CREATE OR REPLACE DYNAMIC TABLE DEMO_ALLUDO_EVENTS.FLATTENED_EVENTS.PD_EVENTS_FLAT
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
      f.VALUE:meta:comment::VARCHAR                         AS comment,
      PARSE_JSON(r.BODY):version::VARCHAR                   AS build_version,
      PARSE_JSON(r.BODY):arch::VARCHAR                      AS os_arch,
      PARSE_JSON(r.BODY):hw_model::VARCHAR                  AS hw_model,
      PARSE_JSON(r.BODY):osLocale::VARCHAR                  AS os_locale,
      PARSE_JSON(r.BODY):osVersion::VARCHAR                 AS os_version,
      f.VALUE:meta:guest_os_version::VARCHAR                AS guest_os_version,
      f.VALUE:meta:guest_os_arch::VARCHAR                   AS guest_os_arch,
      f.VALUE:meta:license_edition::VARCHAR                 AS license_edition,
      f.VALUE:meta:license_status::VARCHAR                  AS license_status,
      f.VALUE:meta:license_type::VARCHAR                    AS license_type,
      PARSE_JSON(r.BODY):ab_switches::VARCHAR               AS ab_switches
    FROM DEMO_ALLUDO_EVENTS.PLATFORM_EVENTS.RAW_EVENTS r,
      LATERAL FLATTEN(INPUT => PARSE_JSON(r.BODY):events) f
    WHERE PARSE_JSON(r.BODY):sessionId IS NULL;
