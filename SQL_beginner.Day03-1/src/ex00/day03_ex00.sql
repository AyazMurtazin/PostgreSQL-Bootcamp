WITH pr AS (SELECT id as person_id FROM person WHERE name = 'Kate'),
	pv AS (SELECT DISTINCT pizzeria_id, visit_date FROM person_visits NATURAL JOIN pr),
	mn AS (SELECT pizzeria_id, visit_date, price, pizza_name FROM menu NATURAL JOIN pv WHERE price BETWEEN 800 AND 1000)
SELECT pizza_name, price, pz.name AS pizzeria_name, visit_date FROM mn JOIN pizzeria pz ON pz.id = mn.pizzeria_id
ORDER BY pizza_name, price, pizzeria_name
