WITH pr AS(SELECT * FROM person WHERE name = 'Denis' OR name = 'Anna')
SELECT mn.pizza_name as pizza_name, pz.name as pizzeria_name FROM person_order po JOIN pr ON pr.id = po.person_id 
JOIN menu mn ON mn.id = po.menu_id JOIN pizzeria pz ON mn.pizzeria_id = pz.id
ORDER BY pizza_name, pizzeria_name