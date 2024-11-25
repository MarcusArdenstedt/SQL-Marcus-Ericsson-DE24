-- 10 most searched foods
SELECT
	food,
	SUM(number_of_searches) AS total_searches
FROM
	main.cleaned_food
GROUP BY
	food
ORDER BY
	total_searches DESC
LIMIT 10;


-- total searches by year
SELECT --3
	year,
	SUM(number_of_searches) AS total_searches
FROM --1
	main.cleaned_food
GROUP BY -- 2
	year
ORDER BY -- 4
	total_searches DESC;

SELECT 
	year,
	SUM(number_of_searches) AS total_searches
FROM 
	main.cleaned_food
GROUP BY 
	year
HAVING
	total_searches > 300000
ORDER BY 
	total_searches DESC;

SELECT
	year,
	food,
	SUM(number_of_searches) AS total_searches
FROM
	main.cleaned_food
GROUP BY
	food,
	year
ORDER BY 
	total_searches DESC;

-- left  for reader
	
-- most popular in summer
SELECT * FROM main.cleaned_food;

SELECT
	food,
	SUM(number_of_searches) AS searches_summer
FROM
	main.cleaned_food
WHERE 
	week BETWEEN '24' AND '35'
GROUP BY
	food
ORDER BY searches_summer DESC
LIMIT 1;

-- most popular food in vinter
SELECT 
	food,
	SUM(number_of_searches) AS searches_vinter
FROM main.cleaned_food
WHERE 
	week BETWEEN '49' AND '51'
GROUP BY 
	food 
ORDER BY
	searches_vinter DESC
LIMIT 1;
	
