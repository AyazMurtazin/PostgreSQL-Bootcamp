SELECT MAX(pz.name) AS name,
	COUNT(*) AS count_of_orders,
	ROUND(AVG(price), 2) AS avarage_price,
	MAX(price) AS max_price,
	MIN(price) AS min_price
FROM person_order pr
JOIN menu mn
ON pr.menu_id = mn.id
JOIN pizzeria pz 
ON pz.id = mn.pizzeria_id
GROUP BY pizzeria_id
ORDER BY name 