INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
SELECT (SELECT MAX(id)+1 FROM person_visits) AS id, id , (SELECT id FROM pizzeria WHERE name = 'Dominos'), '2022-02-24'
FROM person WHERE name = 'Denis';
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
SELECT (SELECT MAX(id)+2 FROM person_visits) AS id, id , (SELECT id FROM pizzeria WHERE name = 'Dominos'), '2022-02-24'
FROM person WHERE name = 'Irina';