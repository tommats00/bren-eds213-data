-- Create Crop Yield Table
CREATE TABLE Crop_yield(
    country VARCHAR NOT NULL,
    item VARCHAR NOT NULL,
    item_code_cpc INTEGER NOT NULL,
    element VARCHAR NOT NULL,
    element_code INTEGER NOT NULL,
    year INTEGER NOT NULL,
    unit VARCHAR NOT NULL,
    value REAL,
    flag_description VARCHAR NOT NULL,
    flag VARCHAR NOT NULL,
    domain VARCHAR NOT NULL,
    domain_code VARCHAR NOT NULL,
    unique_id INTEGER NOT NULL,
    PRIMARY KEY (unique_id)
);

CREATE TABLE Crop_calendar(
    data_id INTEGER NOT NULL,
    country VARCHAR NOT NULL,
    crop VARCHAR NOT NULL,
    plant_start INTEGER CHECK (plant_start BETWEEN 1 AND 365),
    plant_end INTEGER CHECK (plant_end BETWEEN 1 AND 365),
    plant_range INTEGER CHECK (plant_range BETWEEN 1 AND 365),
    harvest_start INTEGER CHECK (harvest_start BETWEEN 1 AND 365),
    harvest_end INTEGER CHECK (harvest_end BETWEEN 1 AND 365),
    harvest_range INTEGER CHECK (harvest_range BETWEEN 1 AND 365),
    temp_average REAL,
    precip_average REAL, 
    PRIMARY KEY (data_id)
);

COPY Crop_yield FROM "../data/crop_yield_cleaned.csv" (header TRUE, nullstr "NA");

COPY Crop_calendar FROM "../data/crop_cal_cleaned.csv";


-- Try reading in directly
CREATE TABLE Crop_yield_2 AS
    SELECT * FROM read_csv("../data/crop_yield_cleaned.csv"); 

CREATE TABLE Crop_calendar_2 AS
    SELECT * FROM read_csv("../data/crop_cal_cleaned.csv");

SELECT * FROM Crop_yield_2 
    LIMIT 5;

SELECT * FROM Crop_calendar_2
    LIMIT 5;