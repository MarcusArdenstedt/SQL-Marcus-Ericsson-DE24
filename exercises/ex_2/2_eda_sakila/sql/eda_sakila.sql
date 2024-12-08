--2. a) describe all table
DESC;

--2. b) select all data on all tables
SELECT * FROM main.actor;
SELECT * FROM main.address;
SELECT * FROM main.category;
SELECT * FROM main.city;
SELECT * FROM main.country;
SELECT * FROM main.customer;
SELECT * FROM main.customer_list;
SELECT * FROM main.film;
SELECT * FROM main.film_actor;
SELECT * FROM main.film_category;
SELECT * FROM main.film_list;
SELECT * FROM main.film_text;
SELECT * FROM main.inventory;
SELECT * FROM main.language;
SELECT * FROM main.payment;
SELECT * FROM main.rental;
SELECT * FROM main.sales_by_film_category;
SELECT * FROM main.sales_by_store;
SELECT * FROM main.staff;
SELECT * FROM main.staff_list;
SELECT * FROM main.store;

-- 2. c)
SELECT COUNT(*) FROM main.actor;
SELECT COUNT(*) FROM main.address;
SELECT COUNT(*) FROM main.category;
SELECT COUNT(*) FROM main.city;
SELECT COUNT(*) FROM main.country;
SELECT COUNT(*) FROM main.customer;
SELECT COUNT(*) FROM main.customer_list;
SELECT COUNT(*) FROM main.film;
SELECT COUNT(*) FROM main.film_actor;
SELECT COUNT(*) FROM main.film_category;
SELECT COUNT(*) FROM main.film_list;
SELECT COUNT(*) FROM main.film_text;
SELECT COUNT(*) FROM main.inventory;
SELECT COUNT(*) FROM main.language;
SELECT COUNT(*) FROM main.payment;
SELECT COUNT(*) FROM main.rental;
SELECT COUNT(*) FROM main.sales_by_film_category;
SELECT COUNT(*) FROM main.sales_by_store;
SELECT COUNT(*) FROM main.staff;
SELECT COUNT(*) FROM main.staff_list;
SELECT COUNT(*) FROM main.store;

-- 2. d) Calculate descripte statistic on film length
SELECT
	COUNT(title) AS number_of_title,
	ROUND(AVG(length)) AS avg_length_min,
	MEDIAN(length) AS median_length_min,
	MAX(length) AS max_length_min,
	MIN(length) AS min_length_min
FROM main.film;

-- 2. e) What are the peak rental time
SELECT
	strftime('%H', rental_date) AS time,
	COUNT(r.rental_date) amount_of_rental
FROM  
	main.rental r
GROUP BY time
ORDER BY time;


-- 2. f) What is the distribution of film rating
SELECT 
	rating,
	CASE
		WHEN rating = 'PG' THEN 'parental guidance suggested'
		WHEN rating = 'G' THEN 'general audiences - all ages admitted'
		WHEN rating = 'NC-17' THEN 'no one 17 and under admitted'
		WHEN rating = 'PG-13' THEN 'parental guidance under 13'
		WHEN rating = 'R' THEN 'restriced - under 17 requires accompanying parent or adultguardian'
		ELSE rating
	END AS explanation,
	COUNT(*) AS total
	FROM
		main.film f
	GROUP BY
		rating
	ORDER BY total DESC;


-- 2. g) Who are the top 10 customer by number of rental
SELECT 
	c.customer_id,
	COUNT(r.rental_date) amount_rent
FROM 
	main.rental r INNER JOIN main.customer c ON r.customer_id = c.customer_id
GROUP BY 
	c.customer_id
ORDER BY amount_rent DESC, c.customer_id ASC
LIMIT 10;


-- 2. h) Retrieve a list of all customer and what films they have rented
SELECT
	c.customer_id,
	c.first_name,
	c.last_name,
	c.email,
	f.title,
	f.description 
FROM
	main.customer c
INNER JOIN main.rental r ON
	c.customer_id = r.customer_id
INNER JOIN main.inventory i ON r.inventory_id = i.inventory_id 
INNER JOIN main.film f ON i.film_id = f.film_id
ORDER BY c.customer_id;

-- 2. i) HOW many each customer have made i rent on each movie
SELECT
	c.first_name,
	c.last_name,
	f.title,
	COUNT(f.title) AS amount_time_rent
FROM
	main.customer c
LEFT JOIN main.rental r ON
	c.customer_id = r.customer_id
LEFT JOIN main.inventory i ON r.inventory_id = i.inventory_id
LEFT JOIN main.film f ON i.film_id = f.film_id
GROUP BY c.first_name, c.last_name, f.title
ORDER BY amount_time_rent DESC;