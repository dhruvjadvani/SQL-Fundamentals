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

