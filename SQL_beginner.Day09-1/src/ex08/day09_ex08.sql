CREATE FUNCTION
fnc_fibonacci(
	 pstop INTEGER DEFAULT 10
)
RETURNS NUMERIC
AS $$
DECLARE
	pstop ALIAS FOR $1;
BEGIN
	RETURN
	(WITH RECURSIVE r AS (
		SELECT 1 as cnt,
			0::NUMERIC AS kid,
			1::NUMERIC AS prnt
		UNION
		SELECT cnt + 1 as cnt,
			prnt AS kid,
			prnt+kid AS prnt
		FROM r
		WHERE cnt < pstop
	)
	SELECT kid FROM r WHERE cnt = pstop);
END;
$$
LANGUAGE 'plpgsql';

-- select * from fnc_fibonacci(1000);
-- select * from fnc_fibonacci();
