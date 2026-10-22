CREATE OR REPLACE DYNAMIC TABLE DEMO_PARALLELS.ANALYTICS.DT_HOST_SUMMARY
  TARGET_LAG = '1 minute'
  WAREHOUSE = DEMO_WH
AS
SELECT
    hwid,
    MAX_BY(hw_model, received_at)        AS hw_model,
    MAX_BY(arch, received_at)            AS arch,
    MAX_BY(os_name, received_at)         AS os_name,
    MAX_BY(version, received_at)         AS latest_version,
    MAX_BY(license_edition, received_at) AS license_edition,
    MAX_BY(license_status, received_at)  AS license_status,
    MIN(received_at)                     AS first_seen,
    MAX(received_at)                     AS last_seen,
    COUNT(*)                             AS event_count
FROM DEMO_PARALLELS.ANALYTICS.DT_EVENTS_PARSED
WHERE hwid IS NOT NULL
GROUP BY hwid;
