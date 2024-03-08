SELECT person_name, pizza_name, pizzeria_name
FROM person_order po
NATURAL JOIN (SELECT id AS person_id, name as person_name FROM person) pr
NATURAL JOIN (SELECT id AS menu_id, pizza_name, pizzeria_name FROM menu
			 NATURAL JOIN (SELECT id AS pizzeria_id, name as pizzeria_name FROM pizzeria) pz) mn
ORDER BY person_name ASC, pizza_name ASC, pizzeria_name ASC;