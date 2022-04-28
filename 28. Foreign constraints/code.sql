/*
You already know how to create a primary key and how to create a database with several tables in it.
If you want to create a truly powerful database, you should know how to link the tables together.

Let's consider an example: we want to store information about employees and work departments.
We can create one table with all data, but if we open a new department and don't hire anyone for it immediately, 
how would we store information about it? It is easier if we create two different tables: one with employees and one with departments.
Here, we face another challenge: how to connect data in these tables? 
How to avoid problems if we add an employee with a non-existing department name? 
In this topic, you will learn how to use the foreign key constraint to connect two tables and manage the data stored there.
*/


--FOREIGN KEY constraint
--Note that the FOREIGN KEY constraints can only reference tables within the same database


/*
To mark a field or a group of fields as a foreign key, we can use the FOREIGN KEY constraint and create the table employees. In the query,
keyword REFERENCES specifies the table and the primary key column or columns (in parentheses) with unique values that the foreign key points to. 
The structure and data type of the primary key and the foreign key must be the same. The table that the foreign key points to is called referenced or parent table. 
Here is what the query will look like:
*/


CREATE TABLE employees (
    employee_id int PRIMARY KEY,
    name VARCHAR(60) NOT NULL, 
    department_id INT,
    CONSTRAINT fk_department FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
); 
--After the query execution, the table employees becomes a child table, that is, a table containing the foreign key.



/*
With the query above, we created a named foreign key. 
It is good practice to use only named foreign keys because in some SQL dialects (including MySQL),
unnamed foreign keys may cause trouble in the future. However, you can still create a table with an unnamed foreign key:
*/

CREATE TABLE employees (
    employee_id int PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);





















