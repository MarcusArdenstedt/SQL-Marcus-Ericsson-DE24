-- python 500000 < x < 100000
-- many other langauges (x > 50000) && (x < 100000)

-- in SQL - BETWEEN... AND operator

SELECT
	*
FROM
	main.data_jobs
WHERE
	salary_in_usd BETWEEN 200000 AND 500000;
	

-- bulding up the query step by step and test it out
SELECT
	job_title,
	experience_level,
	employment_type, 
	ROUND(salary_in_usd * 11.01/12) AS salary_sek_month
FROM
	main.data_jobs
WHERE
	salary_in_usd BETWEEN 100000 AND 500000
	AND job_title = 'Data Engineer'
	AND experience_level = 'Entry level'
	--AND employment_type = 'PT'
	ORDER BY 
		salary_sek_month
	DESC;