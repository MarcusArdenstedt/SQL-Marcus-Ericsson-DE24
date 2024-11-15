SELECT
	COUNT(*) AS number_lecture
FROM
	main.course_structure 
WHERE
	content_type = 'lecture';