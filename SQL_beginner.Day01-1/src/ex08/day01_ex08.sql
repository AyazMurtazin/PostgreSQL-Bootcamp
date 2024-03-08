SELECT po.order_date, (p.name || ' (age:' || p.age || ')') AS person_information
FROM person_order po NATURAL JOIN (SELECT id as person_id, name , age FROM person) p
ORDER BY order_date ASC, person_information ASC;