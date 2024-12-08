SELECT * FROM synthetic.sales_feb sf 
UNION 
SELECT * FROM synthetic.sales_jan sj;


SELECT product_name, amount FROM synthetic.sales_jan
UNION 
SELECT product_name, amount FROM synthetic.sales_feb;

-- plockar bort duplicering av 3
SELECT id, product_name FROM synthetic.sales_jan
UNION 
SELECT id, product_name FROM synthetic.sales_feb;

-- utput id: 3, product_name: monitor 
SELECT id, product_name FROM synthetic.sales_jan
INTERSECT
SELECT id, product_name FROM synthetic.sales_feb;

-- visar bara dem rader från första tabellen som inte finns i den andra
SELECT product_name, amount FROM synthetic.sales_feb
EXCEPT
SELECT product_name, amount FROM synthetic.sales_jan; 