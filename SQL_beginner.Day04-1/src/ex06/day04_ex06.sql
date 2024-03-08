CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
WITH pr AS (SELECT id as person_id from person WHERE name = 'Dmitriy'),
	pzid AS (SELECT pv.pizzeria_id
		   FROM person_visits pv
		   NATURAL INNER JOIN pr
		   WHERE visit_date = '2022-01-08'),
	mn AS (SELECT pizzeria_id as id FROM menu NATURAL INNER JOIN pzid WHERE price < 800)
SELECT name AS pizzeria_name FROM pizzeria NATURAL INNER JOIN mn;