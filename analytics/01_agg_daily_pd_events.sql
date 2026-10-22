CREATE SCHEMA IF NOT EXISTS DEMO_PARALLELS.ANALYTICS;

CREATE OR REPLACE DYNAMIC TABLE DEMO_PARALLELS.ANALYTICS.AGG_DAILY_PD_EVENTS
  TARGET_LAG = '1 day'
  WAREHOUSE = DEMO_WH
  REFRESH_MODE = INCREMENTAL
  INITIALIZE = ON_CREATE
  CLUSTER BY (event_date)
  COMMENT = 'Daily PD event volume and unique device counts'
AS
SELECT
    TO_DATE(event_time)            AS event_date,
    event_code,
    COUNT(*)                       AS event_count,
    COUNT(DISTINCT hwid)           AS unique_devices
FROM DEMO_PARALLELS.STAGING.STG_PD_EVENTS_FLAT
GROUP BY TO_DATE(event_time), event_code;
