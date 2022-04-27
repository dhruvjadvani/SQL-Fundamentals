/*
Typically, we don’t just store data: we need it to reflect the current state of things in real life as closely as possible. 
One can get a promotion at work, so their title needs to be changed. 
You can buy a gift for your friend and the amount of money in your bank account has to be adjusted accordingly.
For cases like these, SQL has a special operation that helps to change values in cells of the already existing rows – UPDATE.
*/


--General form
--Name of a table where we want to change data, column name(s) where the data resides and an expression to calculate a new value for each specified column:
UPDATE table_name 
SET col1 = expr1, 
    col2 = expr2, 
    …, 
    colN = expr;




UPDATE employees  -- here employees is table name
SET department_id = 14;  -- will change department id for all the employees in employees table

UPDATE employees 
SET salary = salary + 10000;


--t’s possible to update multiple columns simultaneously, so we can achieve the same result using only one query instead of two:
UPDATE employees 
SET department_id = 14, 
    salary = salary + 10000;



UPDATE employees 
SET salary = floor(0.8 * upper_limit);


--Write a query that decreases values in an integer column "amount" by 40 in a table "governance".
UPDATE governance
SET amount = amount - 40;

--Write a query to add "The " article to all titles, decrease values in the "release_year" column by 1.

UPDATE movies
SET title = CONCAT('The ', title),
    release_year = release_year - 1;
    

    
