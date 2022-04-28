/*
Sometimes we need to modify our table: add a new column, drop the existing one or change the column type. 
We can create a new table with all these changes and delete the previous one, but it's easy to lose data during this process.
Luckily, SQL provides a statement that can modify the existing tables, ALTER TABLE statement. It can be used to create, delete or change the type of columns.
*/


--Adding a new column
/*
Imagine there is a new international company that has employees from around the world, and you're trying to help them keep their records. 
There is a table employees that looks as follows:

first_name	last_name	native_city
John          	Tomas	York
Lora	         Palmer	Tallinn
Davis	         Smith	New York

For now, the table doesn't store any contact information, but it would be great if we actually had everyone's contact emails.
We don't have a column for this information, so we need to add one.

You can add a new column to your table with a simple query using the ALTER TABLE statement with ADD COLUMN.

The following query will add the column employee_email to our table employees:
*/

ALTER TABLE employees 
ADD COLUMN employee_email VARCHAR(10);

/*
As you can see, we specify the column type in our query the same way as we do when creating a table with new columns. 
In our case, column employee_email will have the VARCHAR(10) data type.

After the query execution, our table has an empty column for contact emails:

first_name	   last_name native_city	 employee_email
John	           Tomas	York	
Lora	           Palmer	Tallinn	
Davis	           Smith	New York

*/

--Changing the data type
/*
We created the column employee_email with the VARCHAR(10) data type, but some people have very long emails like 'johntomasyork@emailservice.com'. 
This email will not fit the limit, so we won't be able to add it unless we change the data type of the column.

To change the data type, make a query with ALTER TABLE statement and MODIFY COLUMN:
*/

ALTER TABLE employees 
MODIFY COLUMN employee_email VARCHAR(45); 

/*
As a result of the query execution, column employee_email will have the VARCHAR(45) type. Now we can add long emails to our table:


first_name	last_name	native_city	employee_email
John	         Tomas	      York	johntomasyork@emailservice.com
Lora	        Palmer	   Tallinn	
Davis	        Smith	    New York


If you decide to change the column type, it should either be empty before the change, or the new data type must be compatible with the old one. 
Otherwise, you will get an error.
*/


--Dropping an existing column
/*
In our table employees, we have information about the native city. For the sake of conciseness, let's get rid of this column.

To drop this column from the table, use the following query with the ALTER TABLE statement and DROP COLUMN:
*/

ALTER TABLE employees 
DROP COLUMN native_city; 

/*
Once we have executed this query, our table employees will look as follows:

first_name	last_name	employee_email
John	         Tomas	johntomasyork@emailservice.com
Lora	        Palmer	
Davis	        Smith

Remember that this query deletes the column with all the information stored in it.
*/


--Renaming a column
/*
Speaking of conciseness, we can change the column name employee_email since it is clear that stored emails belong to employees.
Let's change the column name to email. You can do it with a simple query with the ALTER TABLE statement and CHANGE:
*/

ALTER TABLE employees
CHANGE employee_email email VARCHAR(45);

/*
Now our column with emails has a shorter name:

first_name	last_name	native_city	email
John	           Tomas	York	johntomasyork@emailservice.com
Lora	          Palmer	Tallinn	
Davis          	Smith	New York


As you can see, there is a type declaration in the query: if you want to change name and type, you can do it at the same time. 
Otherwise, just add the previous column type to the query as in the example above.
*/

--General forms
--To add a new column to the existing table, use this simple query template:

ALTER TABLE table_name
ADD COLUMN column_name DATATYPE; 

--The following query template can delete a column from the table:

ALTER TABLE table_name
DROP COLUMN column_name; 

--To change the column type, you can use this template:

ALTER TABLE table_name 
MODIFY COLUMN column_name NEWDATATYPE; 

--To change the column name (and, possibly, datatype), use the following template:

ALTER TABLE table_name
CHANGE old_column_name new_column_name NEWDATATYPE; 

--Types
--For the table students, change the type of the column personal_number from VARCHAR(20) to INT.

ALTER TABLE students 
MODIFY COLUMN personal_number INT;


























































