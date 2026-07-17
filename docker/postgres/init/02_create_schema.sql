-- ==========================================================================================
-- 02_create_schema.sql
-- DDL for schema creation and granting access for application users
-- ==========================================================================================

CREATE SCHEMA IF NOT EXISTS trading_reports_store AUTHORIZATION postgres_admin;

GRANT CREATE, USAGE ON SCHEMA trading_reports_store TO trading_report_store_user;


