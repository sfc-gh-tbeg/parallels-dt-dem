-- Insert 7,000 PD desktop events (no sessionId)
INSERT INTO DEMO_ALLUDO_EVENTS.PLATFORM_EVENTS.RAW_EVENTS (NAMESPACE, BODY, RECEIVED_AT)
SELECT
  'pd_events_analytics',
  OBJECT_CONSTRUCT(
    'hwid', SHA2(UNIFORM(1, 999999, RANDOM())::VARCHAR, 256),
    'version', ARRAY_CONSTRUCT('19.4.1','19.3.0','19.2.2','18.5.0','20.0.1','20.1.0')[UNIFORM(0,5,RANDOM())::INT],
    'arch', ARRAY_CONSTRUCT('x86_64','arm64')[UNIFORM(0,1,RANDOM())::INT],
    'hw_model', ARRAY_CONSTRUCT('MacBookPro18,1','Mac14,2','MacBookAir10,1','Mac15,3','iMac21,1','MacBookPro16,1')[UNIFORM(0,5,RANDOM())::INT],
    'osLocale', ARRAY_CONSTRUCT('en_US','de_DE','ja_JP','fr_FR','zh_CN','es_ES','pt_BR','ko_KR')[UNIFORM(0,7,RANDOM())::INT],
    'osVersion', ARRAY_CONSTRUCT('14.5','14.6.1','15.0','15.0.1','15.1','13.6.1')[UNIFORM(0,5,RANDOM())::INT],
    'ab_switches', MD5(RANDOM()::VARCHAR),
    'events', CASE UNIFORM(1,3,RANDOM())
      WHEN 1 THEN ARRAY_CONSTRUCT(
        OBJECT_CONSTRUCT(
          'event_id', ARRAY_CONSTRUCT('vm.start','vm.stop','license.activate','vm.suspend','vm.resume','vm.snapshot','license.deactivate','vm.clone')[UNIFORM(0,7,RANDOM())::INT],
          'occured_at', DATEADD(SECOND, -UNIFORM(0, 2592000, RANDOM()), CURRENT_TIMESTAMP())::VARCHAR,
          'version', ARRAY_CONSTRUCT('19.4.1','19.3.0','19.2.2','18.5.0','20.0.1','20.1.0')[UNIFORM(0,5,RANDOM())::INT],
          'meta', OBJECT_CONSTRUCT(
            'comment', CASE WHEN UNIFORM(1,4,RANDOM())=1 THEN 'User triggered' ELSE NULL END,
            'guest_os_version', ARRAY_CONSTRUCT('Windows 11','Windows 10','Ubuntu 22.04','Ubuntu 24.04','Fedora 39','Debian 12')[UNIFORM(0,5,RANDOM())::INT],
            'guest_os_arch', 'x86_64',
            'license_edition', ARRAY_CONSTRUCT('Standard','Pro','Business')[UNIFORM(0,2,RANDOM())::INT],
            'license_status', ARRAY_CONSTRUCT('Active','Trial','Expired')[UNIFORM(0,2,RANDOM())::INT],
            'license_type', ARRAY_CONSTRUCT('Subscription','Perpetual')[UNIFORM(0,1,RANDOM())::INT]
          )
        )
      )
      WHEN 2 THEN ARRAY_CONSTRUCT(
        OBJECT_CONSTRUCT(
          'event_id', ARRAY_CONSTRUCT('vm.start','vm.stop','license.activate','vm.suspend')[UNIFORM(0,3,RANDOM())::INT],
          'occured_at', DATEADD(SECOND, -UNIFORM(0, 2592000, RANDOM()), CURRENT_TIMESTAMP())::VARCHAR,
          'version', ARRAY_CONSTRUCT('19.4.1','19.3.0','20.0.1')[UNIFORM(0,2,RANDOM())::INT],
          'meta', OBJECT_CONSTRUCT('comment', NULL, 'guest_os_version', 'Windows 11', 'guest_os_arch', 'x86_64', 'license_edition', 'Pro', 'license_status', 'Active', 'license_type', 'Subscription')
        ),
        OBJECT_CONSTRUCT(
          'event_id', ARRAY_CONSTRUCT('vm.resume','vm.snapshot','license.deactivate','vm.clone')[UNIFORM(0,3,RANDOM())::INT],
          'occured_at', DATEADD(SECOND, -UNIFORM(0, 2592000, RANDOM()), CURRENT_TIMESTAMP())::VARCHAR,
          'version', ARRAY_CONSTRUCT('19.4.1','19.3.0','20.0.1')[UNIFORM(0,2,RANDOM())::INT],
          'meta', OBJECT_CONSTRUCT('comment', 'Auto event', 'guest_os_version', 'Ubuntu 22.04', 'guest_os_arch', 'x86_64', 'license_edition', 'Standard', 'license_status', 'Trial', 'license_type', 'Perpetual')
        )
      )
      ELSE ARRAY_CONSTRUCT(
        OBJECT_CONSTRUCT('event_id','vm.start','occured_at',DATEADD(SECOND,-UNIFORM(0,2592000,RANDOM()),CURRENT_TIMESTAMP())::VARCHAR,'version','19.4.1','meta',OBJECT_CONSTRUCT('comment',NULL,'guest_os_version','Windows 11','guest_os_arch','x86_64','license_edition','Business','license_status','Active','license_type','Subscription')),
        OBJECT_CONSTRUCT('event_id','vm.stop','occured_at',DATEADD(SECOND,-UNIFORM(0,2592000,RANDOM()),CURRENT_TIMESTAMP())::VARCHAR,'version','19.4.1','meta',OBJECT_CONSTRUCT('comment',NULL,'guest_os_version','Windows 11','guest_os_arch','x86_64','license_edition','Business','license_status','Active','license_type','Subscription')),
        OBJECT_CONSTRUCT('event_id','license.activate','occured_at',DATEADD(SECOND,-UNIFORM(0,2592000,RANDOM()),CURRENT_TIMESTAMP())::VARCHAR,'version','19.4.1','meta',OBJECT_CONSTRUCT('comment','Renewal','guest_os_version','Windows 10','guest_os_arch','x86_64','license_edition','Pro','license_status','Active','license_type','Subscription'))
      )
    END
  )::VARCHAR,
  DATEADD(SECOND, -UNIFORM(0, 2592000, RANDOM()), CURRENT_TIMESTAMP())::VARCHAR
