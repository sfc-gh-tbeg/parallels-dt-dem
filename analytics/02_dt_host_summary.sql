CREATE OR REPLACE DYNAMIC TABLE DEMO_PARALLELS.ANALYTICS.DT_HOST_SUMMARY
  TARGET_LAG = '1 minute'
  WAREHOUSE = DEMO_WH
AS
SELECT
    hwid,
    ANY_VALUE(hw_model)          AS hw_model,
    ANY_VALUE(arch)              AS arch,
    ANY_VALUE(os_name)           AS os_name,
    MAX_BY(version, received_at) AS latest_version,
    ANY_VALUE(license_edition)   AS license_edition,
    ANY_VALUE(license_status)    AS license_status,
    MIN(received_at)             AS first_seen,
    MAX(received_at)             AS last_seen,
    COUNT(*)                     AS event_count
FROM DEMO_PARALLELS.ANALYTICS.DT_EVENTS_PARSED
GROUP BY hwid;
