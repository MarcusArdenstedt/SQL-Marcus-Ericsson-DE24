SELECT * FROM main.house_price;

-- 1 j) How many percentage of homes cost more than 10 million
SELECT
	COUNT(CASE WHEN final_price > 10000000 THEN 1 END) * 100 / COUNT(*) AS percentage_over_10m
FROM
	main.house_price;

SELECT
	COUNT(*)/500*100 AS percentage_over_10M
FROM
	main.house_price
WHERE
	final_price > 10000000;

SELECT
	COUNT(*) * 100 / (
	SELECT
		COUNT(*)
	FROM
		main.house_price) AS percentage_over_10M
FROM main.house_price
WHERE final_price > 10000000;