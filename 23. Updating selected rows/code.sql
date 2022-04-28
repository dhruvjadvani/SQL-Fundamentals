--general template of an update statement
UPDATE table_name 
SET 
    col1 = expr1, 
    col2 = expr2, 
    …, 
    colN = expr 
WHERE 
    logical_expression;
    
/*
WHERE clause
As usual, a logical expression in the WHERE clause can be a combination of several simple expressions. 
The only requirement is the following: an expression must produce a BOOLEAN value for each row of a table. 
Only those rows for which the expression produces TRUE will be updated.
*/

UPDATE groups 
SET capacity = 40 
WHERE 
    LOCATE('Algebra', course) > 0 
    OR tutor = 'Laura Gibbs'




--Write an update query for the table stadiums so that Nike is a sponsor of all stadiums the capacity of which exceeds 76000 people.


UPDATE stadiums
SET
    sponsor = 'Nike'
WHERE 
    capacity > 76000;
    

--Streets
--In the table streets you can see information about a few streets in Yeovil Town:
/*Apparently, the length of Water Sports Arena street needs to be doubled and it shouldn't be a one-way street anymore. 
The administration has also decided to add two crossings and one bus stop there. Write a query to reflect all these changes. 
Note that is_one_way column has BOOLEAN type.
*/

UPDATE streets
SET 
    is_one_way = FALSE,
    length = 2 * length,
    crossings = crossings + 2,
    bus_stops = bus_stops + 1
WHERE 
    street_name = 'Water Sports Arena';
    



















