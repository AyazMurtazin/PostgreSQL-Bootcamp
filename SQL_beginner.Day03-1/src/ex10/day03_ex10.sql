INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES(
	(SELECT MAX(id)+1 FROM person_visits),
	(SELECT id FROM person WHERE name = 'Denis'),
	(SELECT mn.id FROM menu mn NATURAL INNER JOIN (SELECT id AS pizzeria_id FROM pizzeria WHERE name = 'Dominos') pz WHERE pizza_name = 'sicilian pizza'),
	'2022-02-24'
);


INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES(
	(SELECT MAX(id)+2 FROM person_visits),
	(SELECT id FROM person WHERE name = 'Irina'),
	(SELECT id FROM menu NATURAL INNER JOIN (SELECT id AS pizzeria_id FROM pizzeria WHERE name = 'Dominos') pz WHERE pizza_name = 'sicilian pizza'),
	'2022-02-24'
);