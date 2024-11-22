SELECT * FROM main.house_price;

--  1. g)statistics for minimum, mean, median and max price homes sold
SELECT 
	MIN(final_price) AS min_sold,
	ROUND(AVG(final_price)) AS mean_sold,
	MEDIAN(final_price) AS median_sold,
	MAX(final_price) AS max_sol
FROM main.house_price;


-- statistics for minimum, mean, median and max price per area

SELECT 
	MIN(price_per_area) AS min_price_per_area,
	ROUND(AVG(price_per_area)) AS mean_price_per_area,
	MEDIAN(price_per_area) AS median_price_per_area,
	MAX(price_per_area) AS max_price_per_area
FROM main.house_price;


SELECT
	COUNT(DISTINCT commune) AS number_unique_commune
FROM
	main.house_price;