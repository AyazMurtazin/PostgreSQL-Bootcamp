SELECT order_date, (p.name || ' (age:' || p.age || ')') AS person_information
FROM person_order po, person p
where po.person_id = p.id
ORDER BY order_date ASC, person_information ASC;