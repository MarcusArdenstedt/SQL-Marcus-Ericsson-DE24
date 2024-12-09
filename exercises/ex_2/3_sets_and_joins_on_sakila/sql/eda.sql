-- 3. a) Retrieve a list of all customer and actor which last name starts with 'G'
SELECT
	a.first_name,
	a.last_name 
FROM
	main.actor a
WHERE a.last_name LIKE 'G%'
UNION  
SELECT 
	c.first_name,
	c.last_name
FROM 
	main.customer c 
WHERE c.last_name LIKE 'G%';

--3. b) How many customers and actors starts have the letters 'ANN' in there first name
SELECT 
	CONCAT('actor first name start with ann: ', COUNT(a.first_name)) AS amount
FROM main.actor a 
WHERE a.first_name LIKE 'ANN%'
UNION ALL 
SELECT 
	CONCAT('customer first name start with ann: ', COUNT(c.first_name))
FROM main.customer c 
WHERE c.first_name LIKE 'ANN%';


-- 3. c) In which cities and countries do the customers live in
SELECT 
	cl.name,
	cl.city,
	cl.country
FROM
	main.customer_list cl
WHERE cl.name LIKE 'SEAN%';

SELECT
	c.first_name,
	c.last_name,
	c2.city,
	c3.country 
FROM
	main.customer c
LEFT JOIN main.address a ON
	c.address_id = a.address_id
LEFT JOIN main.city c2 ON
	a.city_id = c2.city_id
LEFT JOIN main.country c3 ON
	c2.country_id = c3.country_id;
	
-- 3. d) In which cities and countries do the customer with initial "JD" live in
SELECT
	c.first_name,
	c.last_name,
	c2.city,
	c3.country 
FROM
	main.customer c
LEFT JOIN main.address a ON
	c.address_id = a.address_id
LEFT JOIN main.city c2 ON
	a.city_id = c2.city_id
LEFT JOIN main.country c3 ON
	c2.country_id = c3.country_id
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%';

-- 3. e) Retrieve a list of all customers and what films they have rented
SELECT
	c.customer_id,
	c.first_name,
	c.last_name,
	f.title 
FROM
	main.customer c
LEFT JOIN main.rental r ON
	c.customer_id = r.customer_id
LEFT JOIN main.inventory i ON
	r.inventory_id = i.inventory_id
LEFT JOIN main.film f ON
	i.film_id = f.film_id
	ORDER BY c.customer_id;
	
-- 3. f) What else cool information can find out with this database using what you know about SQL
SELECT
	c.first_name AS customer_first_name,
	c.last_name AS customer_last_name,
	a.address,
	c2.city,
	c3.country,
	s2.first_name AS staff_first_name,
	s2.last_name AS staff_last_name 
FROM
	main.customer c
LEFT JOIN main.store s ON
	c.store_id = s.store_id
LEFT JOIN main.address a ON
	s.address_id = a.address_id
LEFT JOIN main.city c2 ON
	a.city_id = c2.city_id
LEFT JOIN main.country c3 ON
	c2.country_id = c3.country_id
LEFT JOIN main.staff s2 ON s.store_id = s2.store_id;

-----------------------------------------------------

-- How many time each customer have rent the same movie
SELECT
	c.first_name,
	c.last_name,
	f.title,
	COUNT(f.title) AS time_rent
FROM
	main.customer c
LEFT JOIN main.rental r ON
	c.customer_id = r.customer_id
LEFT JOIN main.inventory i ON
	r.inventory_id = i.inventory_id
LEFT JOIN main.film f ON
	i.film_id = f.film_id
GROUP BY c.first_name, c.last_name, f.title
ORDER BY time_rent DESC;

