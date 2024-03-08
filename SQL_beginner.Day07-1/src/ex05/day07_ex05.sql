SELECT DISTINCT name
FROM person_order po
JOIN person pr
ON pr.id = po.person_id
ORDER BY name;