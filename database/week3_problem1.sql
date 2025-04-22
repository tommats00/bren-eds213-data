-- Week 3: SQL Problem 1
-- PART 1: NULL Processing

-- Create a temp table 
CREATE TEMP TABLE mytable(
    values REAL
);

-- Insert real and null values into table
INSERT INTO mytable VALUES (1.0), (2.0), (3.0), (4.2), (NULL);

-- Calculate average of values in table
SELECT AVG(values) FROM mytable;

-- The average if NUll is ignored would be 2.55, this is the actual returned value
-- The average if NULL was not returned would be 2.04

-- PART 2
-- Compare these two mean calculations:
SELECT SUM(values) / COUNT(*) FROM mytable;
SELECT SUM(values) / COUNT(values) FROM mytable;

-- The second one is the correct one b/c it ignores NULL values
-- The first one divides by the total number of rows which includes NULLs