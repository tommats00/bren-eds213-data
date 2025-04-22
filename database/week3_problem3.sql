-- Week 3: Problem 3

-- List Scientific_name of bir species in descending order of their max
-- average egg volumes
CREATE TEMP TABLE Averages AS 
    SELECT Nest_ID, AVG((PI() / 6) * Length * Width^2)
    AS Avg_volume
    FROM Bird_eggs
    GROUP BY Nest_ID;

-- Join the table with Bird_nests, so we can group by species, and join with species
-- Create temp table to join in next step
CREATE TEMP TABLE Max_mean_volume AS
    SELECT Species, MAX(Avg_volume) AS Max_avg_volume
        FROM Bird_nests JOIN Averages USING (Nest_ID)
        GROUP BY Species
        ORDER BY Max_avg_volume DESC;

-- Join Species and temp table for final output
SELECT Scientific_name, Max_avg_volume 
    FROM Species 
    JOIN Max_mean_volume 
    ON Species.Code = Max_mean_volume.Species
    ORDER BY Max_avg_volume DESC;
