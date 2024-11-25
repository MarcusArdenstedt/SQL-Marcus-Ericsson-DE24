-- id -> food
-- remove googletopics
-- year column
-- week_id --> week
-- value --> number_of_searches

CREATE TABLE IF NOT EXISTS main.cleaned_food AS (
SELECT
	id AS food,
	SUBSTRING(week_id, 1, 4) AS year,
	week_id[6:] AS week,
	value AS number_of_searches
FROM
	main.food);

DESC;



