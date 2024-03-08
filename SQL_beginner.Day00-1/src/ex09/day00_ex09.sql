SELECT (SELECT name FROM person WHERE person_id = person.id) AS person_name ,  -- this is an internal query in a main SELECT clause
        (SELECT name FROM pizzeria WHERE pizzeria_id = pizzeria.id) AS pizzeria_name  -- this is an internal query in a main SELECT clause
FROM (SELECT person_id, pizzeria_id FROM person_visits WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09') AS pv -- this is an internal query in a main FROM clause
ORDER BY person_name ASC, pizzeria_name DESC