CREATE TABLE Snow_survey (
    Site TEXT NOT NULL,
    Year INTEGER CHECK (Year > 0),
    Date DATE NOT NULL,
    Plot TEXT,
    Location TEXT,
    Snow_cover REAL CHECK (Snow_cover >= 0 AND Snow_cover <= 100),
    Water_cover REAL CHECK (Water_cover >= 0 AND Water_cover <= 100),
    Land_cover REAL CHECK (Land_cover >= 0 AND Land_cover <= 100),
    Total_cover REAL CHECK (Total_cover >= 0 AND Total_cover <= 100),
    Observer TEXT NOT NULL,
    Notes TEXT,
    PRIMARY KEY (Site, Date, Plo, Location),
    FOREIGN KEY (Observer) REFERENCES Observers(Observer_ID)
    FOREIGN KEY (Site) REFERENCES Sites(Site_ID)
    FOREIGN KEY (Plot) REFERENCES Plots(Plot_ID)
    FOREIGN KEY (Location) REFERENCES Locations(Location_ID)
)

-- Start the DB at the terminal: duckdb

CREATE TABLE ducks AS SELECT 3 As age, 'mandarin' AS breed;

SHOW TABLES;

FROM ducks SELECT *;