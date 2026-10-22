# Alludo Parallels Desktop - Dynamic Tables Demo

Demonstrates how Snowflake Dynamic Tables replace manual ETL pipelines for
flattening nested JSON event data from the Parallels Desktop analytics platform.

## Architecture

```
RAW_EVENTS (JSON blobs)
  ├── PD_EVENTS_FLAT        (DT, incremental, 1-day lag)
  └── INSTALLER_EVENTS_FLAT (DT, incremental, 1-day lag)
```

## Objects Created

| Object | Type | Description |
|--------|------|-------------|
| `DEMO_ALLUDO_EVENTS` | Database | Demo container |
| `PLATFORM_EVENTS` | Schema | Raw ingestion layer |
| `FLATTENED_EVENTS` | Schema | Transformed output layer |
| `DEMO_WH` | Warehouse | X-Small, auto-suspend 120s |
| `RAW_EVENTS` | Table | 10K synthetic rows (70% PD / 30% installer) |
| `PD_EVENTS_FLAT` | Dynamic Table | Flattened PD desktop events |
| `INSTALLER_EVENTS_FLAT` | Dynamic Table | Flattened installer events |

## Running the Scripts

Execute in order:
```
01_setup.sql            -- database, schema, warehouse
02_raw_events_ddl.sql   -- source table DDL
03_synthetic_data.sql   -- 10K synthetic rows
04_dt_pd_events.sql     -- PD events dynamic table
05_dt_installer_events.sql -- installer events dynamic table
06_validate.sql         -- verification queries
```

## Cleanup

```sql
DROP DATABASE IF EXISTS DEMO_ALLUDO_EVENTS;
DROP WAREHOUSE IF EXISTS DEMO_WH;
```
