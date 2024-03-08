WITH mn AS (SELECT pizza_name, price, pizzeria_id, pz.name AS pizzeria_name
			FROM menu JOIN pizzeria pz ON pz.id = menu.pizzeria_id)
SELECT 
	mn1.pizza_name,
	mn1.pizzeria_name AS pizzeria_name_1,
	mn2.pizzeria_name AS pizzeria_name_2,
	mn1.price 
FROM mn mn1
JOIN mn mn2
ON mn1.pizza_name = mn2.pizza_name
	AND mn1.price = mn2.price
	AND mn1.pizzeria_id > mn2.pizzeria_id