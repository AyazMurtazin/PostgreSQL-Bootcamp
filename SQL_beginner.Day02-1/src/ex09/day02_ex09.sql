WITH pepmn AS (SELECT id AS menu_id FROM menu
			   WHERE pizza_name = 'pepperoni pizza'),
	cheemn AS (SELECT id AS menu_id FROM menu
			   WHERE pizza_name = 'cheese pizza'),
	peppr AS (SELECT DISTINCT person_id FROM person_order NATURAL JOIN pepmn),
	cheepr AS (SELECT DISTINCT person_id FROM person_order NATURAL JOIN cheemn),
	pepcheepr AS (SELECT person_id as id FROM peppr NATURAL JOIN cheepr)
SELECT pr.name FROM person pr NATURAL JOIN pepcheepr
WHERE pr.gender = 'female'
ORDER BY name