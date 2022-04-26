--To delete all the data from the table but not the table itself, use a query with a DELETE FROM statement.
DELETE FROM books 
--As a result of the query execution we still have the table books, but it is empty now.
Delete selected rows
You can also use DELETE FROM statement to delete only selected rows from a table.


DELETE FROM table_name 


DELETE FROM table_name 
WHERE logical_expression

