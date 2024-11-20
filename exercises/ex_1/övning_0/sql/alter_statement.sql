SELECT * FROM main.cleaned_salaries;

-- Add column swedish currency yearly salary
ALTER TABLE main.cleaned_salaries ADD swedish_currency_salary_yearly FLOAT;

UPDATE
	main.cleaned_salaries
SET
	swedish_currency_salary_yearly = salary_in_usd * 10.97;

-- ADD column swedish currency salary monthly
ALTER TABLE main.cleaned_salaries ADD swedish_currency_salary_monthly FLOAT;

UPDATE
	main.cleaned_salaries
SET
	swedish_currency_salary_monthly = (salary_in_usd * 10.97)/ 12;





-- ADD column salary level with categories LOW, MEDIUM, HIGH, INSANELY HIGH
ALTER TABLE main.cleaned_salaries ADD salary_level VARCHAR;

UPDATE main.cleaned_salaries 
SET
	salary_level = 'LOW'
WHERE
	swedish_currency_salary_monthly BETWEEN 0 AND 30000;

UPDATE main.cleaned_salaries
SET 
	salary_level = 'MEDIUM'
WHERE 
	swedish_currency_salary_monthly BETWEEN 30001 AND 69999;


UPDATE
	main.cleaned_salaries
SET salary_level =
	CASE
		WHEN swedish_currency_salary_monthly BETWEEN 70000 AND 99999 THEN 'HIGH'
		WHEN swedish_currency_salary_monthly > 100000 THEN 'INSANELY HIGH'
	END
WHERE swedish_currency_salary_monthly >= 70000;






