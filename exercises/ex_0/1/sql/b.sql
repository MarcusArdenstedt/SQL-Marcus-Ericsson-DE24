SELECT * FROM house_price;

SELECT
	*
FROM house_price
WHERE commune LIKE 'H%';

SELECT 
	*
FROM house_price
WHERE commune LIKE 'Hä%';

SELECT 
	* 
FROM house_price
WHERE address LIKE 'Mä%';

SELECT 
	* 
FROM house_price
WHERE commune LIKE '%Lidingö%';
