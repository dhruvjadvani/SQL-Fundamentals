/*
Sometimes we need to be sure that all the rows in our table are unique. 
For example, we want to store information about the conference participants: their name, email, date of birth, and city; 
we want to make sure that no one is registered twice. In this case, we should find a combination of data that is unique for each participant. 
Maybe some people will have the same name, but they surely won't share the same personal email, so we can use this field as a unique key to prevent creating duplicates.
This unique key is commonly called a primary key.
*/


--PRIMARY KEY constraint
/*
The PRIMARY KEY constraint specifies a set of columns with values that can help identify any table record
This constraint can be specified in the process of creating a table. Let's create a table named chefs with columns chef_id INT, first_name VARCHAR(20) and last_name VARCHAR(20). 
We assume that all chefs have individual identifiers, so we will make our chef_id column the primary key:
*/

CREATE TABLE chefs (
    chef_id INT PRIMARY KEY, 
    first_name VARCHAR(20), 
    last_name VARCHAR(20)
);




/*
ince the primary key has to identify each table row, it must be unique and can not be null.

Another important thing is that a table can have one and only one primary key, but it is allowed to include multiple columns in it.

For example, consider the employees table with columns department_id INT NOT NULL, employee_id INT NOT NULL,
and name VARCHAR(50) NOT NULL. 
We assume that it's possible to have two employees with identical identifiers across different departments,
but it is impossible to have several employees with identical id's in a single department.
So, we can have tuples (42, 15, 'Ann Brown') and (43, 15, 'Bob Freud') in the table, but we cannot add a tuple (42, 15, 'John Smith') to that table since there already is an Ann Brown.

In this case, we can define a named PRIMARY KEY constraint on multiple columns when we create the employee table:
*/

CREATE TABLE employees (
    department_id INT NOT NULL,
    employee_id INT NOT NULL,
    name varchar(50) NOT NULL,
    CONSTRAINT pk_employee PRIMARY KEY (department_id,employee_id)
);



--The syntax from the query above can also be used to create a named PRIMARY KEY constraint on one column.

--Add PRIMARY KEY to an existing table
--If we already have a table without a primary key, we can add it using the ALTER TABLE statement.
--Assume that we have a table named countries that was created as follows:

CREATE TABLE countries (
    country_name VARCHAR(40) NOT NULL UNIQUE, 
    population INT CHECK (population > 0), 
    area REAL NOT NULL 
); 



/*
We want to make the column country_name our primary key.

To add an unnamed PRIMARY KEY constraint to the column country_name, we use the ALTER TABLE ADD PRIMARY KEY statement:
*/

ALTER TABLE countries
ADD PRIMARY KEY (country_name); 

/*
The column country_name is already unique and cannot contain null values, so it is safe to make it a primary key of the table countries.


Be careful when adding this constraint to a non-empty table: we will get an error if we already have duplicate or null values in the potential primary key.
*/


/*
We can also add a named PRIMARY KEY constraint to an existing table using the ALTER TABLE ADD CONSTRAINT statement. 
Let's define a PRIMARY KEY constraint on multiple columns for a table students. This table has columns name VARCHAR(60), birth_date DATE, and department VARCHAR(40).

The query below will add a primary key pk_student. This primary key will have two columns: name and birth_date:
*/

ALTER TABLE students
ADD CONSTRAINT pk_student PRIMARY KEY (name,birth_date); 


--Drop PRIMARY KEY
/*
Another thing that we need to be able to do is to delete a primary key from a table. Let's delete the primary key pk_student from the table students.

To drop the PRIMARY KEY, use ALTER TABLE DROP PRIMARY KEY:
*/

ALTER TABLE students
DROP PRIMARY KEY;


--Since a table can have only one primary key, we don't have to specify the constraint name.

--Every manager is special
/*
Create a named primary key pk_manager on the columns first_name and last_name of the table managers. The columns first_name and last_name are UNIQUE and NOT NULL.
*/

ALTER TABLE managers
ADD CONSTRAINT pk_manager PRIMARY KEY (first_name, last_name);

--No more keys
--Drop the primary key pk_schoolchild from the table schoolkids. The primary key pk_schoolchild was defined on the columns name and birthdate.

ALTER TABLE schoolkids
DROP PRIMARY KEY;


--Company clients
--Create an unnamed primary key on the client_id column of the table clients. The column client_id is UNIQUE and NOT NULL.

ALTER TABLE clients
ADD PRIMARY KEY (client_id);



























































