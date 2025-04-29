-- Want an output of the Observer's Name and the number of nests
-- Worked at the 'nome' site from 1998 to 2008

-- View bird_nests table
SELECT * FROM Bird_nests;

-- View Personnel table
SELECT * FROM Personnel;

-- I need to select the information from the bird_nests table and then join the
-- Names from the personnel table

SELECT Name, COUNT(*) AS Num_floated_nests
    FROM Bird_nests JOIN Personnel 
    ON Bird_nests.Observer = Personnel.Abbreviation
    WHERE Site = 'nome'
        AND Year BETWEEN 1998 AND 2008
        AND ageMethod = 'float'
    GROUP BY Name
    HAVING COUNT(*) = 36;
    

