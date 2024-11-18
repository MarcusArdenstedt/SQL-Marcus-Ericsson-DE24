SELECT * FROM main.course_structure;

-- select all exercises

SELECT
	*
FROM
	main.course_structure
WHERE
	content_type = 'exercise';
	
-- select all lecture

SELECT
	*
FROM
	main.course_structure
WHERE
	content_type = 'lecture';
	

-- select all record for 48

SELECT
	*
FROM
	main.course_structure
WHERE
	week = 48;

-- select att records for week 47-49

SELECT
	*
FROM
	main.course_structure
WHERE
	week BETWEEN 47 AND 49;


	
