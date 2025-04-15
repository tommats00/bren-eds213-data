-- There are lots of "dot-commands" in DuckDB
.help
.help show
.show
-- .exit will exit DuckDB, or Ctrl-D

-- Start with SQL
SELECT * FROM Site;
-- SQL is case-insensitive, but uppercase is the tradition

-- LIMIT clause
SELECT * 
    FROM Site  
    LIMIT 3;

-- can be combined with OFFSET clause
SELECT * FROM Site
    LIMIT 3 -- chooses three observations
    OFFSET 3; -- this skips the first three observations

-- selecting distinct items
SELECT * FROM Bird_nests LIMIT 1;
SELECT Species FROM Bird_nests;
SELECT DISTINCT Species FROM Bird_nests;
SELECT DISTINCT Species, Observer FROM Bird_nests;

-- add ordering
SELECT DISTINCT Species, Observer
    FROM Bird_nests
    ORDER BY Species;

-- look at Site table
SELECT * FROM Site;

-- select distinct locations from site table
-- are they returned in order? IF not, order them
SELECT DISTINCT Location 
    FROM Site 
    ORDER BY Location; 

-- Add a limit cluase to return just 3 results
-- Q: Was the limit applied *before* the results were ordered, or *after?* 
SELECT DISTINCT Location 
    FROM Site 
    ORDER BY Location 
    LIMIT 3;