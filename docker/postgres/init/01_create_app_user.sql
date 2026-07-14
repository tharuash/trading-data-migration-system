-- ==========================================================================================
-- 01_create_app_user.sql
-- Application users creation scripts.
-- ==========================================================================================

DO
$$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM pg_roles
        WHERE rolname = 'trading_report_store_user'
    ) THEN
        RAISE EXCEPTION 'User trading_report_store_user already exists';
    ELSE
        CREATE ROLE trading_report_store_user
            WITH
            LOGIN
            PASSWORD '${TRADING_REPORT_STORE_USER_PASSWORD}'
            NOSUPERUSER
            NOCREATEDB
            NOCREATEROLE
            NOREPLICATION;
    END IF;
END
$$;