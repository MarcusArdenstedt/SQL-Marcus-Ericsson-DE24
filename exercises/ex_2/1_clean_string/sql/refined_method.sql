SELECT * FROM staging.sql_glossary;

SELECT 	
	sql_word,
	sql_word[:1],
	sql_word[:3] AS third_letter,
	sql_word[:1] AS fith_letter,
	sql_word[-1] AS last_letter
FROM 
	staging.sql_glossary;
	

SELECT 
	description
FROM
	staging.sql_glossary;
	
-- 1. a) create schema called refined
CREATE SCHEMA IF NOT EXISTS refined;

CREATE TABLE IF NOT EXISTS refined.sql_glossary AS (
SELECT 
	sql_word,
	description,
	example
FROM staging.sql_glossary);

SELECT 
	* 
FROM refined.sql_glossary;


UPDATE refined.sql_glossary
SET 
	sql_word = UPPER(TRIM(sql_word)),
	description = REGEXP_REPLACE(TRIM(description), ' +', ' ', 'g'),
	example = LOWER(REGEXP_REPLACE(REGEXP_REPLACE(TRIM(example), ' +', ' ', 'g'), ' +;', ';'));

SELECT
	*
FROM 
	refined.sql_glossary
WHERE REGEXP_MATCHES(example, 'type;$');

SELECT 
	* 
FROM 
	refined.sql_glossary
WHERE REGEXP_MATCHES(description, 'table$');

SELECT 
	*
FROM 
	refined.sql_glossary
WHERE REGEXP_MATCHES(description, 'm');

SELECT 
	* 
FROM 
	refined.sql_glossary
WHERE REGEXP_MATCHES(description, '[vq]')

SELECT 
	*
FROM 
	refined.sql_glossary
WHERE REGEXP_MATCHES(description, '[^c]');

UPDATE
	refined.sql_glossary
SET
	example = REGEXP_REPLACE(example, ' +,', ',');
	
SELECT 
	*
FROM 
	refined.sql_glossary;