WITH mpz AS (
	SELECT pz.name AS pizzeria_name
	FROM person_order po
	JOIN person pr ON po.person_id = pr.id
	JOIN menu mn ON po.menu_id = mn.id
	JOIN pizzeria pz ON mn.pizzeria_id = pz.id
	WHERE pr.gender = 'male'
	),
	fpz AS(
	SELECT pz.name AS pizzeria_name
	FROM person_order po
	JOIN person pr ON po.person_id = pr.id
	JOIN menu mn ON po.menu_id = mn.id
	JOIN pizzeria pz ON mn.pizzeria_id = pz.id
	WHERE pr.gender = 'female'
	)
((SELECT * FROM mpz) 
 EXCEPT
 (SELECT * FROM fpz))
UNION 
((SELECT * FROM fpz) 
 EXCEPT
 (SELECT * FROM mpz))
ORDER BY pizzeria_name