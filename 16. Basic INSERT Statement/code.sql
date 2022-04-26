--Basic INSERT statement
--You can insert a new record into a table with a simple query using INSERT INTO statement.

--For example, let's add a record about a new customer into the table customers with columns name (VARCHAR(20)), surname (VARCHAR(20)), zip_code (INT) and city (VARCHAR(10)).

INSERT INTO customers (name, surname, zip_code, city) 
VALUES ('Bobby', 'Ray', 60601, 'Chicago');

/*
If you know the exact order of the columns in the table, you can use the shorter version of INSERT INTO query without specifying the column names.

In this case, our previous SQL query can be rewritten like this:
*/

INSERT INTO customers 
VALUES ('Bobby', 'Ray', 60601, 'Chicago');


--Insert multiple rows
/*If you want to insert multiple rows, you don't have to add them one by one: you can add multiple rows simultaneously.

Let's add two more rows to the table customers:
*/

INSERT INTO customers (name, surname, zip_code, city) 
VALUES ('Mary', 'West', 75201, 'Dallas'), 
       ('Steve', 'Palmer', 33107, 'Miami');
       

/*
Insert into specified columns
Sometimes you have to insert a record without any information. Assume we have an empty table cats with columns name (VARCHAR(20)), age (INT) and owner (VARCHAR(40)). None of these columns have a default value.

We want to add information about a three-year-old homeless cat Felix. Since Felix doesn't have an owner, we can skip this column in our INSERT INTO query.
*/

INSERT INTO cats (name, age) 
VALUES ('Felix', 3);


--Here is a template for a basic INSERT INTO statement:
INSERT INTO table_name (column_1, column_2,..., column_n)
VALUES (list_of_values_1) [, (list_of_values_2), ..., (list_of_values_m)];


--This notation means that one tuple of values is always necessary, others are optional.

--When you know the order of columns and want to insert values into all the columns, you can follow the shorter INSERT INTO statement template:
INSERT INTO table_name
VALUES (value_1, value_2,..., value_n);
