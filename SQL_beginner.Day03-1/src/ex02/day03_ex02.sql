WITH ex01q AS(WITH mnpo AS (SELECT menu_id FROM person_order)
	SELECT id AS menu_id FROM menu mn LEFT JOIN mnpo ON mnpo.menu_id = mn.id
	WHERE mnpo.menu_id IS null
	ORDER BY menu_id)
SELECT menu.pizza_name, menu.price, pz.name FROM menu JOIN ex01q ON menu.id = ex01q.menu_id JOIN pizzeria pz ON pz.id = menu.pizzeria_id
ORDER BY pizza_name, price