-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
SHOW TRANSACTION ISOLATION LEVEL;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
SHOW TRANSACTION ISOLATION LEVEL;
-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Session #2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;
-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
