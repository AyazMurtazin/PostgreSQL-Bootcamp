CREATE VIEW v_generated_dates AS 
SELECT d::date AS generated_date FROM GENERATE_SERIES('2022-01-01'::DATE, '2022-01-31'::DATE, '1 day'::INTERVAL) d;