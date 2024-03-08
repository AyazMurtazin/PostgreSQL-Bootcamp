select generated_date AS missing_date from v_generated_dates
EXCEPT
SELECT DISTINCT visit_date AS missing_date FROM person_visits
ORDER BY missing_date