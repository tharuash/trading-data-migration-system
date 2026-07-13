-- ==========================================================================================
-- 01_init_pdb_and_users.sql
--
-- SECTION A : Run connected to CDB root as SYSDBA
--             Create the dedicated pluggable database.
--
-- SECTION B : Run connected to EXCHANGE_SOURCE_PDB as SYSDBA
--             Create the schema-owner user.
--             Custom users tablespace.
-- ==========================================================================================

-- ==========================================================================================
-- SECTION A : CDB ROOT - Create the dedicated pluggable database
-- Connect as: SYSDBA @ CDB root
-- ==========================================================================================

ALTER SESSION SET CONTAINER = CDB$ROOT;

-- Drop the PDB if it already exists
BEGIN
    EXECUTE IMMEDIATE ('ALTER PLUGGABLE DATABASE exchange_source_pdb CLOSE IMMEDIATE');
EXCEPTION WHEN OTHERS THEN NULL; -- OTHERS handle all exceptions, default to do nothing.
END;
-- Indicates the end of the PL/SQL block
/    

BEGIN
    EXECUTE IMMEDIATE ('DROP PLUGGABLE DATABASE exchange_source_pdb INCLUDING DATAFILES');
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- Create the PDB from the seed template
-- FILE_NAME_CONVERT maps the seed data files paths to the new PDB data files paths
CREATE PLUGGABLE DATABASE exchange_source_pdb 
    ADMIN USER pdb_admin IDENTIFIED BY "pdb_admin_2026"
    ROLES = (DBA) -- DBA is the Oracle genral admin role
    FILE_NAME_CONVERT = (
        '/opt/oracle/oradata/FREE/pdbseed/', 
        '/opt/oracle/oradata/FREE/exchange_source_pdb/'
    );

-- Open the PDB and save its open state so it survives an oracle restart
ALTER PLUGGABLE DATABASE exchange_source_pdb OPEN;
ALTER PLUGGABLE DATABASE exchange_source_pdb SAVE STATE;


-- ==========================================================================================
-- SECTION B : EXCHANGE_SOURCE_PDB - Create schema user
-- Connect as: SYSDBA @ exchange_source_pdb
-- ==========================================================================================
   
ALTER SESSION SET CONTAINER = exchange_source_pdb; 
-- ------------------------------------------------------------------------------------------
-- SCHEMA OWNER - trading_data_store
--     Owns all the tables, views, and other objects in the schema.
--     Prefered not to use for application access.
-- ------------------------------------------------------------------------------------------
BEGIN
    EXECUTE IMMEDIATE 'DROP USER trading_data_store CASCADE';
EXCEPTION 
    WHEN OTHERS THEN
        IF SQLCODE != -01918 THEN -- Ignore "user does not exist" error
            RAISE;
        END IF;
END;
/


-- Uses tablespace is not available in the default dbf.
CREATE TABLESPACE users
    DATAFILE '/opt/oracle/oradata/FREE/exchange_source_pdb/users01.dbf'
    SIZE 100M
    AUTOEXTEND ON
    NEXT 50M
    MAXSIZE 2G;

CREATE USER trading_data_store
    IDENTIFIED BY "${TRADING_DATA_STORE_USER_PASSWORD}"
    DEFAULT TABLESPACE users
    TEMPORARY TABLESPACE temp
    QUOTA UNLIMITED ON users;

GRANT CREATE SESSION    TO trading_data_store;
GRANT CREATE TABLE      TO trading_data_store;
GRANT CREATE SEQUENCE   TO trading_data_store;
GRANT CREATE TRIGGER    TO trading_data_store;
GRANT CREATE VIEW       TO trading_data_store;
GRANT CREATE SYNONYM    TO trading_data_store;