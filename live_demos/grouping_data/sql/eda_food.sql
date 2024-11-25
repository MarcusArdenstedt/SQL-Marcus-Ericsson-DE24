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
	
SELECT
	id,
	COUNT(id) 
FROM main.food
WHERE id IN ('cheeseburger', 'lasagna', 'chocolate', 'donut', 'hot-dog')
GROUP BY id;


SELECT 
	id 
FROM 
	main.food
GROUP BY
	id;

SELECT 
	id,
	SUM(value) AS number_searches_between_01_10
FROM
	main.food
WHERE
	 week_id BETWEEN '2004-01' AND '2004-10' 
GROUP BY 
	id;
