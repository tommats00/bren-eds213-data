-- Week 4: Missing Data

-- Find which sites have no egg data using the three techniques demonstrated in class
-- Work with Bird_eggs, Site, or both

-- Techniques:
-- 1. Using a Code NOT IN (subquery) clause
-- 2. Using outer join WHERE clause that selects desired rows
-- 3. Using operation EXCEPT


-- 1. Using Code NOT IN clause
SELECT Code FROM Site
    WHERE Code NOT IN (
        SELECT Site
        FROM Bird_eggs
        WHERE Site IS NOT NULL
    )
    ORDER BY Code;
    


-- 2. Using Join and WHERE Clause 
SELECT Code FROM Site 
    LEFT JOIN Bird_eggs 
    ON Site.Code = Bird_eggs.Site
    WHERE Egg_num IS NULL
    ORDER BY Code;


-- 3. Using EXCEPT operation
SELECT Code FROM Site
    EXCEPT
    SELECT Site 
    FROM Bird_Eggs 
    WHERE Site IS NOT NULL
    ORDER BY Code;