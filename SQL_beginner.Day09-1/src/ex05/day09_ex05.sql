DROP FUNCTION fnc_persons_male;
DROP FUNCTION fnc_persons_female;

CREATE FUNCTION fnc_persons (pgender VARCHAR DEFAULT 'female')
RETURNS TABLE (id BIGINT, name VARCHAR, age INTEGER, gender VARCHAR, address VARCHAR) AS $$
    SELECT id, name, age, gender, address FROM person WHERE gender = $1;
$$ LANGUAGE SQL;

-- select *
-- from fnc_persons(pgender := 'male');

-- select *
-- from fnc_persons();

