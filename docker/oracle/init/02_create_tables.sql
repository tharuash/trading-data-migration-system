-- ==========================================================================================
-- 02_create_tables.sql
-- DDL for all tables in the trading_data_store schema.
-- Run as SYSDBA connected to EXCHANGE_SOURCE_PDB
-- ==========================================================================================

ALTER SESSION SET CONTAINER = exchange_source_pdb;
-- ------------------------------------------------------------------------------------------
-- Sequences
-- ------------------------------------------------------------------------------------------
CREATE SEQUENCE trading_data_store.account_id_seq
    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE SEQUENCE trading_data_store.instrument_id_seq
    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE SEQUENCE trading_data_store.order_id_seq
    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE SEQUENCE trading_data_store.trade_id_seq
    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

-- ------------------------------------------------------------------------------------------
-- Tables
-- ------------------------------------------------------------------------------------------
CREATE TABLE trading_data_store.accounts (
    account_id      NUMBER(18) NOT NULL,
    customer_type   VARCHAR2(50) NOT NULL, -- RETAIL | INSTITUTIONAL | MARKET_MAKER | PROPRIETARY
    country         VARCHAR2(3) NOT NULL,
    risk_category   VARCHAR2(20) NOT NULL, -- LOW | MEDIUM | HIGH 
    created_at      TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    updated_at      TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    CONSTRAINT pk_accounts PRIMARY KEY (account_id),
    CONSTRAINT ck_customer_type CHECK (customer_type IN 
                                        ('RETAIL', 'INSTITUTIONAL', 'MARKET_MAKER', 'PROPRIETARY')),
    CONSTRAINT ck_risk_category CHECK (risk_category IN ('LOW', 'MEDIUM', 'HIGH')),
    CONSTRAINT ck_country CHECK (REGEXP_LIKE(country,'^[A-Z]{2,3}$'))                                    
);

-- Trigger will automatically assign a unique account_id from the 
-- sequence if not provided during insert.
CREATE OR REPLACE TRIGGER trading_data_store.trg_accounts_bi
    BEFORE INSERT ON trading_data_store.accounts
    FOR EACH ROW
BEGIN
    IF :NEW.account_id IS NULL THEN
        :NEW.account_id := trading_data_store.account_id_seq.NEXTVAL;
    END IF;
END;
/

CREATE INDEX trading_data_store.idx_accounts_country 
    ON trading_data_store.accounts(country);

CREATE INDEX trading_data_store.idx_accounts_risk_category 
    ON trading_data_store.accounts(risk_category);    

-- -----------------------------------------------------------------------------------------
CREATE TABLE trading_data_store.instruments (
    instrument_id   NUMBER(18) NOT NULL,
    symbol          VARCHAR2(50) NOT NULL,
    asset_class     VARCHAR2(30) NOT NULL,
    exchange_code   VARCHAR2(10) NOT NULL, -- MIC Code 
    currency        VARCHAR2(10) NOT NULL,
    created_at      TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    updated_at      TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    CONSTRAINT pk_instruments PRIMARY KEY (instrument_id),
    CONSTRAINT uq_instrument_symbol UNIQUE (symbol, exchange_code),
    CONSTRAINT ck_asset_class CHECK (asset_class IN 
                                        ('EQUITY', 'FIXED_INCOME', 'FX', 'COMMODITY', 
                                        'DERIVATIVE', 'ETF', 'CRYPTO')),
    CONSTRAINT ck_currency CHECK (REGEXP_LIKE(currency,'^[A-Z]{3}$'))                                    
);

CREATE OR REPLACE TRIGGER trading_data_store.trg_instruments_bi
    BEFORE INSERT ON trading_data_store.instruments
    FOR EACH ROW
BEGIN
    IF :NEW.instrument_id IS NULL THEN
        :NEW.instrument_id := trading_data_store.instrument_id_seq.NEXTVAL;
    END IF;
END;
/

CREATE INDEX trading_data_store.idx_instrument_symbol 
    ON trading_data_store.instruments(symbol);

CREATE INDEX trading_data_store.idx_instruments_asset_class 
    ON trading_data_store.instruments(asset_class); 

CREATE INDEX trading_data_store.idx_instruments_exchange
    ON trading_data_store.instruments(exchange_code);  

-- -----------------------------------------------------------------------------------------
CREATE TABLE trading_data_store.exchange_rates (
    currency    VARCHAR2(10) NOT NULL,
    rate_date   DATE NOT NULL,
    usd_rate    NUMBER(18,8) NOT NULL,
    created_at  TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    CONSTRAINT pk_exchange_rates PRIMARY KEY (currency, rate_date),
    CONSTRAINT ck_usd_rate_positive CHECK (usd_rate > 0),
    CONSTRAINT ck_exchange_currency CHECK (REGEXP_LIKE(currency,'^[A-Z]{3}$'))                                    
);

