-- c and d) adding columns
ALTER TABLE cleaned_salries
ADD COLUMN salary_sek_yearly INTEGER;

ALTER TABLE cleaned_salries
ADD COLUMN salary_sek_monthly INTEGER;

ALTER TABLE main.cleaned_salries
ADD COLUMN salary_level ENUM('low', 'medium', 'high', 'insanely_high');

DESC TABLE cleaned_salries;

-- second approach -> add new cols

SELECT
	salary_sek_yearly,
	salary_sek_monthly
FROM
	main.cleaned_salries;
