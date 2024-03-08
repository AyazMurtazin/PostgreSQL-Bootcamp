CREATE FUNCTION
fnc_person_visits_and_eats_on_date(
	pperson VARCHAR DEFAULT 'Dmitriy',
	pprice NUMERIC DEFAULT 500,
	pdate DATE DEFAULT '2022-01-08'
)
RETURNS TABLE(pizzeria_name VARCHAR)
AS $$
BEGIN
	RETURN QUERY
		WITH chp_pz AS (SELECT DISTINCT pizzeria_id,
							pz.name AS pizzeria_name
						FROM menu mn
						JOIN pizzeria pz
						ON mn.pizzeria_id = pz.id
						WHERE price < pprice
					   ),
		pz_vz AS (SELECT pizzeria_id
				  FROM person_visits pv
				  JOIN person pr ON pv.person_id = pr.id
				  WHERE visit_date = pdate AND pr.name = pperson
				 )
		SELECT chp_pz.pizzeria_name FROM chp_pz NATURAL INNER JOIN pz_vz;
END;
$$
LANGUAGE 'plpgsql';

-- select *
-- from fnc_person_visits_and_eats_on_date(pprice := 800);

-- select *
-- from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');

