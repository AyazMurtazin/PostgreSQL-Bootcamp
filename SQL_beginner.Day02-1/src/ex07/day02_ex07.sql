WITH pr AS (SELECT * FROM person WHERE name = 'Dmitriy'),
	pzids AS (SELECT pv.pizzeria_id AS id FROM person_visits pv JOIN pr ON pr.id =  pv.person_id
		JOIN menu mn ON pv.pizzeria_id = mn.pizzeria_id
		WHERE pv.visit_date = '2022-01-08' AND mn.price < 800)
SELECT DISTINCT pz.name as pizzeria_name FROM pizzeria pz NATURAL JOIN pzids