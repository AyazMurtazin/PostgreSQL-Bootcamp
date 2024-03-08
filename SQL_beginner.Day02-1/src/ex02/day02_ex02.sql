SELECT COALESCE(pr.name, '-') AS person_name,
pv.visit_date,
COALESCE(pz.name, '-') AS pizzeria_name 
FROM person pr
LEFT JOIN (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') pv ON pr.id = pv.person_id
FULL OUTER JOIN pizzeria pz ON pz.id = pv.pizzeria_id
ORDER BY person_name, visit_date, pizzeria_name