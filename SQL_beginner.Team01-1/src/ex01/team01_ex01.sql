-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH convert AS (
    SELECT user_id,
           money,
           currency_id,
           (select cr.rate_to_usd
            from currency cr
            where cr.updated = (
                SELECT scr.updated
                FROM currency scr
                WHERE scr.id = bl.currency_id
                ORDER BY (CASE
                              WHEN (scr.updated - bl.updated < INTERVAL '0') THEN (-(scr.updated - bl.updated))
                              ELSE (scr.updated - bl.updated) END) ASC
                LIMIT 1
            )
            LIMIT 1) AS nrst_rtu
    FROM balance bl
)
SELECT COALESCE(u.name, 'not defined') as name,
       COALESCE(u.lastname, 'not defined') as lastname,
       c.name               AS currency_name,
       nrst_rtu * cvt.money AS currency_in_usd
FROM convert cvt
         LEFT JOIN "user" u
                    ON cvt.user_id = u.id
         INNER JOIN (SELECT DISTINCT id, name FROM currency) AS c
                    on cvt.currency_id = c.id
ORDER BY name DESC, lastname ASC, currency_name ASC;