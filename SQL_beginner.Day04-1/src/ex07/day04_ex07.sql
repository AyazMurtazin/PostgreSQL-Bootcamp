INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(id) + 1 FROM person_visits),
		(SELECT id FROM person WHERE name = 'Dmitriy' LIMIT 1),
		(SELECT pizzeria_id FROM menu WHERE price < 800 AND pizzeria_id IN (SELECT id FROM pizzeria WHERE pizzeria.name <> 'Papa Johns') LIMIT 1),
		'2022-01-08')

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats

-- SELECT * FROM mv_dmitriy_visits_and_eats