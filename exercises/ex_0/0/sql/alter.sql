SELECT * FROM main.course_structure;

ALTER TABLE main.course_structure ADD COLUMN learnt BOOLEAN DEFAULT FALSE;

UPDATE main.course_structure 
SET learnt = TRUE 
WHERE week IN (46);

SELECT * FROM main.course_structure ORDER BY week; 
 

