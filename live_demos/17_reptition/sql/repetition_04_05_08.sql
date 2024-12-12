DESC;


-- wildcard selection/ select star / select all
-- returns a result set of all columns and thier respective rows
-- from the table/view: main.payment
-- when using main.payment we mean schema.table_name/schema.view_name -> namespacing
SELECT
	*
FROM
	main.payment p;
	
-- without specifying the schema, duckdb will look at main schema by default
SELECT * FROM payment;

-- fully qualified name with database_name.schema_name.table_name.column_name
SELECT
	*
FROM
	sakila.main.payment p;
	
-- limits the number of returned rows
SELECT
	*
FROM
	main.payment p
	LIMIT 10;
	

-- cjoose which columns to return
SELECT
	customer_id,
	amount 
FROM
	main.payment p;
	

SELECT
	* EXCLUDE(customer_id, amount)
	
FROM
	main.payment p;
	
-- aggregation function -> many-to-one mapping  
SELECT
	COUNT(*) AS number_payments,
	MIN(amount) AS min_amount,
	ROUND(AVG(amount), 2) AS mean_amount,
	MEDIAN(amount) AS median_amount,
	MAX(amount) AS max_amount
FROM
	main.payment p;
	

-- filter data
-- where filters the rows with a condition
-- if the condition is fulfilled - the row will be in the result set 
SELECT
	*
FROM
	main.payment p
WHERE
	amount > 4.2
ORDER BY 
	amount;
	
-- create a new column with amount classification
SELECT
	amount,
	CASE 
		WHEN amount < 3.5 THEN 'low cost'
		WHEN amount < 7.5 THEN 'medium cost'
		ELSE 'high cost'
	END AS cost_level
FROM
	main.payment p
	
SELECT
	*,
	amount,
	CASE 
		WHEN amount < 3.5 THEN 'low cost'
		WHEN amount < 7.5 THEN 'medium cost'
		ELSE 'high cost'
	END AS cost_level
FROM
	main.payment p	
	

		
CREATE VIEW IF NOT EXISTS main.payment_level AS (
	SELECT
		*,
		CASE 
			WHEN amount < 3.5 THEN 'low cost'
			WHEN amount < 7.5 THEN 'medium cost'
			ELSE 'high cost'
		END AS cost_level
	FROM
		main.payment p
);

SELECT
	cost_level,
	COUNT(amount) AS number_per_level,
	ROUND(AVG(amount)) AS mean_amount
FROM
	main.payment_level
GROUP BY
	cost_level;
	
	
	
	
	
	
	