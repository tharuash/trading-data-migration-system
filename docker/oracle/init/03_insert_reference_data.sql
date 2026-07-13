-- ==========================================================================================
-- 03_insert_reference_data.sql
-- DML for inserting data into the reference tables in the trading_data_store schema.
-- Run as SYSDBA connected to EXCHANGE_SOURCE_PDB
-- ==========================================================================================

ALTER SESSION SET CONTAINER = exchange_source_pdb;
-- ------------------------------------------------------------------------------------------
-- 01. insturments - 80 real-world referece instruments across all supported asset classes.
-- ------------------------------------------------------------------------------------------
DELETE FROM trading_data_store.instruments;

INSERT ALL
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('AAPL','EQUITY','XNAS','USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('MSFT','EQUITY','XNAS','USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('AMZN','EQUITY','XNAS','USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('GOOGL','EQUITY','XNAS','USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('TSLA','EQUITY','XNAS','USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('NVDA','EQUITY','XNAS','USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('META','EQUITY','XNAS','USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('JPM','EQUITY','XNYS','USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('BAC','EQUITY','XNYS','USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('GS','EQUITY','XNYS','USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('MS','EQUITY','XNYS','USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('WFC','EQUITY','XNYS','USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('V', 'EQUITY', 'XNYS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('MA','EQUITY','XNYS','USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('JNJ','EQUITY','XNYS','USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('PFE', 'EQUITY', 'XNYS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('UNH', 'EQUITY', 'XNYS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('XOM', 'EQUITY', 'XNYS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('CVX','EQUITY','XNYS','USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('CAT','EQUITY','XNYS','USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('BA','EQUITY','XNYS','USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('GE','EQUITY','XNYS','USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('IBM', 'EQUITY', 'XNYS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('ORCL', 'EQUITY', 'XNYS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('INTC', 'EQUITY', 'XNAS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('AMD', 'EQUITY', 'XNAS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('QCOM','EQUITY','XNAS','USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('NFLX', 'EQUITY', 'XNAS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('DIS', 'EQUITY', 'XNYS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('KO', 'EQUITY', 'XNYS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('US10Y', 'EQUITY', 'XNYS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('US30Y', 'FIXED_INCOME', 'XNAS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('UK10Y', 'FIXED_INCOME', 'XNAS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('DE10Y', 'FIXED_INCOME', 'XNAS', 'GBP')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('JP10Y', 'FIXED_INCOME', 'XNAS', 'JPY')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('FR10Y', 'FIXED_INCOME', 'XNAS', 'EUR')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('IT10Y', 'FIXED_INCOME', 'XNAS', 'EUR')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('AU10Y', 'FIXED_INCOME', 'XNAS', 'AUD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('EURUSD', 'FX', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('USDJPY', 'FX', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('GBPUSD', 'FX', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('USDCHF', 'FX', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('AUDUSD', 'FX', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('USDCAD', 'FX', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('USDSGD', 'FX', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('USDHKD', 'FX', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('USDINR', 'FX', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('EURGBP', 'FX', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('EURJPY', 'FX', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('GBPJPY', 'FX', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('CL1', 'COMMODITY', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('NG1', 'COMMODITY', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('GC1', 'COMMODITY', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('SI1', 'COMMODITY', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('HG1', 'COMMODITY', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('ZW1', 'COMMODITY', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('ZC1', 'COMMODITY', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('ZS1', 'COMMODITY', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('LB1', 'COMMODITY', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('PA1', 'COMMODITY', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('ES1', 'DERIVATIVE', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('NQ1', 'DERIVATIVE', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('YM1', 'DERIVATIVE', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('RTY1', 'DERIVATIVE', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('VIX1', 'DERIVATIVE', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('ZN1', 'DERIVATIVE', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('ZB1', 'DERIVATIVE', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('ZT1', 'DERIVATIVE', 'XCME', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('SPY', 'ETF', 'XNYS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('QQQ', 'ETF', 'XNAS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('IWM', 'ETF', 'XNYS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('GLD', 'ETF', 'XNYS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('SLV', 'ETF', 'XNYS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('USO', 'ETF', 'XNYS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('TLT', 'ETF', 'XNAS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('HYG', 'ETF', 'XNYS', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('BTCUSD', 'CRYPTO', 'XCRY', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('ETHUSD', 'CRYPTO', 'XCRY', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('SOLUSD', 'CRYPTO', 'XCRY', 'USD')
    INTO trading_data_store.instruments (symbol, asset_class, exchange_code, currency) VALUES ('ADAUSD', 'CRYPTO', 'XCRY', 'USD')
SELECT 1 FROM dual;


-- ------------------------------------------------------------------------------------------
-- 02. accounts - 200 accounts with realistc geography and risk distribution by type
-- ------------------------------------------------------------------------------------------
DELETE FROM trading_data_store.accounts;

-- 120 Retail Accounts
INSERT ALL
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'USA', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'GBR', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'DEU', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'FRA', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'AUS', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'CAN', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'SGP', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'JPN', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'CHE', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'NLD', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'SWE', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'NOR', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'DNK', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'FIN', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'ITA', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'ESP', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'PRT', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'BEL', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'AUT', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'NZL', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'USA', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'GBR', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'DEU', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'FRA', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'AUS', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'CAN', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'SGP', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'JPN', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'CHE', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'NLD', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'SWE', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'NOR', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'DNK', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'FIN', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'ITA', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'ESP', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'PRT', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'BEL', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'AUT', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'NZL', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'USA', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'GBR', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'DEU', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'FRA', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'AUS', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'CAN', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'SGP', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'JPN', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'CHE', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'NLD', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'SWE', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'NOR', 'LOW')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'DNK', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'FIN', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'ITA', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'ESP', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'PRT', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'BEL', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'AUT', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'NZL', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'USA', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'GBR', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'DEU', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'FRA', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'AUS', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'CAN', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'SGP', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'JPN', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'CHE', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'NLD', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'SWE', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'NOR', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'DNK', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'FIN', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'ITA', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'ESP', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'PRT', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'BEL', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'AUT', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'NZL', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'USA', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'GBR', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'DEU', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'FRA', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'AUS', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'CAN', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'SGP', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'JPN', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'CHE', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'NLD', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'SWE', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'NOR', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'DNK', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'FIN', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'ITA', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'ESP', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'PRT', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'BEL', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'AUT', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'NZL', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'USA', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'GBR', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'DEU', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'FRA', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'AUS', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'CAN', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'SGP', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'JPN', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'CHE', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'NLD', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'SWE', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'NOR', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'DNK', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'FIN', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'ITA', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'ESP', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'PRT', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'BEL', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'AUT', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('RETAIL', 'NZL', 'HIGH')
SELECT 1 FROM dual;

-- 50 Institutional Accounts
INSERT ALL
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'USA', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'GBR', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'DEU', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'FRA', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'CHE', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'SGP', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'HKG', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'JPN', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'AUS', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'LUX', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'IRE', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'CYM', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'USA', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'GBR', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'DEU', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'FRA', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'CHE', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'SGP', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'HKG', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'JPN', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'AUS', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'LUX', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'IRE', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'CYM', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'USA', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'GBR', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'DEU', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'FRA', 'MEDIUM')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'CHE', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'SGP', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'HKG', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'JPN', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'AUS', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'LUX', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'IRE', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'CYM', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'USA', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'GBR', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'DEU', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'FRA', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'CHE', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'SGP', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'HKG', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'JPN', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'AUS', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'LUX', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'IRE', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'CYM', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'USA', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('INSTITUTIONAL', 'GBR', 'HIGH')
SELECT 1 FROM dual;

-- 20 Market Maker Accounts
INSERT ALL
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('MARKET_MAKER', 'USA', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('MARKET_MAKER', 'GBR', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('MARKET_MAKER', 'DEU', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('MARKET_MAKER', 'NLD', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('MARKET_MAKER', 'SGP', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('MARKET_MAKER', 'CHE', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('MARKET_MAKER', 'USA', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('MARKET_MAKER', 'GBR', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('MARKET_MAKER', 'DEU', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('MARKET_MAKER', 'NLD', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('MARKET_MAKER', 'SGP', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('MARKET_MAKER', 'CHE', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('MARKET_MAKER', 'USA', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('MARKET_MAKER', 'GBR', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('MARKET_MAKER', 'DEU', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('MARKET_MAKER', 'NLD', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('MARKET_MAKER', 'SGP', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('MARKET_MAKER', 'CHE', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('MARKET_MAKER', 'USA', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('MARKET_MAKER', 'GBR', 'HIGH')
SELECT 1 FROM dual;

-- 10 Proprietary Accounts
INSERT ALL
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('PROPRIETARY', 'USA', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('PROPRIETARY', 'GBR', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('PROPRIETARY', 'CHE', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('PROPRIETARY', 'SGP', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('PROPRIETARY', 'USA', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('PROPRIETARY', 'GBR', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('PROPRIETARY', 'CHE', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('PROPRIETARY', 'SGP', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('PROPRIETARY', 'USA', 'HIGH')
    INTO trading_data_store.accounts (customer_type, country, risk_category) VALUES ('PROPRIETARY', 'GBR', 'HIGH')
SELECT 1 FROM dual;

-- ------------------------------------------------------------------------------------------
-- 03. exchange_rates - Trading day USD conversion rates from 2023-01-02 to 2025-12-31
--                      Uses a deterministic drift + sine-wave pattern for realistic movement 
-- ------------------------------------------------------------------------------------------
DELETE FROM trading_data_store.exchange_rates;

DECLARE
    v_rate_date DATE := DATE '2023-01-02';
    v_days  NUMBER;
    v_eur   NUMBER(18, 8);
    v_gbp   NUMBER(18, 8);
    v_jpy   NUMBER(18, 8);
    v_chf   NUMBER(18, 8);
    v_aud   NUMBER(18, 8);
    v_cad   NUMBER(18, 8);
    v_sgd   NUMBER(18, 8);
    v_hkd   NUMBER(18, 8);
    v_inr   NUMBER(18, 8);
BEGIN
    WHILE v_rate_date <= DATE '2025-12-31' LOOP
        IF TO_CHAR(v_rate_date, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') NOT IN ('SAT','SUN') THEN
            v_days := v_rate_date - DATE '2023-01-02';

            v_eur := ROUND(1.075 + (0.018 * SIN(v_days / 42)) + (0.010 * SIN(v_days / 131)) + (0.000020 * v_days), 8);
            v_gbp := ROUND(1.245 + (0.026 * SIN(v_days / 47)) + (0.012 * SIN(v_days / 149)) + (0.000015 * v_days), 8);
            v_jpy := ROUND(1 / (141 + (7 * SIN(v_days / 55)) + (5 * SIN(v_days / 173)) + (0.0025 * v_days)), 8); 
            v_chf := ROUND(1.105 + (0.012 * SIN(v_days / 39)) + (0.006 * SIN(v_days / 167)) + (0.000005 * v_days), 8);
            v_aud := ROUND(0.655 + (0.022 * SIN(v_days / 34)) + (0.010 * SIN(v_days / 113)) + (0.000008 * v_days), 8);
            v_cad := ROUND(0.742 + (0.012 * SIN(v_days / 44)) + (0.006 * SIN(v_days / 151)) + (0.000006 * v_days), 8);
            v_sgd := ROUND(0.744 + (0.009 * SIN(v_days / 48)) + (0.004 * SIN(v_days / 143)) + (0.000004 * v_days), 8);
            v_hkd := ROUND(0.12755 + (0.00025 * SIN(v_days / 29)) + (0.00010 * SIN(v_days / 97)), 8); 
            v_inr := ROUND(0.01225 + (0.00035 * SIN(v_days / 41)) + (0.00018 * SIN(v_days / 137)) - (0.00000015 * v_days), 8);

            INSERT INTO trading_data_store.exchange_rates (currency, rate_date, usd_rate) VALUES ('USD', v_rate_date, 1.00000000);
            INSERT INTO trading_data_store.exchange_rates (currency, rate_date, usd_rate) VALUES ('EUR', v_rate_date, v_eur);
            INSERT INTO trading_data_store.exchange_rates (currency, rate_date, usd_rate) VALUES ('GBP', v_rate_date, v_gbp);
            INSERT INTO trading_data_store.exchange_rates (currency, rate_date, usd_rate) VALUES ('JPY', v_rate_date, v_jpy);
            INSERT INTO trading_data_store.exchange_rates (currency, rate_date, usd_rate) VALUES ('CHF', v_rate_date, v_chf);
            INSERT INTO trading_data_store.exchange_rates (currency, rate_date, usd_rate) VALUES ('AUD', v_rate_date, v_aud);
            INSERT INTO trading_data_store.exchange_rates (currency, rate_date, usd_rate) VALUES ('CAD', v_rate_date, v_cad);
            INSERT INTO trading_data_store.exchange_rates (currency, rate_date, usd_rate) VALUES ('SGD', v_rate_date, v_sgd);
            INSERT INTO trading_data_store.exchange_rates (currency, rate_date, usd_rate) VALUES ('HKD', v_rate_date, v_hkd);
            INSERT INTO trading_data_store.exchange_rates (currency, rate_date, usd_rate) VALUES ('INR', v_rate_date, v_inr);

        END IF;
        v_rate_date := v_rate_date + 1;
    END LOOP;
END;
/

COMMIT;



