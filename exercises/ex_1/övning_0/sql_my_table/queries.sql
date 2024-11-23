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
SELECT
	COUNT(DISTINCT job_title)
FROM
	main.my_table
WHERE
	experience_level = 'SENIOR ENGINEER';

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

SELECT 
	job_title,
	ROUND(AVG(swedish_currency_salary_yearly)) AS mean_salary_senior_yearly,
	MEDIAN(swedish_currency_salary_yearly) AS median_salary_senior_yearly,
	ROUND(AVG(swedish_currency_salary_monthly)) AS mean_salary_senior_monthly,
	MEDIAN(swedish_currency_salary_monthly) AS medain_salary_senior_monthly
FROM
	main.my_table
WHERE experience_level = 'SENIOR ENGINEER'
GROUP BY 
	job_title;

-- 1. e) Find the most top earning job titles based on their median salary and how much they earn.
SELECT 
	job_title,
	MEDIAN(swedish_currency_salary_yearly) AS median_salary_senior_yearly,
	MEDIAN(swedish_currency_salary_monthly) AS median_salary_senior_monthly
FROM
	main.my_table
WHERE 
	experience_level = 'SENIOR ENGINEER'
GROUP BY
	job_title
ORDER BY
	median_salary_senior_yearly DESC,
	median_salary_senior_monthly DESC
LIMIT 1;

-- 1. f) How many percentage of the jobs are fully remote, 50 percentage remote and not fully remote
SELECT * FROM main.my_table;

SELECT 
	(COUNT(CASE WHEN remote_ratio = 100 THEN 1 END) * 100.0) / COUNT(*) AS remote_ratio_100_percentage,
	(COUNT(CASE WHEN remote_ratio = 50 THEN 1 END) * 100.0) / COUNT(*) AS remote_ratio_50_percentage,
	(COUNT(CASE WHEN remote_ratio = 0 THEN 1 END) * 100.0) / COUNT(*) AS remote_ratio_0_percentage
FROM 
	main.my_table;

-- 1. g) pick out a job title of interest and figure out if company size affects the salary. Make a simple analysis as a comprehensive
--       one requires causality investigations which are much harder to find
SELECT * FROM main.my_table;

SELECT
	company_size,
	experience_level,
	MEDIAN(swedish_currency_salary_yearly) AS median_salary_yearly_Data_Engineer,
	ROUND(AVG(swedish_currency_salary_yearly)) AS average_salary_yearly_Data_Engineer
FROM
	main.my_table
WHERE 
	job_title = 'Data Engineer'
GROUP BY 
	company_size,
	experience_level 
ORDER BY
	median_salary_yearly_Data_Engineer DESC,
	average_salary_yearly_Data_Engineer DESC;
-- tjänar mest på att jobba på ett medium stort företag inom data engineer, tjänar dryga dubbel så mycket än att jobba på ett litet företag

SELECT
	company_size,
	experience_level,
	MEDIAN(swedish_currency_salary_monthly) AS median_salary_monthly_AI_Engineer,
	ROUND(AVG(swedish_currency_salary_monthly)) AS average_salary_monthly_AI_Engineer
FROM 
	main.my_table
WHERE 
	job_title = 'AI Engineer'
GROUP BY
	company_size,
	experience_level;
SELECT
	COUNT(*)
FROM
	main.my_table 
WHERE job_title = 'AI Engineer'; 



	
	