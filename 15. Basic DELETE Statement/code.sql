--To delete all the data from the table but not the table itself, use a query with a DELETE FROM statement.
DELETE FROM books 
--As a result of the query execution we still have the table books, but it is empty now.
Delete selected rows
You can also use DELETE FROM statement to delete only selected rows from a table.


DELETE FROM table_name 


DELETE FROM table_name 
WHERE logical_expression

--Delete all records about Jane Smith from table guests.

DELETE FROM guests
WHERE name = 'Jane Smith';

--Delete all the movies which have been released after 1980 (including this year) and have rating less than 8.5.
DELETE FROM movies
WHERE year >= 1980 AND rating < 8.5;
