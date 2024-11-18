SELECT * FROM main.course_structure;

-- count how many lecture in the table

SELECT
	COUNT(*) AS number_lecture
FROM
	main.course_structure
WHERE
	content_type = 'lecture';
	
-- count how many other content in the table

SELECT COUNT(*) FROM main.course_structure WHERE NOT content_type = 'lecture';

-- unique content type in the table

SELECT DISTINCT content_type FROM main.course_structure;