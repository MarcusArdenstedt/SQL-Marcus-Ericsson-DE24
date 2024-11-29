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
UPDATE main.cleaned_salaries 
SET company_size =
	CASE 
		WHEN company_size = 'S' THEN 'Small'
		WHEN company_size = 'M' THEN 'Medium'
		WHEN company_size = 'L' THEN 'Large'
		ELSE company_size
	END;
SELECT * FROM main.cleaned_salaries;


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

-- 1. a) count data engineer jobs
SELECT
	COUNT(job_title) AS number_of_data_engineer
FROM 
	main.cleaned_salaries;
	
-- 1. b) count unique jobs tilte
SELECT
	COUNT(DISTINCT job_title) AS 'number of job titles'
FROM
	main.cleaned_salaries;
	
-- 1. c) Find out how many jobs that goes inte each salary level
SELECT * FROM main.cleaned_salaries;

SELECT 
	salary_level,
	COUNT(*) AS 'number of jobs'
FROM 
	main.cleaned_salaries
GROUP BY 
	salary_level;
	
-- 1. d) Find out the median and mean salaries for each seniority levels
UPDATE main.cleaned_salaries 
SET	experience_level =
	CASE
		WHEN experience_level = 'SE' THEN 'Senior'
		WHEN experience_level = 'MI' THEN 'Mid-level'
		WHEN experience_level = 'EX' THEN 'Expert'
		WHEN experience_level = 'EN' THEN 'Entry-level'
		ELSE experience_level
	END;
SELECT * FROM main.cleaned_salaries;
--------------------------------
SELECT
	experience_level,
	ROUND(AVG(salary_sek_monthly)) AS 'average salary',
	MEDIAN(salary_sek_monthly) AS 'median salary'
FROM 
	main.cleaned_salaries
WHERE experience_level = 'Senior'
GROUP BY 
	experience_level;
	
-- 1. e) Find out top earning job titles based on thier median salaries and how much they earn
SELECT 
	job_title,
	MEDIAN(salary_sek_yearly) AS median_salary_yearly
FROM 
	main.cleaned_salaries
GROUP BY 	
	job_title 
ORDER BY
	median_salary_yearly DESC
LIMIT 1;

-----------------------------------------------

-- 1. f) How many percentage of the jobs are fully remote, 50 percent remote and fully not remote
SELECT
	job_title,
	ROUND((COUNT(CASE WHEN remote_ratio = 100 THEN 1 END) * 100)/ COUNT(*)) AS '100 percent remote in percent',
	ROUND((COUNT(CASE WHEN remote_ratio = 50 THEN 1 END) * 100)/ COUNT(*)) AS '50 percent remote in percent',
	ROUND((COUNT(CASE WHEN remote_ratio = 0 THEN 1 END) * 100)/ COUNT(*)) AS '0 percent remote in percent'
FROM
	main.cleaned_salaries
GROUP BY 
	job_title;
	
-----------------------------------------------------------------

-- 1. f) Pick out a job title of interest and figure out if company size affect the salary.
--       Make a simple analysis as a comprehensive one requires causality invenstigation wich are much harder
--       to find

SELECT 
	job_title,
	company_size,
	salary_sek_yearly,
	salary_sek_monthly,
	salary_level
FROM 
	main.cleaned_salaries
WHERE job_title = 'ML Engineer';

SELECT 
	job_title,
	company_size,
	Max(salary_sek_yearly) AS 'maximum salary yearly',
	Min(salary_sek_yearly) AS 'minimum salary yearly',
	MAX(salary_sek_monthly) AS 'maximum salary monthly',
	MIN(salary_sek_monthly) AS 'minimum salary monthly'
FROM 
	main.cleaned_salaries
WHERE
	job_title IN ('ML Engineer', 'AI Engineer')
GROUP BY
	job_title,
	company_size
ORDER BY 
	job_title ASC;

SELECT * FROM main.cleaned_salaries;