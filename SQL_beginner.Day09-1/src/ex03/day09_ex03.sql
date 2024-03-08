DROP TRIGGER trg_person_insert_audit ON person;
DROP TRIGGER trg_person_update_audit ON person;
DROP TRIGGER trg_person_delete_audit ON person;
DROP FUNCTION 
fnc_trg_person_insert_audit ,
fnc_trg_person_update_audit,
fnc_trg_person_delete_audit;
TRUNCATE person_audit;

CREATE FUNCTION fnc_trg_person_audit() RETURNS trigger AS 
$$
BEGIN
	IF TG_OP = 'INSERT' THEN
		INSERT INTO
		person_audit(created, type_event, row_id, name, age, gender, address)
		VALUES (NOW(), 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
	ELSIF TG_OP = 'UPDATE' THEN
		INSERT INTO
		person_audit(created, type_event, row_id, name, age, gender, address)
		VALUES (NOW(), 'U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
	ELSIF TG_OP = 'DELETE' THEN
		INSERT INTO
		person_audit(created, type_event, row_id, name, age, gender, address)
		VALUES (NOW(), 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
	END IF;
	RETURN OLD;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER trg_person_audit
AFTER INSERT OR UPDATE OR DELETE ON person
FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_audit();



INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;

-- SELECT * FROM person_audit