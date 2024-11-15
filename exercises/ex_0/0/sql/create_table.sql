DESC;

CREATE TABLE IF NOT EXISTS course_structure (
content VARCHAR PRIMARY KEY,
week INTEGER,
content_type VARCHAR);

SELECT * FROM main.course_structure;