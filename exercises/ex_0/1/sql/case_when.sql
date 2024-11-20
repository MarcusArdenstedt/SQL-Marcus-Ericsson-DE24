SELECT * FROM main.house_price;

SELECT
	(COUNT(CASE WHEN final_price > 10000000 THEN 1 END) * 100 / COUNT(*)) AS percentage_over_10m
FROM
	main.house_price;

SELECT
	COUNT(*) * 100 / SELECT COUNT(*) main.house_price
	FROM main.house_price


