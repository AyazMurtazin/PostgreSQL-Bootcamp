WITH vt_cnt AS (
	SELECT person_id, COUNT(*) AS count_of_visits
	FROM person_visits
	GROUP BY person_id)
SELECT pr.name AS person_name, count_of_visits 
FROM vt_cnt JOIN person pr ON pr.id = vt_cnt.person_id
ORDER BY count_of_visits DESC, person_name ASC
LIMIT 4