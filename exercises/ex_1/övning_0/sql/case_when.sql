SELECT * FROM main.cleaned_salaries;

-- change in the employment_type
-- FT --> Full time
-- PT --> Part time
-- FL --> Freelance
-- CT --> Contract 
SELECT
	CASE
		WHEN employment_type = 'CT' THEN 'Contract'
		WHEN employment_type = 'FL' THEN 'Freelance'
		WHEN employment_type = 'PT' THEN 'Part time'
		WHEN employment_type = 'FT' THEN 'Full time'
	END AS employment_type,
	* EXCLUDE (employment_type)
FROM
	main.cleaned_salaries
WHERE
	employment_type IN ('CT', 'FL', 'PT', 'FT');

-- To persist change in the table --> update it

UPDATE
	main.cleaned_salaries
SET
	employment_type = CASE 
		WHEN employment_type = 'CT' THEN 'Contract'
		WHEN employment_type = 'FL' THEN 'Freelance'
		WHEN employment_type = 'PT' THEN 'Part time'
		WHEN employment_type = 'FT' THEN 'Full time'
		ELSE employment_type 	
	END
	WHERE employment_type In ('CT', 'FL', 'PT', 'FT');

SELECT DISTINCT employment_type FROM main.cleaned_salaries;

-- change in the company size
-- S --> Small
-- M --> Medium
-- L --> Large
SELECT
	CASE
		WHEN company_size = 'S' THEN 'Small'
		WHEN company_size = 'M' THEN 'Medium'
		WHEN company_size = 'L' THEN 'Large'
		ELSE company_size
	END AS company_size,
	* EXCLUDE (company_size) 
FROM main.cleaned_salaries
WHERE company_size IN ('S', 'M', 'L');

UPDATE
	main.cleaned_salaries
SET 
	company_size = CASE
		WHEN company_size = 'S' THEN 'Small'
		WHEN company_size = 'M' THEN 'Medium'
		WHEN company_size = 'L' THEN 'Large'
		ELSE company_size
	END
WHERE
	company_size IN ('S',
	'M',
	'L');

SELECT DISTINCT company_size FROM main.cleaned_salaries;

SELECT * FROM main.cleaned_salaries;

	


	


	