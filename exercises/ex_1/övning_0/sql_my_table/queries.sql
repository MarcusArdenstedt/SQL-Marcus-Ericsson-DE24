SELECT * FROM main.my_table;

UPDATE
	main.my_table
SET
	experience_level = CASE
		WHEN experience_level = 'EN' THEN 'ENTRY-LEVEL ENGINEER'
		WHEN experience_level = 'EX' THEN 'EXPERT-LEVEL ENGINEER'
		ELSE experience_level 
	END
WHERE experience_level IN ('EN', 'EX');

SELECT * FROM main.my_table;


-- 1. a) Count Data engineer jobs
SELECT
	COUNT(*) AS number_of_data_engineer_jobs
FROM
	main.my_table
WHERE
	job_title = 'Data Engineer'; 

-- 1. b) Count number of unique job titles in total
SELECT
	COUNT(DISTINCT job_title) AS number_unique_job_title
FROM
	main.my_table;

-- 1 c) Find out how many jobs that goes inte each salary_level
SELECT
	salary_level,
	COUNT(*) AS job_count
FROM
	main.my_table
GROUP BY 
	salary_level 
ORDER BY 
	job_count DESC;

-- 1. d) Find out the median and mean salaries for each seniority levels
SELECT * FROM main.my_table;
SELECT COUNT(DISTINCT job_title) FROM main.my_table WHERE experience_level = 'SENIOR ENGINEER';

SELECT
	experience_level,
	job_title ,
	ROUND(AVG(swedish_currency_salary_yearly)) AS mean_salary_senior_yearly,
	MEDIAN(swedish_currency_salary_yearly) AS median_salary_senior_yearly
FROM
	main.my_table
GROUP BY 
	experience_level,
	job_title 
HAVING experience_level = 'SENIOR ENGINEER';

	
	