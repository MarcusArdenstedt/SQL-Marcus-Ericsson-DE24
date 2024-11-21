SELECT * FROM main.food;

SELECT
	DISTINCT id
FROM
	main.food;

SELECT
	COUNT(DISTINCT id)
FROM
	main.food;
	
SELECT
	COUNT(*) AS number_rows
FROM
	main.food;
	
DESC main.food;

SELECT
	*
FROM
	main.food
WHERE
	week_id BETWEEN '2004-04' AND '2004-06';