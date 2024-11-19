-- DDL
ALTER TABLE database.duckdb ADD COLUMN learnt BOOLEAN DEFAULT FALSE;

-- change name on a column
--ALTER TABLE table_name RENAME COLUMN old_column_name TO new_column_name; 