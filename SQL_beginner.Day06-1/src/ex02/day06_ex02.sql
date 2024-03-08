WITH pr_pz_mn AS (SELECT person_id, pizzeria_id, menu_id 
				  FROM person_order po 
				  JOIN menu mn 
				  ON mn.id = po.menu_id
				 )
SELECT pr.name as person_name,
	mn.pizza_name as pizza_name,
	mn.price as price,
	(mn.price - (mn.price * pd.discount) / 100)::BIGINT as discount_price,
	pz.name as pizzeria_name
FROM pr_pz_mn ppm 
NATURAL JOIN person_discounts pd
JOIN person pr 
ON pr.id = ppm.person_id
JOIN menu mn 
ON mn.id = ppm.menu_id
JOIN pizzeria pz 
ON pz.id = ppm.pizzeria_id
ORDER BY person_name, pizza_name;