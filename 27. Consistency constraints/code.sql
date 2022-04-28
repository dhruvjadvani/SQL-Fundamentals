/*
Each column in the table has a specific data type, 
so it's impossible to insert text into a column with the INT type or a decimal number into a column with the BOOLEAN type data.
Data type restrictions help us avoid a lot of mistakes, but sometimes these restrictions can be very specific.
For example, all personal ID numbers should be unique, or customers have to be adults. These specific restrictions on the values in columns are called constraints.
*/


--Example
--The most common constraints are NOT NULL, UNIQUE, CHECK, DEFAULT, PRIMARY KEY, and FOREIGN KEY.

/*
Let's take a simple life situation as an example. Assume that we've created a table employees with columns personal_id, first_name, last_name, and age with this simple SQL query:
*/

CREATE TABLE employees (
    personal_id INT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    age INT
);


--Let's modify this simple table and add some constraints to it.

/*
NOT NULL constraint
The NOT NULL constraint will not allow adding a null value to a column. In our table employees, we can make the age column a not null one.

To add the NOT NULL constraint, use ALTER TABLE MODIFY statement:
*/

ALTER TABLE employees
MODIFY age INT NOT NULL;

/*
With this SQL query, it won't be possible to add a new employee to the table without stating their age. If we already have NULL values in the age column, 
we will get an error.

To remove this constraint, just use ALTER TABLE MODIFY again without the NOT NULL attribute:
*/


ALTER TABLE employees
MODIFY age INT;

--You can also use this constraint in the CREATE TABLE statement. Just add it to the end of the column type declaration:

CREATE TABLE employees (
    personal_id INT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    age INT NOT NULL
);





















































































































