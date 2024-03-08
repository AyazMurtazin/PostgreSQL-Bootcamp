SELECT 
	id,
	name,
	CAST(
		CASE 
		WHEN age >= 10 AND age <= 20
			THEN 'interval #1' 
		WHEN age > 20 AND age < 24
			THEN 'interval #2'
		WHEN age >= 24 OR age < 10
			THEN 'interval #3'
        END AS varchar(15)) as interval_info
FROM person
ORDER BY interval_info ASC

