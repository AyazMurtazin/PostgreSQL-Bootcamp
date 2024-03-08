INSERT INTO person_discounts
WITH 
	pr_pz AS (
		SELECT po.person_id, mn.pizzeria_id
		FROM person_order po
		JOIN menu mn
		ON mn.id = po.menu_id),
	pr_pz_amnt AS (
		SELECT person_id, pizzeria_id, COUNT(*) AS amount FROM pr_pz GROUP BY person_id, pizzeria_id)
SELECT ROW_NUMBER( ) OVER ( ) AS id,
	person_id,
	pizzeria_id,
	CASE WHEN amount=1 THEN 10.5
		WHEN amount=2 THEN 22
		ELSE 30
	END discount
FROM pr_pz_amnt;
