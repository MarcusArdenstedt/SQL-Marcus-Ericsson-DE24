SELECT 42 AS meaning_of_life;

SELECT 42;

VALUES (1), (2), (3);



CREATE TABLE IF NOT EXISTS people_records AS (
SELECT
	*
FROM
	(
VALUES (1,
'Johan'),
(2,
'Johanna'),
(3,
'Mustafa')) AS t(id, name)); 
desc;

SELECT 42;

VALUES (1), (2), (3), (4), (5);

SELECT 
	*
FROM (
VALUES (1, 'AGNES'), (2, 'MAX'), (3, 'BOB')) AS t(Kund_id, Namn);

