DESC;

-- film table
SELECT * FROM main.film;

DESC TABLE main.film;

SELECT
	COUNT(*),
	COUNT(DISTINCT title) AS unique_number_movies
FROM 
	main.film;

SELECT
	*
FROM
	main.film
	
SELECT DISTINCT rating FROM main.film; 

-- film actor
SELECT * FROM main.film_actor;

DESC TABLE main.actor;

-- actor
SELECT * FROM main.actor;

DESC TABLE main.actor;

-- category
SELECT * FROM main.category;
SELECT * FROM main.film_category;

SELECT
	'customer' AS TYPE,
	c.first_name,
	c.last_name
FROM
	main.customer c
WHERE
	c.first_name LIKE 'D%';

