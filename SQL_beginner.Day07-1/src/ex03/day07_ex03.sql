WITH ord AS (SELECT pizzeria_id, COUNT(*), 'order' as action_type FROM person_order pv
			 JOIN menu mn ON mn.id = pv.menu_id
			 GROUP BY pizzeria_id
			 ORDER BY count DESC
			),
	vst AS (SELECT pizzeria_id, COUNT(*), 'visit' as action_type FROM person_visits
			GROUP BY pizzeria_id
			ORDER BY count DESC
		   ),
	vst_u_ord AS (SELECT pizzeria_id, SUM(count) AS total_count
				  FROM ((select * FROM ord)
						UNION ALL
						(select * FROM vst)) o_v
				  GROUP BY pizzeria_id
				 )
SELECT name, total_count
FROM vst_u_ord vuo
JOIN pizzeria pz 
ON pz.id = vuo.pizzeria_id
ORDER BY total_count DESC, name ASC