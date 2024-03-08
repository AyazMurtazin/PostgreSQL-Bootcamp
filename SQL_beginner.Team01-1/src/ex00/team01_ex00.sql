WITH last_upd AS (
    SELECT id, MAX(updated) AS updated FROM currency
    GROUP BY id
),
last_rate AS (
    SELECT id, name as currency_name, COALESCE(rate_to_usd, 1) as rate_to_usd, updated FROM currency
        NATURAL INNER JOIN last_upd
),
total_balance AS (
    SELECT user_id, SUM(money) AS money, type, currency_id FROM balance
    GROUP BY user_id, currency_id, type
)
SELECT COALESCE(u.name, 'not defined') AS name,
	COALESCE(u.lastname, 'not defined') AS lastname,
	tb.type AS type,
	tb.money AS volume,
	COALESCE(lr.currency_name, 'not defined') AS currency_name,
	COALESCE(lr.rate_to_usd, 1) AS last_rate_to_usd,
    COALESCE(lr.rate_to_usd, 1) * tb.money AS total_volume_in_usd
FROM total_balance tb
    LEFT JOIN "user" u ON u.id=tb.user_id
    LEFT JOIN last_rate lr ON lr.id = tb.currency_id
ORDER BY name DESC, lastname ASC, type ASC;