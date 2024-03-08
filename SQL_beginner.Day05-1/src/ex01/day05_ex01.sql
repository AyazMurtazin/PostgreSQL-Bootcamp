SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT mn.pizza_name, pz.name AS pizzeria_name
FROM menu mn
JOIN pizzeria pz
ON mn.pizzeria_id = pz.id;