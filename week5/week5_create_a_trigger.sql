-- Part 1: Inserting Information

-- Create a trigger that will fire an UPDATE statement that will fill in a value for Egg_num in 

-- View the row
SELECT * FROM Bird_eggs WHERE Nest_ID = '14eabaage01';

-- Insert NULLs into Bird_eggs
INSERT INTO Bird_eggs
    (Book_page, Year, Site, Nest_ID, Length, Width)
    VALUES ('b14.6', 2014, 'eaba', '14eabaage01', 12.34, 56.78);

-- View the new row in the table
.nullvalue -NULL-
SELECT * FROM Bird_eggs WHERE Nest_ID = '14eabaage01';

-- Create a trigger with an UPDATE statement that will fill in a value for Egg_num
CREATE TRIGGER egg_filler
AFTER INSERT ON Bird_eggs
FOR EACH ROW
BEGIN 
    UPDATE Bird_eggs
    SET Egg_num = (
        SELECT IFNULL(MAX(b.Egg_num), 0) + 1
        FROM Bird_eggs AS b
        WHERE b.Nest_ID = NEW.Nest_ID AND b.Egg_num IS NOT NULL
    )
    WHERE Nest_ID = NEW.Nest_ID AND Egg_num IS NULL;
END;

-- Test trigger with two insert statements
INSERT INTO Bird_eggs
    (Book_page, Year, Site, Nest_ID, Length, Width)
    VALUES ('b14.6', 2014, 'eaba', '14eabaage01', 12.34, 56.78);

INSERT INTO Bird_eggs
    (Book_page, Year, Site, Nest_ID, Length, Width)
    VALUES ('b14.6', 2014, 'eaba', '14eabaage01', 11.22, 54.89);


-- Part 2
-- Automatically fill in information for Book_page, Year, and Site

-- Delete previous trigger since we are adding more to it
DROP TRIGGER egg_filler;

-- Create new trigger with other information
CREATE TRIGGER egg_filler
AFTER INSERT ON Bird_eggs
FOR EACH ROW
BEGIN 
    UPDATE Bird_eggs
    SET 
        Egg_num = (
            SELECT IFNULL(MAX(b.Egg_num), 0) + 1
            FROM Bird_eggs AS b
            WHERE b.Nest_ID = NEW.Nest_ID AND b.Egg_num IS NOT NULL
        ),
        Book_page = (
            SELECT Book_page
            FROM Bird_eggs
            WHERE Nest_ID = new.Nest_ID AND Book_page IS NOT NULL LIMIT 1
        ),
        Year = (
            SELECT Year 
            FROM Bird_eggs
            WHERE Nest_ID = new.Nest_id AND Year IS NOT NULL Limit 1
        ),
        Site = (
            SELECT Site
            FROM Bird_eggs
            WHERE Nest_ID = new.Nest_ID AND Site IS NOT NULL LIMIT 1
        )
    WHERE Nest_ID = NEW.Nest_ID AND Egg_num IS NULL;
END;

-- Test trigger
INSERT INTO Bird_eggs
    (Nest_ID, Length, Width)
    VALUES ('14eabaage01', 12.11, 56.24);

-- View 
SELECT * FROM Bird_eggs WHERE Nest_ID = '14eabaage01';

-- Part 3
