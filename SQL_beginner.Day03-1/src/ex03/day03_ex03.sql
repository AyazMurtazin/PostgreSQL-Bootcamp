WITH mpz AS (
	SELECT pz.name AS pizzeria_name
	FROM person_visits pv
	JOIN person pr ON pv.person_id = pr.id
	JOIN pizzeria pz ON pv.pizzeria_id = pz.id
	WHERE pr.gender = 'male'
	),
	fpz AS(
	SELECT pz.name AS pizzeria_name
	FROM person_visits pv
	JOIN person pr ON pv.person_id = pr.id
	JOIN pizzeria pz ON pv.pizzeria_id = pz.id
	WHERE pr.gender = 'female'
	)
(SELECT * FROM mpz
EXCEPT ALL
SELECT * FROM fpz)
UNION
(SELECT * FROM fpz
EXCEPT ALL
SELECT * FROM mpz)
ORDER BY pizzeria_name