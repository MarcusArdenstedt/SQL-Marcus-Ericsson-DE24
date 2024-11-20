SELECT * FROM main.data_jobs;

-- EN --> Entry level
-- MI --> Mid level
-- SE --> Senior
-- EX --> Expert

SELECT
	CASE
		WHEN experience_level = 'SE' THEN 'Senior'
		WHEN experience_level = 'MI' THEN 'Mid level'
		WHEN experience_level = 'EN' THEN 'Entry level'
		WHEN experience_level = 'EX' THEN 'Expert'
	END AS experience_level, 
	* EXCLUDE (experience_level)
FROM
	main.data_jobs
WHERE 
	experience_level IN ('SE', 'MI', 'EN', 'EX');

-- have i transformed my data?
SELECT * FROM main.data_jobs;

-- to persist change in the table --> update it
UPDATE main.data_jobs 
SET 
experience_level = CASE
		WHEN experience_level = 'SE' THEN 'Senior'
		WHEN experience_level = 'MI' THEN 'Mid level'
		WHEN experience_level = 'EN' THEN 'Entry level'
		WHEN experience_level = 'EX' THEN 'Expert'
		ELSE experience_level 
	END
WHERE 
	experience_level IN ('SE', 'MI', 'EN', 'EX');

SELECT DISTINCT experience_level FROM main.data_jobs;

-- not update data
SELECT
	CASE
		WHEN employment_type = 'FT' THEN 'full-time'
		WHEN employment_type = 'PT' THEN 'part-time'
		WHEN employment_type = 'CT' THEN 'contract'
		WHEN employment_type = 'F' THEN 'freelance'
	END AS employment_type_label,
	* EXCLUDE (employment_type)
FROM
	main.data_jobs
WHERE
	employment_type IN ('FT', 'PT', 'CT', 'F');

