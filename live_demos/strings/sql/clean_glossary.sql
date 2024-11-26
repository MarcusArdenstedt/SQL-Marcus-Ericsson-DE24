CREATE SCHEMA IF NOT EXISTS refined;


CREATE TABLE IF NOT EXISTS refined.sql_glossary AS (
SELECT 
	UPPER(TRIM(sql_word)) AS sql_word,
	description,
	example
FROM 
	staging.sql_glossary
);
SELECT * FROM refined.sql_glossary;

SELECT
	sql_word,
	regexp_replace(TRIM(description),
	' +',
	' ',
	'g') AS description,
	regexp_replace(TRIM(example),
	' +',
	' ',
	'g') AS example
FROM
	refined.sql_glossary;