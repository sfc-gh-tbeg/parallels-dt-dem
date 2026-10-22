CREATE OR REPLACE DYNAMIC TABLE DEMO_PARALLELS.STAGING.STG_INSTALLER_SESSIONS_FLAT
  TARGET_LAG = '1 day'
  WAREHOUSE = DEMO_WH
  REFRESH_MODE = INCREMENTAL
  INITIALIZE = ON_CREATE
  COMMENT = 'Installer sessions with step timings flattened'
AS
SELECT
    r.ID,
    r.SESSION_UUID,
    r.HWID,
    r.BROWSER,
    r.OS_TYPE,
    r.STARTED_AT,
    r.COMPLETED_AT,
    r.STATUS,
    f.KEY                                               AS step_name,
    DATEADD('ms', f.VALUE:start_ms::INT, r.STARTED_AT)  AS step_started_at,
    CASE
      WHEN f.VALUE:end_ms IS NOT NULL
        THEN DATEADD('ms', f.VALUE:end_ms::INT, r.STARTED_AT)
    END                                                  AS step_completed_at,
    CASE
      WHEN f.VALUE:error IS NOT NULL THEN 'failed'
      WHEN f.VALUE:abandoned_at_ms IS NOT NULL THEN 'abandoned'
      WHEN f.VALUE:end_ms IS NOT NULL THEN 'complete'
      ELSE 'in_progress'
    END                                                  AS step_status
FROM DEMO_PARALLELS.RAW.RAW_INSTALLERS r,
     LATERAL FLATTEN(INPUT => PARSE_JSON(r.BODY):steps) f;
