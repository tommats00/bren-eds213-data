-- Part 1:
-- Explain exactly how Little Bobby Tables’ “name” can cause a catastrophe. Explain why his name has two hyphens (--) at the end.

-- Given the query as follows:
-- SELECT * FROM Students WHERE (name = '%s' AND...);

-- If Bobby tables name is 'Robert'); DROP TABLE Students;--
-- Then the query will end the statement after the first semicolon and continue to the second statement where they drop all tables. 
-- This is because there is a ' that will end the string. 
-- The two hyphens at the end will comment out the rest of the code.

-- Part 2:
-- Suppose instead the school system executed the query
-- SELECT * FROM Students WHERE name = '%s'

-- What would Bobby Table's name have to be to destroy things?
-- I think the name would be very similar. It would still contain the ' to end the string and execute the drop statement. 
-- Something like Robert'; DROP TABLE Students;--