-- EXPORTING data form a database

-- The whole database

EXPORT DATABASE 'export_adsn';

-- One table
COPY Species TO 'species_test.csv' (HEADER, DELIMETER ',');

-- Specific query 
COPY (SELECT COUNT(*) FROM Species) TO 'species_count.csv' (HEADER, DELIMETER ',');