SELECT * FROM main.house_price;


-- count how many rows
SELECT COUNT(*)  FROM main.house_price;

-- Find 5 top most expensive homes sold

SELECT
	*
FROM
	main.house_price
ORDER BY
	final_price DESC
LIMIT 5; 

-- Find 5 cheapest homes sold 

SELECT 
	* 
FROM
	main.house_price
ORDER BY 
	final_price ASC 
LIMIT 5;