FROM TABLE(GENERATOR(ROWCOUNT => 7000));

-- Insert 3,000 installer events (HAS sessionId)
INSERT INTO DEMO_ALLUDO_EVENTS.PLATFORM_EVENTS.RAW_EVENTS (NAMESPACE, BODY, RECEIVED_AT)
SELECT
  'pd_events_analytics',
  OBJECT_CONSTRUCT(
    'hwid', SHA2(UNIFORM(1, 999999, RANDOM())::VARCHAR, 256),
    'sessionId', UUID_STRING(),
    'browser', ARRAY_CONSTRUCT('Chrome','Safari','Edge','Firefox')[UNIFORM(0,3,RANDOM())::INT],
    'osType', ARRAY_CONSTRUCT('macOS','Windows')[UNIFORM(0,1,RANDOM())::INT],
    'osLocale', ARRAY_CONSTRUCT('en_US','de_DE','ja_JP','fr_FR')[UNIFORM(0,3,RANDOM())::INT],
    'osVersion', ARRAY_CONSTRUCT('14.5','14.6.1','15.0','15.0.1','10.0.22631')[UNIFORM(0,4,RANDOM())::INT],
    'events', CASE UNIFORM(1,3,RANDOM())
      WHEN 1 THEN ARRAY_CONSTRUCT(
        OBJECT_CONSTRUCT('event_id','installer.download','occured_at',DATEADD(SECOND,-UNIFORM(0,2592000,RANDOM()),CURRENT_TIMESTAMP())::VARCHAR)
      )
      WHEN 2 THEN ARRAY_CONSTRUCT(
        OBJECT_CONSTRUCT('event_id','installer.download','occured_at',DATEADD(SECOND,-UNIFORM(0,2592000,RANDOM()),CURRENT_TIMESTAMP())::VARCHAR),
        OBJECT_CONSTRUCT('event_id','installer.start','occured_at',DATEADD(SECOND,-UNIFORM(0,2592000,RANDOM()),CURRENT_TIMESTAMP())::VARCHAR)
      )
      ELSE ARRAY_CONSTRUCT(
        OBJECT_CONSTRUCT('event_id','installer.download','occured_at',DATEADD(SECOND,-UNIFORM(0,2592000,RANDOM()),CURRENT_TIMESTAMP())::VARCHAR),
        OBJECT_CONSTRUCT('event_id','installer.start','occured_at',DATEADD(SECOND,-UNIFORM(0,2592000,RANDOM()),CURRENT_TIMESTAMP())::VARCHAR),
        OBJECT_CONSTRUCT('event_id','installer.complete','occured_at',DATEADD(SECOND,-UNIFORM(0,2592000,RANDOM()),CURRENT_TIMESTAMP())::VARCHAR)
      )
    END
  )::VARCHAR,
  DATEADD(SECOND, -UNIFORM(0, 2592000, RANDOM()), CURRENT_TIMESTAMP())::VARCHAR
FROM TABLE(GENERATOR(ROWCOUNT => 3000));
