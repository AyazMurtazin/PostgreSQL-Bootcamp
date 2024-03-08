CREATE FUNCTION
func_minimum(
	VARIADIC arr NUMERIC[]
)
RETURNS NUMERIC
AS $$
BEGIN
	return (SELECT MIN(val) FROM UNNEST(arr) AS val);
END;
$$
LANGUAGE 'plpgsql';

-- SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);