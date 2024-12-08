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
FROM main.customer_list cl;

SELECT 
