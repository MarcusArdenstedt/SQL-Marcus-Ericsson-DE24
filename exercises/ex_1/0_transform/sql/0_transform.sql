-- a)
SELECT * FROM main.data_jobs;

SELECT DISTINCT employment_type FROM main.data_jobs;

SELECT
	CASE
		WHEN employment_type = 'CT' THEN 'Contract'
		WHEN employment_type = 'FL' THEN 'Freelance'
		WHEN employment_type = 'PT' THEN 'Part time'
		WHEN employment_type = 'FT' THEN 'Full time'
		ELSE employment_type 
	END 
	AS employment_type 
FROM
	main.data_jobs;
	

--- transformation in cleaned_salries
UPDATE cleaned_salries
SET
	employment_type = CASE
		WHEN employment_type = 'CT' THEN 'Contract'
		WHEN employment_type = 'FL' THEN 'Freelance'
		WHEN employment_type = 'PT' THEN 'Part time'
		WHEN employment_type = 'FT' THEN 'Full time'
		ELSE employment_type 
	END;
SELECT DISTINCT employment_type FROM main.cleaned_salries;

SELECT employment_type FROM main.cleaned_salries;

------------------------------------------------

-- b) do yourself --> similar to a

--------------------------------------------------

-- c)
-- one approach is to create a new table with this content
-- and replace the old one (create or replace table as..)
SELECT
	salary_in_usd * 10.9 AS salary_sek_yearly,
	ROUND(salary_sek_yearly/12) AS salary_sek_monthly,
	*
FROM
	main.cleaned_salries;

-- second approach -> add new cols

UPDATE main.cleaned_salries
SET 
	salary_sek_yearly = salary_in_usd * 10.9,
	salary_sek_monthly = salary_sek_yearly/12;
SELECT 
	salary_sek_yearly,
	salary_sek_monthly
FROM main.cleaned_salries;

-- e) 
-- strategy: statistical approach
-- there is aggregation functions such as AVG, MIN, MAX, MEDIAN, QUANTILE_CONT
-- summarize in duckdb

summarize main.cleaned_salries;

-- 93000 -> low
-- 129000 -> medium
-- 170000 -> high
--- > 170000 -> insanely_high

-- 25th quantile(q) 25% of dataset has lower than this value

SELECT
	salary_sek_monthly,
	CASE 
		WHEN salary_sek_monthly < 93000 THEN 'low'
		WHEN salary_sek_monthly < 129000 THEN 'medium'
		WHEN salary_sek_monthly < 170000 THEN 'high'
		ELSE 'insanely_high'
	END AS salary_level
FROM
	main.cleaned_salries;
	

UPDATE main.cleaned_salries
SET 
	salary_level = 	CASE 
		WHEN salary_sek_monthly < 93000 THEN 'low'
		WHEN salary_sek_monthly < 129000 THEN 'medium'
		WHEN salary_sek_monthly < 170000 THEN 'high'
		ELSE 'insanely_high'
	END;
	
SELECT
	salary_sek_monthly,
	salary_level
FROM
	main.cleaned_salries;
	
-----------------------------------------

-- f) choose column: experience
CREATE OR REPLACE TABLE main.cleaned_salaries AS (
SELECT
	experience_level,
	employment_type,
	job_title,
	salary_sek_yearly,
	salary_sek_monthly,
	remote_ratio,
	company_size,
	salary_level
FROM 
	main.cleaned_salries);
	
SELECT * FROM main.cleaned_salaries;