-- Working with the following query
SELECT Nest_ID
    FROM Bird_nests
    WHERE Site = 'nome' AND
          Species = 'ruff' AND
          Year = 1983 AND
          Observer = 'cbishop' AND
          ageMethod = 'float';


-- Part 1: Answer the following questions.

-- Is there already an index on the Bird_nests table? If so, what is that index and will SQLite use it in the above query? Why or why not?
-- There isn't a designated index in place, but SQL creates an auto index of the primary key 
-- I checked if an index was in place using the following: 
PRAGMA index_list('Bird_Nests');

-- We can now figure out what the primary key is from using the following: 
PRAGMA table_info('Bird_Nests');
-- Primary Key: Nest_ID

-- Will adding an index on a column not mentioned in the WHERE clause be used by the database? Why or why not?
-- No, SQL will not index columns that are not included within the query. It is unnecessary since we don't care about them given the query. 

-- Part 2:
