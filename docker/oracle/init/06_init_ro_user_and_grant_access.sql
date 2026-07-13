-- ==========================================================================================
-- 06_init_ro_user_and_grant_access.sql
-- Run as SYSDBA connected to EXCHANGE_SOURCE_PDB
-- ==========================================================================================

ALTER SESSION SET CONTAINER = exchange_source_pdb;

-- ------------------------------------------------------------------------------------------
-- READ ONLY USER - trading_data_store_ro_user
--     SELECT only access to the schema objects owned by trading_data_store.
--     Quota 0 - Cannot create any objects in the schema.
-- ------------------------------------------------------------------------------------------
BEGIN
    EXECUTE IMMEDIATE 'DROP USER trading_data_store_ro_user CASCADE';
EXCEPTION 
    WHEN OTHERS THEN
        IF SQLCODE != -01918 THEN
            RAISE;
        END IF;
END;
/


CREATE USER trading_data_store_ro_user
    IDENTIFIED BY "${TRADING_DATA_STORE_RO_USER_PASSWORD}"
    DEFAULT TABLESPACE users
    TEMPORARY TABLESPACE temp
    QUOTA 0 ON users; 

-- ------------------------------------------------------------------------------------------
-- Access Granting
--      Only the SELECT access to the schema tables
-- ------------------------------------------------------------------------------------------

-- OBJECT GRANTS - trading_data_store -> trading_data_store_ro_user
-- Grants only SELECT
GRANT CREATE SESSION TO trading_data_store_ro_user;
GRANT SELECT ON trading_data_store.accounts         TO trading_data_store_ro_user;
GRANT SELECT ON trading_data_store.instruments      TO trading_data_store_ro_user;
GRANT SELECT ON trading_data_store.exchange_rates   TO trading_data_store_ro_user;
GRANT SELECT ON trading_data_store.orders           TO trading_data_store_ro_user;
GRANT SELECT ON trading_data_store.trades          TO trading_data_store_ro_user;

-- SYNONYMS are used to allow the read-only user to access the schema objects without needing 
-- to prefix them with the schema name.
CREATE OR REPLACE SYNONYM trading_data_store_ro_user.accounts 
    FOR trading_data_store.accounts;
CREATE OR REPLACE SYNONYM trading_data_store_ro_user.instruments 
    FOR trading_data_store.instruments;
CREATE OR REPLACE SYNONYM trading_data_store_ro_user.exchange_rates 
    FOR trading_data_store.exchange_rates;
CREATE OR REPLACE SYNONYM trading_data_store_ro_user.orders 
    FOR trading_data_store.orders;
CREATE OR REPLACE SYNONYM trading_data_store_ro_user.trades 
    FOR trading_data_store.trades; 