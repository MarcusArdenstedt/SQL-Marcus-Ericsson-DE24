CREATE SCHEMA IF NOT EXISTS refined;

 
CREATE TABLE IF NOT EXISTS refined.sql_glossary AS(
SELECT
	UPPER(TRIM(sql_word)) AS sql_word,
	REGEXP_REPLACE(TRIM(description), ' +', ' ', 'g') AS cleaned_description,
	example 
FROM
	staging.sql_glossary);


UPDATE refined.sql_glossary
SET
	example = LOWER(REGEXP_REPLACE(TRIM(example), ' +', ' ', 'g'));

UPDATE refined.sql_glossary 
SET example =
	REGEXP_REPLACE(example,
	' ;',
	';');


SELECT * FROM refined.sql_glossary;
	