CREATE INDEX trading_data_store.idx_exchange_rate_date
    ON trading_data_store.exchange_rates(rate_date);

-- -----------------------------------------------------------------------------------------
CREATE TABLE trading_data_store.orders (
    order_id        NUMBER(18) NOT NULL,
    account_id      NUMBER(18) NOT NULL,
    order_type      VARCHAR2(20) NOT NULL,
    order_status    VARCHAR2(20) NOT NULL,
    created_at      TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    updated_at      TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    CONSTRAINT pk_orders PRIMARY KEY (order_id),
    CONSTRAINT fk_orders_account FOREIGN KEY (account_id) 
        REFERENCES trading_data_store.accounts(account_id),
    CONSTRAINT ck_order_type CHECK (order_type IN 
                                        ('MARKET', 'LIMIT', 'STOP', 'STOP_LIMIT', 'IOC', 'FOK')),
    CONSTRAINT ck_order_status CHECK (order_status IN 
                                        ('NEW', 'FILLED', 'PARTIALLY_FILLED', 
                                        'CANCELLED', 'REJECTED', 'EXPIRED'))                                    
);

CREATE OR REPLACE TRIGGER trading_data_store.trg_orders_bi
    BEFORE INSERT ON trading_data_store.orders
    FOR EACH ROW
BEGIN
    IF :NEW.order_id IS NULL THEN
        :NEW.order_id := trading_data_store.order_id_seq.NEXTVAL;
    END IF;
END;
/

CREATE INDEX trading_data_store.idx_orders_account
    ON trading_data_store.orders(account_id);

CREATE INDEX trading_data_store.idx_orders_status 
    ON trading_data_store.orders(order_status);

CREATE INDEX trading_data_store.idx_orders_created
    ON trading_data_store.orders(created_at);  

-- -----------------------------------------------------------------------------------------
CREATE TABLE trading_data_store.trades (
    trade_id        NUMBER(18) NOT NULL,
    order_id        NUMBER(18) NOT NULL,
    instrument_id   NUMBER(18) NOT NULL,
    quantity        NUMBER(20,6) NOT NULL,
    price           NUMBER(20,6) NOT NULL,
    currency        VARCHAR2(10) NOT NULL,
    trade_status    VARCHAR2(30) NOT NULL,
    trade_timestamp TIMESTAMP NOT NULL, 
    created_at      TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    updated_at      TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    CONSTRAINT pk_trades PRIMARY KEY (trade_id),
    CONSTRAINT fk_trades_order FOREIGN KEY (order_id)
        REFERENCES trading_data_store.orders(order_id),
    CONSTRAINT fk_trades_instrument FOREIGN KEY (instrument_id)
        REFERENCES trading_data_store.instruments(instrument_id),
    CONSTRAINT ck_trades_quantity_positive CHECK (quantity > 0),
    CONSTRAINT ck_trades_price_positive CHECK (price > 0),
    CONSTRAINT ck_trades_currency CHECK (REGEXP_LIKE(currency,'^[A-Z]{3}$')),
    CONSTRAINT ck_trade_status CHECK (trade_status IN 
                                        ('EXECUTED', 'SETTLED', 'PENDING_SETTLEMENT', 'CANCELLED',
                                         'FAILED', 'REVERSED', 'PARTIALY_FILL'))                                    
);    

CREATE OR REPLACE TRIGGER trading_data_store.trg_trades_bi
    BEFORE INSERT ON trading_data_store.trades
    FOR EACH ROW
BEGIN
    IF :NEW.trade_id IS NULL THEN
        :NEW.trade_id := trading_data_store.trade_id_seq.NEXTVAL;
    END IF;
END;
/

CREATE INDEX trading_data_store.idx_trades_order 
    ON trading_data_store.trades(order_id);

CREATE INDEX trading_data_store.idx_trades_instrument
    ON trading_data_store.trades(instrument_id);

CREATE INDEX trading_data_store.idx_trades_currency 
    ON trading_data_store.trades(currency); 

CREATE INDEX trading_data_store.idx_trades_status 
    ON trading_data_store.trades(trade_status);

CREATE INDEX trading_data_store.idx_trades_timestamp 
    ON trading_data_store.trades(trade_timestamp);

CREATE INDEX trading_data_store.idx_trade_order_instrument_currency 
    ON trading_data_store.trades(trade_id, order_id, instrument_id, currency);    