CREATE TABLE IF NOT EXISTS graph (
	point1 varchar(1),
  	point2 varchar(1),
  	cost int
);

INSERT INTO graph VALUES('a', 'b', 10),
						('b', 'a', 10),
                        ('a', 'd', 20),
                        ('d', 'a', 20),
                        ('a', 'c', 15),
                        ('c', 'a', 15),
                        ('b', 'd', 25),
                        ('d', 'b', 25),
                        ('b', 'c', 35),
                        ('c', 'b', 35),
                        ('d', 'c', 30),
                        ('c', 'd', 30);

WITH RECURSIVE
from_a AS (
	SELECT * 
	FROM graph g 
	WHERE g.point1 = 'a'
),
to_a AS (
	SELECT *
	FROM graph g
	WHERE g.point2 = 'a'
),
r AS (
	SELECT concat('{', from_a.point1, ',', from_a.point2) as way,
	from_a.point2 as point2, 2 AS cnt,
	from_a.cost AS total_cost
	FROM from_a
	UNION
	SELECT concat(r.way, ',',g.point2) as point, g.point2 as point2,
	cnt + 1 AS cnt, (r.total_cost + g.cost) AS total_cost
	FROM r 
	JOIN graph g
	ON g.point1 = r.point2 AND POSITION (g.point2 IN r.way) = 0
),
all_tours AS (
	SELECT r.total_cost + to_a.cost AS total_cost,
	concat(r.way, ',a}') AS tour
	FROM r
	JOIN to_a
	ON r.point2 = to_a.point1
	WHERE cnt = (SELECT COUNT(DISTINCT point1)
				 FROM graph
				)
),
min_tours AS (
	SELECT * FROM all_tours
	WHERE total_cost = (SELECT MIN(total_cost)
						FROM all_tours
					   )
)
SELECT *
FROM min_tours
ORDER BY 1, 2
