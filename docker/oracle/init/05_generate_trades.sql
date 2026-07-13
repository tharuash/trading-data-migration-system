-- ==========================================================================================
-- 05_generate_trades.sql
-- Generates sample trades
--
-- Prerequisites:
--      instruments 1-80, exchange_rates
--      orders 1 -500, order 1 -300 should be FILLED, and next 75 is PARTIALLY-FILLED 
--
-- Output:
--      1000 rows in trades table
--
-- Note:
--      trade_timestamps, are gurateed BUSINESS_DAYS within 2024 so all non-USD rate 
--      lookups find a matching rate row.
-- Run as SYSDBA connected to EXCHANGE_SOURCE_PDB
-- ==========================================================================================

ALTER SESSION SET CONTAINER = exchange_source_pdb;

DELETE FROM trading_data_store.trades;

DECLARE
    v_inst      NUMBER;
    v_curr      VARCHAR2(10);
    v_price     NUMBER(20,6);
    v_qty       NUMBER(20,6);
    v_rand      NUMBER;
    v_ts        TIMESTAMP;
    v_status    VARCHAR2(30);
    v_order_id  NUMBER(18);

    v_start_ts  CONSTANT TIMESTAMP := TIMESTAMP '2023-01-01 00:00:00';
    v_end_ts    CONSTANT TIMESTAMP := TIMESTAMP '2025-12-30 00:00:00';
    v_bucket_seconds CONSTANT NUMBER := 94521600 / 1000;

BEGIN
    FOR i IN 1..1000 LOOP

        -- instrument: cycle all 80 instruments
        v_inst := MOD(i-1,80) + 1;

        -- currency: non-USD only for fixed-income instruments with know rates
        IF v_inst = 33                  THEN v_curr := 'GBP';
        ELSIF v_inst IN (34, 36,37)     THEN v_curr := 'EUR';
        ELSIF v_inst = 35               THEN v_curr := 'JPY';
        ELSIF v_inst = 38               THEN v_curr := 'AUD';
        ELSIF v_inst = 42               THEN v_curr := 'CHF'; 
        ELSE                                 v_curr := 'USD';
        END IF;

        -- price by asset class
        IF    v_inst BETWEEN 1  AND 30 THEN v_price := ROUND(DBMS_RANDOM.VALUE(15, 650), 4);
        ELSIF v_inst BETWEEN 31 AND 38 THEN v_price := ROUND(DBMS_RANDOM.VALUE(94, 106), 4);
        ELSIF v_inst BETWEEN 39 AND 50 THEN v_price := ROUND(DBMS_RANDOM.VALUE(0.8, 1.2), 6);
        ELSIF v_inst BETWEEN 51 AND 60 THEN v_price := ROUND(DBMS_RANDOM.VALUE(2, 2200), 4);
        ELSIF v_inst BETWEEN 61 AND 68 THEN v_price := ROUND(DBMS_RANDOM.VALUE(100, 5200), 4);
        ELSIF v_inst BETWEEN 69 AND 76 THEN v_price := ROUND(DBMS_RANDOM.VALUE(88, 520), 4);
        ELSE                                v_price := ROUND(DBMS_RANDOM.VALUE(0.25, 68000), 4);
        END IF;

        -- quantity by asset class
        IF    v_inst BETWEEN 1  AND 30 THEN v_qty := ROUND(DBMS_RANDOM.VALUE(1, 10000), 0);
        ELSIF v_inst BETWEEN 31 AND 50 THEN v_qty := ROUND(DBMS_RANDOM.VALUE(10000, 10000000), 0);
        ELSIF v_inst BETWEEN 51 AND 68 THEN v_qty := ROUND(DBMS_RANDOM.VALUE(1, 1000), 0);
        ELSIF v_inst BETWEEN 69 AND 76 THEN v_qty := ROUND(DBMS_RANDOM.VALUE(10, 50000), 0);
        ELSE                                v_qty := ROUND(DBMS_RANDOM.VALUE(0.001, 100), 6);
        END IF;

        -- trade_status weighted distribution - resolved BEFORE order_id
        -- so order_id range can be chosen based on status
        v_rand := DBMS_RANDOM.VALUE(0,1);

        IF    v_rand < 0.38 THEN v_status := 'EXECUTED';  
        ELSIF v_rand < 0.66 THEN v_status := 'SETTLED';  
        ELSIF v_rand < 0.81 THEN v_status := 'PENDING_SETTLEMENT'; 
        ELSIF v_rand < 0.89 THEN v_status := 'PARTIALY_FILL';
        ELSIF v_rand < 0.94 THEN v_status := 'CANCELLED';
        ELSIF v_rand < 0.98 THEN v_status := 'FAILED';
        ELSE                     v_status := 'REVERSED';
        END IF;

        -- order_id: PARTIAL_FILL trades must reference PARTIALLY_FILLED orders (301-375)
        -- all other statuses reference FILLED orders (1-300)
        IF v_status = 'PARTIAL_FILL' THEN
            v_order_id := MOD(i-1, 75) + 301;
        ELSE
            v_order_id := MOD(i-1, 300) +1;
        END IF;

        v_ts := v_start_ts + NUMTODSINTERVAL(((i - 1) * v_bucket_seconds) + DBMS_RANDOM.VALUE(0, v_bucket_seconds), 'SECOND');

        INSERT INTO  trading_data_store.trades(order_id, instrument_id, quantity, price, currency, trade_status, trade_timestamp, created_at, updated_at)
        VALUES (v_order_id, v_inst, v_qty, v_price, v_curr, v_status, v_ts, v_ts, v_ts + NUMTODSINTERVAL(DBMS_RANDOM.VALUE(0,300), 'SECOND'));

        IF MOD(i, 100) = 0 THEN
            COMMIT;
        END IF;
    END LOOP;
    COMMIT;
END;
/                    


