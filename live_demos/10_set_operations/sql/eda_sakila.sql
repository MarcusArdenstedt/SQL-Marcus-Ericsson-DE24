DESC;
-- film: film_id
SELECT * FROM main.film;

DESC TABLE main.film;

SELECT
	COUNT(*) AS nuber_movies,
	COUNT(DISTINCT title)
FROM
	main.film; 
	
SELECT
	DISTINCT rating
FROM
	main.film;
	
-- film_actor: actor_id and film_id
SELECT * FROM main.film_actor; 

-- actor: actro_id 
SELECT * FROM main.actor;

-- fim_category: film_id, category_id
SELECT * FROM main.film_category;

SELECT * FROM main.category;


SELECT * FROM main.customer;

SELECT
	store_id,
	COUNT(*)
FROM
	main.customer
GROUP BY
	store_id
ORDER BY
	store_id ASC;
	
SELECT
	*
FROM
	main.store;
	
-- more EDAs left for reader