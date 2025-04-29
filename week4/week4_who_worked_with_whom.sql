-- Week 4: Who worked with whom? 

-- From the Camp_assignment table: Find all pairs of people who worked at the
-- same site, and whose date ranges overlap while at that site.

-- Solved using a self-join: join using two copies of the same table

-- View the Camp_assignment table
SELECT * FROM Camp_assignment;

-- Create a copy of the Camp_assignment to self-join
CREATE TEMP TABLE Camp_assignment_b AS (SELECT * FROM Camp_assignment);

-- Check if it copied correctly
SELECT * FROM Camp_assignment_b;

-- Step 1: 
-- Self join the tables
SELECT * FROM Camp_assignment JOIN Camp_assignment_b
    ON Camp_assignment.Site = Camp_assignment_b.Site;

-- Step 2:
-- Check that A and B person's date ranges overlap
SELECT * FROM Camp_assignment JOIN Camp_assignment_b
    ON Camp_assignment.Site = Camp_assignment_b.Site
        AND Camp_assignment.Start <= Camp_assignment_b.End
        AND Camp_assignment.End >= Camp_assignment_b.Start;

-- Step 3:
-- Add a WHERE clause
SELECT * FROM Camp_assignment JOIN Camp_assignment_b
    ON Camp_assignment.Site = Camp_assignment_b.Site
    AND Camp_assignment.Start <= Camp_assignment_b.End
    AND Camp_assignment.End >= Camp_assignment_b.Start
    WHERE Camp_assignment.Site = 'lkri'
    AND Camp_assignment.Observer < Camp_assignment_b.Observer;

-- Step 4: 
-- Clean up the table
SELECT Camp_assignment.Site, Camp_assignment.Observer, Camp_assignment_b.Observer 
    FROM Camp_assignment 
    JOIN Camp_assignment_b
    ON Camp_assignment.Site = Camp_assignment_b.Site
    AND Camp_assignment.Start <= Camp_assignment_b.End
    AND Camp_assignment.End >= Camp_assignment_b.Start
    WHERE Camp_assignment.Site = 'lkri'
    AND Camp_assignment.Observer < Camp_assignment_b.Observer;

