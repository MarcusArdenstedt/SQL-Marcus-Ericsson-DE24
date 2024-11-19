-- DML
SELECT * FROM database.duckdb WHERE id IN (5,8);


SELECT * FROM database.duckdb WHERE word IN ('TIMESTAMPTZ', 'DROP SCHEMA');

DELETE 
	FROM database.duckdb 
WHERE word IN ('TIMESTAMPTZ', 'DROP SCHEMA');



CREATE SCHEMA IF NOT EXISTS programming;

SELECT * FROM pg_catalog.pg_sequences;

-- tables for each glossary table 
CREATE TABLE IF NOT EXISTS database.sql (
	word STRING,
	description STRING);

CREATE TABLE IF NOT EXISTS database.duckdb (
	word STRING,
	description STRING);

CREATE TABLE IF NOT EXISTS programming.python (
	word STRING,
	description STRING);



