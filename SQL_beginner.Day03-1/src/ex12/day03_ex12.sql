INSERT INTO person_order(id, person_id, menu_id, order_date)
SELECT id + (SELECT MAX(ID) FROM person_order), id, (SELECT id FROM menu WHERE pizza_name = 'greek pizza' LIMIT 1), '2022-02-25'
FROM person;