WITH stats AS (
	SELECT address,
	MAX(age)::numeric - (MIN(age)::numeric / MAX(age)::numeric) AS formula,
	AVG(age) AS average
	FROM person 
	GROUP BY address
)
SELECT address,
	ROUND(formula, 2) AS formula,
	ROUND(average, 2) AS average,
	formula > average AS comparison
FROM stats 