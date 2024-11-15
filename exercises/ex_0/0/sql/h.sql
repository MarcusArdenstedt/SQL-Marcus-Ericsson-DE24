SELECT
	*
FROM
	main.course_structure
WHERE
	content = '02_setup_duckdb';
	
DELETE
FROM
	main.course_structure
WHERE
	content = '02_setup_duckdb';
	
SELECT * FROM main.course_structure;


INSERT
	INTO
	course_structure (content,
	week,
	content_type)
VALUES
('02_setup_duckdb',
46,
'lecture');

SELECT * FROM main.course_structure;