-- ==========================================================================================
-- 03_create_tables.sql
-- DDLs for table creation and granting access for application users
-- ==========================================================================================

-- To store data migration batch details - for auditing
CREATE TABLE trading_reports_store.migration_batches (
    batch_id                VARCHAR(100) PRIMARY KEY,
    job_name                VARCHAR(150) NOT NULL,
    status                  VARCHAR(50) NOT NULL,
    job_params              TEXT,
    started_at              TIMESTAMP,
    ended_at                TIMESTAMP,
    total_source_count      BIGINT DEFAULT 0,
    total_staging_count     BIGINT DEFAULT 0,
    total_target_count      BIGINT DEFAULT 0,
    total_error_count       BIGINT DEFAULT 0,
    created_by              VARCHAR(100),
    created_at              TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at              TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Staging table stores transformed records before SCD-2 merge. Includes deterministic record_hash and effective_from timestamp used for change detection
-- target validity dates  
CREATE TABLE trading_reports_store.staging_trade_reports (
    batch_id                VARCHAR(100) NOT NULL,
    trade_id                BIGINT NOT NULL,
    order_id                BIGINT NOT NULL,
    account_id              BIGINT NOT NULL,
    symbol                  VARCHAR(50) NOT NULL,
    asset_class             VARCHAR(50),
    exchange_code           VARCHAR(50),
    customer_type           VARCHAR(50),
    country                 VARCHAR(50),
    risk_category           VARCHAR(50),
    quantity                NUMERIC(20, 6) NOT NULL,
    price                   NUMERIC(20, 6) NOT NULL,
    currency                VARCHAR(10) NOT NULL,
    trade_value             NUMERIC(20, 6) NOT NULL,
    trade_value_usd         NUMERIC(20,6),
    normalized_trade_status VARCHAR(50) NOT NULL,
    order_type              VARCHAR(50),
    trade_timestamp         TIMESTAMP NOT NULL,
    record_hash             VARCHAR(128) NOT NULL,
    source_created_at       TIMESTAMP,
    source_updated_at       TIMESTAMP,
    ended_at                TIMESTAMP,
    effective_from          TIMESTAMP NOT NULL,
    created_at              TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (batch_id, trade_id)
);

-- Final target table with versioned data model
CREATE TABLE trading_reports_store.trade_reports (
    trade_report_version_id BIGSERIAL PRIMARY KEY,
    trade_id                BIGINT NOT NULL,
    order_id                BIGINT NOT NULL,
    account_id              BIGINT NOT NULL,
    symbol                  VARCHAR(50) NOT NULL,
    asset_class             VARCHAR(50),
    exchange_code           VARCHAR(50),
    customer_type           VARCHAR(50),
    country                 VARCHAR(50),
    risk_category           VARCHAR(50),
    quantity                NUMERIC(20, 6) NOT NULL,
    price                   NUMERIC(20, 6) NOT NULL,
    currency                VARCHAR(10) NOT NULL,
    trade_value             NUMERIC(20, 6) NOT NULL,
    trade_value_usd         NUMERIC(20,6),
    normalized_trade_status VARCHAR(50) NOT NULL,
    order_type              VARCHAR(50),
    trade_timestamp         TIMESTAMP NOT NULL,
    record_hash             VARCHAR(128) NOT NULL,
    valid_from              TIMESTAMP NOT NULL,
    valid_to                TIMESTAMP,
    is_current              BOOLEAN NOT NULL DEFAULT TRUE,
    created_batch_id        VARCHAR(100) NOT NULL,
    expired_batch_id        VARCHAR(100),
    created_at              TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at              TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE UNIQUE INDEX uq_trade_reports_current_trade ON trading_reports_store.trade_reports(trade_id) WHERE is_current = TRUE;

-- Failures, errors are stored in errors table.
CREATE TABLE trading_reports_store.migration_errors (
    error_id                BIGSERIAL PRIMARY KEY,
    batch_id                VARCHAR(100) NOT NULL,
    partition_id            VARCHAR(100),
    trade_id                BIGINT,
    order_id                BIGINT,
    error_type              VARCHAR(100) NOT NULL,
    error_code              VARCHAR(100) NOT NULL,
    error_message           TEXT,
    source_payload          TEXT,
    review_status           VARCHAR(50) DEFAULT 'NEW',
    reviewed_by             VARCHAR(100),
    reviewed_at             TIMESTAMP,
    comment                 TEXT,
    created_at              TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA trading_reports_store TO trading_report_store_user;