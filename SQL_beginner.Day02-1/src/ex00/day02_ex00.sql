SELECT pz.name, pz.rating
FROM pizzeria pz
LEFT JOIN (person_visits pvin RIGHT
		   JOIN pizzeria pzin ON  pzin.id = pvin.pizzeria_id)pv
ON  pz.id = pv.pizzeria_id   
WHERE pizzeria_id IS NULL