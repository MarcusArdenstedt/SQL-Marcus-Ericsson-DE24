SELECT
	*
FROM
	main.plants;
	
SELECT
	*
FROM
	main.plant_care pc;
	
SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc.sunlight 
FROM
	main.plants p
LEFT JOIN 
	main.plant_care pc ON p.plant_id = pc.plant_id; 
	

SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc.sunlight 
FROM
	main.plants p
RIGHT JOIN 
	main.plant_care pc ON p.plant_id = pc.plant_id;
	


SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc.sunlight 
FROM
	main.plants p
INNER JOIN 
	main.plant_care pc ON p.plant_id = pc.plant_id;
	


SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc.sunlight 
FROM
	main.plants p
FULL JOIN 
	main.plant_care pc ON p.plant_id = pc.plant_id;