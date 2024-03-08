CREATE VIEW v_person_female AS
SELECT * FROM person
WHERE person.gender = 'female';

CREATE VIEW v_person_male AS
SELECT * FROM person
WHERE person.gender = 'male';