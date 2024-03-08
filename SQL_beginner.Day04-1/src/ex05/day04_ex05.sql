CREATE VIEW v_price_with_discount AS
SELECT name,
	pizza_name,
	price,
	(price - price * 0.1)::INT AS discount_price  
FROM person_order po 
INNER JOIN person pr ON po.person_id = pr.id
INNER JOIN menu mn ON po.menu_id = mn.id
ORDER BY name, pizza_name