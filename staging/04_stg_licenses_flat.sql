CREATE OR REPLACE DYNAMIC TABLE DEMO_PARALLELS.STAGING.STG_LICENSES_FLAT
  TARGET_LAG = '1 day'
  WAREHOUSE = DEMO_WH
  REFRESH_MODE = INCREMENTAL
  INITIALIZE = ON_CREATE
  COMMENT = 'License records with renewal history flattened'
AS
SELECT
    r.ID,
    r.LICENSE_KEY,
    r.HWID,
    r.EDITION,
    r.STATUS,
    r.TYPE,
    r.ACTIVATED_AT,
    r.EXPIRES_AT,
    f.VALUE:date::DATE                AS renewal_date,
    COALESCE(
      f.VALUE:action::STRING,
      CASE WHEN f.VALUE:"from" IS NOT NULL THEN 'upgrade' END
    )                                 AS renewal_type,
    NULL::NUMBER(10,2)                AS renewal_amount
FROM DEMO_PARALLELS.RAW.RAW_LICENSES r,
     LATERAL FLATTEN(INPUT => PARSE_JSON(r.BODY):renewals, OUTER => TRUE) f;
