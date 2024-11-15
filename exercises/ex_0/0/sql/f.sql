SELECT
	COUNT(*) AS number_other_content
FROM
	main.course_structure
WHERE
	content_type != 'lecture'; 