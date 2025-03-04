-- want to combine customer and actors into one table
SELECT
	'Customer' AS type,
	c.first_name,
	c.last_name
FROM
	main.customer c
WHERE
	c.first_name LIKE 'A%'
UNION ALL                  -- set operation för sätta ihop d båda query
SELECT
	'Actor' AS type,
	a.first_name,
	a.last_name
FROM
	main.actor a
WHERE
	a.first_name LIKE 'A%';
	
--- customer and actors same name
SELECT
	c.first_name,
	c.last_name
FROM
	main.customer c
INTERSECT 
SELECT
	a.first_name,
	a.last_name
FROM
	main.actor a;
	
SELECT
	c.first_name,
	c.last_name
FROM
	main.customer c
WHERE c.first_name  LIKE 'J%' AND c.last_name LIKE 'D%'
UNION ALL
SELECT
	a.first_name,
	a.last_name
FROM
	main.actor a 
WHERE a.first_name  LIKE 'J%' AND a.last_name LIKE 'D%';

