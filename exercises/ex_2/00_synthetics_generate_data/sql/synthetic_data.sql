-- 0 a) generate 10 rows of dice rolls data

SELECT * FROM generate_series(1,10);

-- 0 b) Calculate the average of getting a 6
SELECT 
	SUM(CASE WHEN FLOOR(RANDOM() * 6 + 1)  = 6 THEN 1 ELSE 0 END)  AS number_of_6
	FROM generate_series(1,10);

-- 0 c) generate 100 rows of dice rolls and calculate average of getting a six
SELECT
SUM(CASE WHEN FLOOR(RANDOM() * 6 + 1) = 6 THEN 1 ELSE 0 END) AS numder_of_6
FROM generate_series(1,100);

SELECT FLOOR(RANDOM() * 6 + 1) AS dice FROM generate_series(1,100);

SELECT 
	AVG(CASE WHEN FLOOR(RANDOM() * 6 + 1) = 6 THEN 1 ELSE 0 END) * 100  AS average_number_of_6
FROM generate_series(1,100);

-- 0 d) generate 1000, 10000, 100000, 1000000 rolls
SELECT 
	AVG(CASE WHEN FLOOR(RANDOM() * 6 + 1) = 6 THEN 1 ELSE 0 END) AS average_number_of_6
	FROM generate_series(1,10000000);
-- The procentage thosen't change so much.  




