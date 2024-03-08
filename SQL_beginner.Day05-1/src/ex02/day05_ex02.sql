CREATE INDEX idx_person_name ON person (UPPER(name));
SET enable_seqscan to off;
EXPLAIN ANALYZE
SELECT *
FROM person pr 
WHERE UPPER(name)= 'ANDREY';