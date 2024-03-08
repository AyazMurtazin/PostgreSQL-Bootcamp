SET  enable_seqscan = off; -- Disable sequential scans
SET  enable_indexscan = on; -- Enable index scans
SET  enable_sort = on; -- Enable explicit sorts

DROP INDEX IF EXISTS idx_1;
EXPLAIN (ANALYZE, VERBOSE)
SELECT
    m.pizza_name AS pizza_name,
    max(rating) 
	OVER (
		PARTITION BY rating
		ORDER BY rating
		ROWS BETWEEN UNBOUNDED PRECEDING
		AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;

CREATE INDEX IF NOT EXISTS idx_1 ON pizzeria (rating);

EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) 
	OVER (
		PARTITION BY rating
		ORDER BY rating
		ROWS BETWEEN UNBOUNDED PRECEDING
		AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;