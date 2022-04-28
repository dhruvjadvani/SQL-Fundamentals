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



/*
UNIQUE constraint
The UNIQUE constraint will prohibit adding duplicate values to the column.
We know that the employee identifier should be unique, so we can add this constraint to the column personal_id.

If you want to add a UNIQUE constraint to the column when creating the table, you can specify it after column type declaration:
*/

CREATE TABLE employees (
    personal_id INT UNIQUE,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    age INT 
);


--We can add UNIQUE to an existing table with a simple query using ALTER TABLE ADD UNIQUE statement:
ALTER TABLE employees
ADD UNIQUE (personal_id);


--After the query execution, column personal_id becomes unique.
--If we already have duplicate values in this column, we will get an error, so check your table before adding this constraint.


--Sometimes we have to make more than one column unique. In this case, we can define a named constraint at the end of the CREATE TABLE statement:

CREATE TABLE employees (
    personal_id INT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    age INT, 
    CONSTRAINT uq_id_last_name UNIQUE (personal_id, last_name) 
);


--To drop a named constraint, you can also use ALTER TABLE DROP INDEX statement:
ALTER TABLE employees
DROP INDEX uq_id_last_name; 



/*
CHECK constraint
The CHECK constraint allows us to add a logical expression. For example, we can say that all our employees should be older than sixteen.
We can add the CHECK constraint in CREATE TABLE:
*/


CREATE TABLE employees (
    personal_id INT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    age INT CHECK (age > 16)
);


--If you want to add this constraint to an existing table, you can use the ALTER TABLE ADD CHECK statement. The syntax will be the same as with the UNIQUE constraint.
--To drop an unnamed CHECK, use ALTER TABLE DROP CHECK:

ALTER TABLE employees
DROP CHECK age; 


/*
The CHECK constraint can be named and assigned to multiple columns.
You can define a named CHECK constraint when creating a table like in the UNIQUE example above.
You can also use the ALTER TABLE ADD CONSTRAINT statement and add a named CHECK constraint for one or multiple columns to an existing table with the following query:
*/


ALTER TABLE employees 
ADD CONSTRAINT chk_employee CHECK (age > 16 AND personal_id > 0); 

/*
The ALTER TABLE ADD CONSTRAINT statement can be used to add both the CHECK constraint and a named UNIQUE constraint.

To delete a named CHECK constraint, you can use the ALTER TABLE DROP CHECK statement.
*/

/*
DEFAULT constraint
The DEFAULT constraint defines the initial value in a column: the value that will appear if you don't insert anything.
Let's define some default values in our table:
*/


CREATE TABLE employees (
    personal_id INT,
    first_name VARCHAR(30) DEFAULT 'John',
    last_name VARCHAR(30) DEFAULT 'Doe',
    age INT DEFAULT 17
);



--Now even if you add a new row with only personal_id, the columns first_name, last_name, and age will be defined as 'John', 'Doe', and 17 respectively.

--To add the DEFAULT constraint to an existing table, use the ALTER TABLE ALTER SET DEFAULT statement:

ALTER TABLE employees
ALTER first_name SET DEFAULT 'John';


--To delete an existing DEFAULT constraint, use the ALTER TABLE ALTER DROP DEFAULT statement:

ALTER TABLE employees 
ALTER first_name DROP DEFAULT;


--Combining constraints
/*
Obviously, a column can have more than one constraint. For example, 
it is useful to combine NOT NULL and DEFAULT constraints to avoid errors when adding some new information.

Let's re-create our table employees using all these useful constraints at the same time:
*/


CREATE TABLE employees (
    personal_id INT NOT NULL UNIQUE,
    first_name VARCHAR(30) NOT NULL DEFAULT 'John',
    last_name VARCHAR(30) NOT NULL DEFAULT 'Doe',
    age INT DEFAULT 17, 
    CHECK (age > 16) 
);































































































































