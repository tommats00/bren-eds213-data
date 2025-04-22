-- Week 3: Problem 3

-- List Scientific_name of bir species in descending order of their max
-- average egg volumes
CREATE TEMP TABLE Averages AS 
    SELECT Nest_ID, AVG((PI() / 6) * Length * Width^2)
    AS Avg_volume
    FROM Bird_eggs
    GROUP BY Nest_ID;

-- Join the table with Bird_nests, so we can group by species, and join with species
SELECT Species, MAX(Avg_volume) AS Avg_volume
    FROM Bird_nests JOIN Averages USING (Nest_ID)
    GROUP BY Species;

