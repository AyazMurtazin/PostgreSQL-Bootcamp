WITH pr as (SELECT id, name FROM person
			WHERE (address = 'Moscow' OR address = 'Samara') AND gender = 'male'), 
	mn as (SELECT id FROM menu
		   WHERE pizza_name = 'pepperoni pizza' or pizza_name = 'mushroom pizza')
SELECT pr.name FROM person_order po
JOIN pr on po.person_id = pr.id
JOIN mn ON po.menu_id = mn.id
ORDER BY name DESC