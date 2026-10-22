USE SCHEMA DEMO_PARALLELS.RAW;

CREATE OR REPLACE TABLE RAW_INSTALLERS (
    ID            INT AUTOINCREMENT,
    SESSION_UUID  VARCHAR,
    HWID          VARCHAR,
    BROWSER       VARCHAR,
    OS_TYPE       VARCHAR,
    DOWNLOAD_URL  VARCHAR,
    STARTED_AT    TIMESTAMP,
    COMPLETED_AT  TIMESTAMP,
    STATUS        VARCHAR,
    BODY          VARCHAR
);

INSERT INTO RAW_INSTALLERS (SESSION_UUID, HWID, BROWSER, OS_TYPE, DOWNLOAD_URL, STARTED_AT, COMPLETED_AT, STATUS, BODY) VALUES
('sess-0001-abcd-1234', 'd4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3efab', 'Safari', 'macOS', 'https://download.parallels.com/desktop/v19/19.4.0-54962.dmg', '2024-11-01 11:28:00', '2024-11-01 11:35:00', 'complete', '{"steps":{"dmg_download":{"start_ms":0,"end_ms":120000},"pkg_install":{"start_ms":125000,"end_ms":300000},"first_launch":{"start_ms":305000,"end_ms":420000}}}'),
('sess-0002-efgh-5678', 'a7b8c9d0e1f2a7b8c9d0e1f2a7b8c9d0e1f2a7b8c9d0e1f2a7b8c9d0e1f2bcde', 'Chrome', 'macOS', 'https://download.parallels.com/desktop/v19/19.4.0-54962.dmg', '2024-11-01 14:03:00', NULL, 'failed', '{"steps":{"dmg_download":{"start_ms":0,"error":"timeout","error_at_ms":60000}}}'),
('sess-0003-ijkl-9012', 'e1f2a7b8c9d0e1f2a7b8c9d0e1f2a7b8c9d0e1f2a7b8c9d0e1f2a7b8c9d0abcd', 'Safari', 'macOS', 'https://download.parallels.com/desktop/v19/19.4.0-54962.dmg', '2024-11-02 09:58:00', '2024-11-02 10:05:00', 'complete', '{"steps":{"dmg_download":{"start_ms":0,"end_ms":95000},"pkg_install":{"start_ms":100000,"end_ms":250000},"activation":{"start_ms":255000,"end_ms":420000}}}'),
('sess-0004-mnop-3456', 'd6e7f8a3b4c5d6e7f8a3b4c5d6e7f8a3b4c5d6e7f8a3b4c5d6e7f8a3b4c5abcd', 'Firefox', 'macOS', 'https://download.parallels.com/desktop/v19/19.4.0-54962.dmg', '2024-11-02 14:40:00', NULL, 'failed', '{"steps":{"dmg_download":{"start_ms":0,"end_ms":110000},"pkg_install":{"start_ms":115000,"error":"insufficient_disk","error_at_ms":180000}}}'),
('sess-0005-qrst-7890', 'b0c1d2e3f4a9b0c1d2e3f4a9b0c1d2e3f4a9b0c1d2e3f4a9b0c1d2e3f4a9fabc', 'Safari', 'macOS', 'https://download.parallels.com/desktop/v19/19.4.1-54965.dmg', '2024-11-03 10:25:00', '2024-11-03 10:35:00', 'complete', '{"steps":{"dmg_download":{"start_ms":0,"end_ms":80000},"pkg_install":{"start_ms":85000,"end_ms":230000},"first_launch":{"start_ms":235000,"end_ms":350000},"license_entry":{"start_ms":355000,"end_ms":600000}}}'),
('sess-0006-uvwx-1234', 'a5b6c7d8e9f0a5b6c7d8e9f0a5b6c7d8e9f0a5b6c7d8e9f0a5b6c7d8e9f0fabc', 'Chrome', 'macOS', 'https://download.parallels.com/desktop/v19/19.4.1-54965.dmg', '2024-11-03 15:10:00', '2024-11-03 15:20:00', 'complete', '{"steps":{"dmg_download":{"start_ms":0,"end_ms":130000},"pkg_install":{"start_ms":135000,"end_ms":310000},"first_launch":{"start_ms":315000,"end_ms":600000}}}'),
('sess-0007-yzab-5678', 'f0a5b6c7d8e9f0a5b6c7d8e9f0a5b6c7d8e9f0a5b6c7d8e9f0a5b6c7d8e9fabc', 'Safari', 'macOS', 'https://download.parallels.com/desktop/v19/19.4.1-54965.dmg', '2024-11-04 10:55:00', '2024-11-04 11:05:00', 'complete', '{"steps":{"dmg_download":{"start_ms":0,"end_ms":90000},"pkg_install":{"start_ms":95000,"end_ms":260000},"activation":{"start_ms":265000,"end_ms":400000},"trial_activation":{"start_ms":405000,"end_ms":600000}}}'),
('sess-0008-cdef-9012', 'e1e2e3e4e5e6e1e2e3e4e5e6e1e2e3e4e5e6e1e2e3e4e5e6e1e2e3e4e5e6fabc', 'Safari', 'macOS', 'https://download.parallels.com/desktop/v19/19.4.1-54965.dmg', '2024-11-04 15:55:00', '2024-11-04 16:05:00', 'complete', '{"steps":{"dmg_download":{"start_ms":0,"end_ms":105000},"pkg_install":{"start_ms":110000,"end_ms":280000},"first_launch":{"start_ms":285000,"end_ms":600000}}}'),
('sess-0009-ghij-3456', 'c4d5e6f7a2b3c4d5e6f7a2b3c4d5e6f7a2b3c4d5e6f7a2b3c4d5e6f7a2b3efab', 'Chrome', 'macOS', 'https://download.parallels.com/desktop/v19/19.4.1-54965.dmg', '2024-11-05 11:40:00', NULL, 'abandoned', '{"steps":{"dmg_download":{"start_ms":0,"end_ms":100000},"eula_accept":{"start_ms":105000,"abandoned_at_ms":300000}}}'),
('sess-0010-klmn-7890', 'b9c0d1e2f3a8b9c0d1e2f3a8b9c0d1e2f3a8b9c0d1e2f3a8b9c0d1e2f3a8efab', 'Safari', 'macOS', 'https://download.parallels.com/desktop/v19/19.4.1-54965.dmg', '2024-11-05 15:55:00', '2024-11-05 16:05:00', 'complete', '{"steps":{"dmg_download":{"start_ms":0,"end_ms":85000},"pkg_install":{"start_ms":90000,"end_ms":240000},"first_launch":{"start_ms":245000,"end_ms":380000},"upgrade":{"start_ms":385000,"end_ms":600000,"previous_version":"19.3.1"}},"upgrade_from":"19.3.1"}'),
('sess-0011-opqr-1234', 'a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6abcd', 'Safari', 'macOS', 'https://download.parallels.com/desktop/v19/19.4.1-54965.dmg', '2024-11-06 07:50:00', '2024-11-06 08:00:00', 'complete', '{"steps":{"dmg_download":{"start_ms":0,"end_ms":75000},"pkg_install":{"start_ms":80000,"end_ms":220000},"first_launch":{"start_ms":225000,"end_ms":600000}},"upgrade_from":"19.4.0"}'),
('sess-0012-stuv-5678', 'ff01020304050607ff01020304050607ff01020304050607ff01020304050607', 'Edge', 'macOS', 'https://download.parallels.com/desktop/v19/19.4.1-54965.dmg', '2024-11-06 09:00:00', NULL, 'failed', '{"steps":{"dmg_download":{"start_ms":0,"error":"network_reset","error_at_ms":45000}}}'),
('sess-0013-wxyz-9012', 'aa11bb22cc33dd44aa11bb22cc33dd44aa11bb22cc33dd44aa11bb22cc33dd44', 'Safari', 'macOS', 'https://download.parallels.com/desktop/v19/19.4.1-54965.dmg', '2024-11-06 10:00:00', '2024-11-06 10:12:00', 'complete', '{"steps":{"dmg_download":{"start_ms":0,"end_ms":92000},"pkg_install":{"start_ms":97000,"end_ms":270000},"first_launch":{"start_ms":275000,"end_ms":720000}}}');
