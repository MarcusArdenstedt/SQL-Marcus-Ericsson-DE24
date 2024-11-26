SELECT 
	regexp_replace(trim(description),
	' +',
	' ',
	'g'),
	LOWER(regexp_replace(trim(example),
	' +',
	' ',
	'g'))
FROM 
	staging.sql_glossary;
	
SELECT
	*
FROM
	staging.sql_glossary
WHERE
	LOWER(description) LIKE '%select%';
	
SELECT
	*
FROM
	staging.sql_glossary
WHERE
	regexp_matches(LOWER(description), 'select\b');