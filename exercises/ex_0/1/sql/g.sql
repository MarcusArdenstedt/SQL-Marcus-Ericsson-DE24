SELECT 
	MIN(final_price) AS min_sold,
	ROUND(AVG(final_price)) AS mean_sold,
	MEDIAN(final_price) AS median_sold,
	MAX(final_price) AS max_sold,
FROM 
	house_price;