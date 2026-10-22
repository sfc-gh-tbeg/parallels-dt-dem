CREATE OR REPLACE DYNAMIC TABLE DEMO_PARALLELS.ANALYTICS.AGG_DAILY_INSTALLS
  TARGET_LAG = '1 day'
  WAREHOUSE = DEMO_WH
  REFRESH_MODE = INCREMENTAL
  INITIALIZE = ON_CREATE
  COMMENT = 'Daily install funnel by OS, browser, and outcome'
AS
SELECT
    TO_DATE(e.event_time)                    AS install_date,
    s.OS_TYPE,
    s.BROWSER,
    s.STATUS,
    COUNT(DISTINCT e.session_uuid)           AS sessions,
    COUNT_IF(s.STATUS = 'complete')          AS completions,
    COUNT_IF(s.STATUS = 'failed')            AS failures,
    COUNT_IF(s.STATUS = 'abandoned')         AS abandons
FROM DEMO_PARALLELS.STAGING.STG_INSTALLER_EVENTS_FLAT e
JOIN DEMO_PARALLELS.STAGING.STG_INSTALLER_SESSIONS_FLAT s
  ON e.session_uuid = s.SESSION_UUID
GROUP BY TO_DATE(e.event_time), s.OS_TYPE, s.BROWSER, s.STATUS;
