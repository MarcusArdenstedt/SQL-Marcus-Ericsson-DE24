SELECT * FROM main.house_price;

-- testing percentage_differnce
SELECT 6950000*0.07;

-- 486500.00
SELECT 6950000-6950000*0.07;


-- 1. c) count how many rows
SELECT
	COUNT(*) AS total_rows
FROM
	main.house_price;

-- 1. d) 
DESC TABLE house_price;


-- 1. e)Find 5 top most expensive homes sold
SELECT
	*
FROM
	main.house_price
ORDER BY
	final_price DESC
LIMIT 5;

SELECT
	address,
	commune,
	final_price
FROM
	main.house_price hp
ORDER BY
	final_price DESC
LIMIT 5;

-- 1. f) Find 5 cheapest homes sold 

SELECT 
	address,
	commune,
	area,
	rooms,
	final_price 
FROM
	main.house_price
ORDER BY 
	final_price ASC 
LIMIT 5;

-- explore rooms
SELECT
	rooms,
	final_price
FROM
	main.house_price
WHERE
	rooms <= 3;
