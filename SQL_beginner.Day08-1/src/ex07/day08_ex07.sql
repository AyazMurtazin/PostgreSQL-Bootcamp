-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SHOW TRANSACTION ISOLATION LEVEL;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SHOW TRANSACTION ISOLATION LEVEL;
-- Session #1
UPDATE pizzeria SET rating = 5 WHERE id = 1;
-- Session #2
UPDATE pizzeria SET rating = 5 WHERE id = 2;
-- Session #1
UPDATE pizzeria SET rating = 4 WHERE id = 2;
-- Session #2
UPDATE pizzeria SET rating = 4 WHERE id = 1;
-- Session #1
COMMIT;
-- Session #2
COMMIT;