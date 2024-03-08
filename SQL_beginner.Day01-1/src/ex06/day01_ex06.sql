SELECT action_date, name AS person_name FROM person, (SELECT visit_date AS action_date, person_id FROM person_visits
INTERSECT
SELECT order_date AS action_date, person_id FROM person_order) AS pvipo
WHERE id = person_id
ORDER BY action_date ASC, person_name DESC;