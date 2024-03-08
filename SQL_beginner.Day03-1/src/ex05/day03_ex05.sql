WITH andrey AS (SELECT id as person_id FROM person WHERE name = 'Andrey'),
	anrd AS (SELECT DISTINCT  pizzeria_id, order_date AS action_date FROM person_order po JOIN menu mn ON mn.id = po.menu_id NATURAL JOIN andrey),
	anvst AS (SELECT DISTINCT pizzeria_id, visit_date AS action_date  FROM person_visits NATURAL JOIN andrey),
	pzid AS (SELECT * FROM anvst EXCEPT SELECT * FROM anrd)
SELECT name as pizzeria_name FROM pizzeria pz JOIN pzid ON pzid.pizzeria_id = pz.id

	

