SELECT * FROM main.cleaned_salaries;

SELECT
	experience_level,
	employment_type,
	job_title,
	swedish_currency_salary_yearly,
	swedish_currency_salary_monthly,
	remote_ratio,
	company_size,
	salary_level
FROM main.cleaned_salaries;

CREATE TABLE my_table AS SELECT
	experience_level,
	employment_type,
	job_title,
	swedish_currency_salary_yearly,
	swedish_currency_salary_monthly,
	remote_ratio,
	company_size,
	salary_level
FROM main.cleaned_salaries;

SELECT * FROM my_table;

UPDATE
	my_table
SET
	experience_level = CASE
		WHEN experience_level = 'SE' THEN 'SENIOR ENGINEER'
		WHEN experience_level = 'MI' THEN 'MID-LEVEL ENGINEER'
		WHEN experience_level = 'EL' THEN 'ENTRY-LEVEL ENGINEER'
		ELSE experience_level
	END 
WHERE experience_level IN ('SE', 'MI', 'EL');

SELECT * FROM my_table;