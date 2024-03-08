WITH mn AS (SELECT * FROM menu WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza')
SELECT pizza_name, pz.name as pizzeria_name, price FROM mn 
JOIN pizzeria pz ON pz.id = mn.pizzeria_id
ORDER BY pizza_name, pizzeria_name