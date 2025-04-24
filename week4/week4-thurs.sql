CREATE TABLE Snow_cover(
    Site VARCHAR NOT NULL,
    Year INTEGER NOT NULL CHECK (Year BETWEEN 1990 AND 2020),
    Date DATE NOT NULL,
    Plot VARCHAR NOT NULL,
    Location VARCHAR NOT NULL,
    Snow_cover REAL CHECK (Snow_cover BETWEEN 0 and 130),
    Water_cover REAL CHECK (Water_cover BETWEEN 0 and 130),
    Land_cover REAL CHECK (Land_cover BETWEEN 0 and 130),
    Total_cover REAL CHECK (Total_cover BETWEEN 0 and 130),
    Observer VARCHAR,
    Notes VARCHAR,
    PRIMARY KEY (Site, Plot, Location, Date),
    FOREIGN KEY (Site) REFERENCES Site (Code)
);

COPY Snow_cover FROM "../ASDN_csv/snow_survey_fixed.csv" (header TRUE, nullstr "NA");

SELECT * FROM Snow_cover; 

-- Ask 1: What is the average snow cover at each site? 
SELECT Site, AVG(Snow_cover) AS avg_snow_cover
    FROM Snow_cover
    GROUP BY Site
    ORDER BY avg_snow_cover DESC;

-- Ask 2: Top 5 most snow sites
SELECT Site, AVG(Snow_cover) AS avg_snow_cover
    FROM Snow_cover
    GROUP BY Site
    ORDER BY avg_snow_cover DESC
    LIMIT 5;

-- Ask 3: Save this as a VIEW
CREATE VIEW Site_avg_snowcover AS 
    (SELECT Site, AVG(Snow_cover) AS avg_snow_cover
    FROM Snow_cover
    GROUP BY Site
    ORDER BY avg_snow_cover DESC
    LIMIT 5);

-- Ask 4: Save this as a TEMP TABLE
CREATE TEMP TABLE Site_avg_snowcover_table AS 
    (SELECT Site, AVG(Snow_cover) AS avg_snow_cover
    FROM Snow_cover
    GROUP BY Site
    ORDER BY avg_snow_cover DESC
    LIMIT 5);

SELECT * FROM Site_avg_snowcover_table;

-- DANGER ZONE AKA updating data
-- Always good to make a COPY of the table as a TEMP TABLE
-- In case you update the data incorrectly

-- We found that 0s at Plot = 'brw0' with snow_cover == 0 are actualy no data (NULL)

CREATE TEMP TABLE Snow_cover_backup AS (SELECT * FROM Snow_cover);
UPDATE Snow_cover_backup SET Snow_cover = NULL WHERE Plot = 'brw0' AND Snow_cover = 0;