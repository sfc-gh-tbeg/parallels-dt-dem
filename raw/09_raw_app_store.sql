USE SCHEMA DEMO_PARALLELS.RAW;

CREATE OR REPLACE TABLE RAW_APP_STORE (
    ID          INT AUTOINCREMENT,
    APP_ID      VARCHAR,
    REPORT_DATE DATE,
    COUNTRY     VARCHAR,
    DEVICE      VARCHAR,
    BODY        VARCHAR
);

INSERT INTO RAW_APP_STORE (APP_ID, REPORT_DATE, COUNTRY, DEVICE, BODY) VALUES
('com.parallels.desktop.mac', '2024-11-01', 'US', 'Mac', '{"downloads":1250,"updates":3400,"revenue":48750.00,"ratings":{"average":4.5,"count":85},"crashes":12}'),
('com.parallels.desktop.mac', '2024-11-01', 'DE', 'Mac', '{"downloads":320,"updates":890,"revenue":12480.00,"ratings":{"average":4.4,"count":22},"crashes":3}'),
('com.parallels.desktop.mac', '2024-11-01', 'JP', 'Mac', '{"downloads":280,"updates":750,"revenue":10920.00,"ratings":{"average":4.6,"count":18},"crashes":2}'),
('com.parallels.desktop.mac', '2024-11-01', 'GB', 'Mac', '{"downloads":410,"updates":1100,"revenue":16390.00,"ratings":{"average":4.3,"count":35},"crashes":5}'),
('com.parallels.desktop.mac', '2024-11-01', 'FR', 'Mac', '{"downloads":195,"updates":520,"revenue":7605.00,"ratings":{"average":4.4,"count":12},"crashes":2}'),
('com.parallels.desktop.mac', '2024-11-02', 'US', 'Mac', '{"downloads":1180,"updates":3350,"revenue":46020.00,"ratings":{"average":4.5,"count":78},"crashes":10}'),
('com.parallels.desktop.mac', '2024-11-02', 'DE', 'Mac', '{"downloads":310,"updates":880,"revenue":12090.00,"ratings":{"average":4.4,"count":20},"crashes":4}'),
('com.parallels.desktop.mac', '2024-11-02', 'JP', 'Mac', '{"downloads":265,"updates":730,"revenue":10335.00,"ratings":{"average":4.5,"count":15},"crashes":1}'),
('com.parallels.desktop.mac', '2024-11-02', 'GB', 'Mac', '{"downloads":395,"updates":1080,"revenue":15405.00,"ratings":{"average":4.3,"count":32},"crashes":6}'),
('com.parallels.desktop.mac', '2024-11-02', 'BR', 'Mac', '{"downloads":145,"updates":380,"revenue":5655.00,"ratings":{"average":4.2,"count":8},"crashes":3}'),
('com.parallels.desktop.mac', '2024-11-03', 'US', 'Mac', '{"downloads":850,"updates":2800,"revenue":33150.00,"ratings":{"average":4.5,"count":55},"crashes":8}'),
('com.parallels.desktop.mac', '2024-11-03', 'DE', 'Mac', '{"downloads":220,"updates":700,"revenue":8580.00,"ratings":{"average":4.5,"count":14},"crashes":2}'),
('com.parallels.desktop.mac', '2024-11-03', 'JP', 'Mac', '{"downloads":195,"updates":600,"revenue":7605.00,"ratings":{"average":4.6,"count":10},"crashes":1}'),
('com.parallels.desktop.mac', '2024-11-03', 'CA', 'Mac', '{"downloads":180,"updates":490,"revenue":7020.00,"ratings":{"average":4.4,"count":11},"crashes":2}'),
('com.parallels.desktop.mac', '2024-11-03', 'AU', 'Mac', '{"downloads":120,"updates":340,"revenue":4680.00,"ratings":{"average":4.3,"count":7},"crashes":1}'),
('com.parallels.desktop.mac', '2024-11-04', 'US', 'Mac', '{"downloads":1320,"updates":3500,"revenue":51480.00,"ratings":{"average":4.5,"count":92},"crashes":14}'),
('com.parallels.desktop.mac', '2024-11-04', 'DE', 'Mac', '{"downloads":340,"updates":920,"revenue":13260.00,"ratings":{"average":4.4,"count":25},"crashes":3}'),
('com.parallels.desktop.mac', '2024-11-04', 'JP', 'Mac', '{"downloads":295,"updates":780,"revenue":11505.00,"ratings":{"average":4.6,"count":20},"crashes":2}'),
('com.parallels.desktop.mac', '2024-11-04', 'GB', 'Mac', '{"downloads":425,"updates":1150,"revenue":16575.00,"ratings":{"average":4.4,"count":38},"crashes":5}'),
('com.parallels.desktop.mac', '2024-11-04', 'IN', 'Mac', '{"downloads":165,"updates":420,"revenue":6435.00,"ratings":{"average":4.3,"count":10},"crashes":4}'),
('com.parallels.desktop.mac', '2024-11-05', 'US', 'Mac', '{"downloads":1290,"updates":3450,"revenue":50310.00,"ratings":{"average":4.5,"count":88},"crashes":11}'),
('com.parallels.desktop.mac', '2024-11-05', 'DE', 'Mac', '{"downloads":335,"updates":910,"revenue":13065.00,"ratings":{"average":4.5,"count":24},"crashes":2}'),
('com.parallels.desktop.mac', '2024-11-05', 'JP', 'Mac', '{"downloads":290,"updates":770,"revenue":11310.00,"ratings":{"average":4.6,"count":19},"crashes":1}'),
('com.parallels.desktop.mac', '2024-11-05', 'FR', 'Mac', '{"downloads":205,"updates":540,"revenue":7995.00,"ratings":{"average":4.4,"count":13},"crashes":2}'),
('com.parallels.desktop.mac', '2024-11-05', 'KR', 'Mac', '{"downloads":110,"updates":300,"revenue":4290.00,"ratings":{"average":4.5,"count":6},"crashes":1}'),
('com.parallels.desktop.mac', '2024-11-06', 'US', 'Mac', '{"downloads":1350,"updates":3550,"revenue":52650.00,"ratings":{"average":4.5,"count":95},"crashes":13}'),
('com.parallels.desktop.mac', '2024-11-06', 'DE', 'Mac', '{"downloads":345,"updates":930,"revenue":13455.00,"ratings":{"average":4.4,"count":26},"crashes":3}'),
('com.parallels.desktop.mac', '2024-11-06', 'JP', 'Mac', '{"downloads":300,"updates":790,"revenue":11700.00,"ratings":{"average":4.6,"count":21},"crashes":2}'),
('com.parallels.desktop.mac', '2024-11-06', 'GB', 'Mac', '{"downloads":430,"updates":1160,"revenue":16770.00,"ratings":{"average":4.4,"count":40},"crashes":4}'),
('com.parallels.desktop.mac', '2024-11-06', 'MX', 'Mac', '{"downloads":95,"updates":260,"revenue":3705.00,"ratings":{"average":4.3,"count":5},"crashes":2}');
