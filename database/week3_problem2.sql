-- Week3: Problem 2
-- Part 1:

-- This doesn't work because it doesn't know "which Site_name" to return the max area for
-- We need to group by Site_name to get the max area for each site
SELECT Site_name, MAX(Area) FROM Site;

-- These all don't work because we need to group by Site_name
SELECT Site_name, AVG(Area) FROM Site
SELECT Site_name, COUNT(*) FROM Site
SELECT Site_name, SUM(Area) FROM Site

-- Part 2:

-- Find site name and area value for the site with the largest area
SELECT Site_name, MAX(Area) 
    FROM Site 
    GROUP BY Site_name
    ORDER BY MAX(Area) DESC
    LIMIT 1;

-- Part 3:
SELECT Site_name, Area 
    FROM Site 
    WHERE Area = (
        SELECT MAX(Area)
        FROM Site);