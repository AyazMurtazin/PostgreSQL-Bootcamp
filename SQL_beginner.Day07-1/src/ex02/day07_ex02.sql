WITH ord AS (SELECT pizzeria_id, COUNT(*), 'order' as action_type FROM person_order pv
			 JOIN menu mn ON mn.id = pv.menu_id
			 GROUP BY pizzeria_id
			 ORDER BY count DESC
			 LIMIT 3
			),
	vst AS (SELECT pizzeria_id, COUNT(*), 'visit' as action_type FROM person_visits
			GROUP BY pizzeria_id
			ORDER BY count DESC
			LIMIT 3
		   )
SELECT name as pizzeria_name, count, action_type
FROM ((select * FROM ord)
	  UNION
	  (select * FROM vst)) o_v
JOIN pizzeria pz 
ON pz.id = o_v.pizzeria_id 
ORDER BY action_type ASC, count DESC	   
			 



