CREATE TABLE IF NOT EXISTS cleaned_salaries AS (
    SELECT * FROM read_csv_auto('data/salaries (2).csv')
);