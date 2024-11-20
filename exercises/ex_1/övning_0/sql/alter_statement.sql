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





