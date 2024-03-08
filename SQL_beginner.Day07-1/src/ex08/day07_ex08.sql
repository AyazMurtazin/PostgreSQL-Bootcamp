WITH id_pz AS (SELECT address, pizzeria_id,
			   	COUNT(*) as count_of_orders
			   FROM person_order po
			   JOIN person pr ON pr.id = po.person_id 
			   JOIN menu mn ON menu_id = mn.id
			   GROUP BY address, pizzeria_id)
SELECT address, pz.name, count_of_orders FROM id_pz
JOIN pizzeria pz ON pz.id = id_pz.pizzeria_id 
ORDER BY address, pz.name