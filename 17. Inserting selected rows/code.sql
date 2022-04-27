/*
When working with data, you may face a challenge of copying it from one table to another: for example, 
if you want to get rid of some table customers and copy all its data to a new table users. Of course, you can do it manually using simple INSERT INTO queries,
but that may result in typos or even data loss.
To make the transfer process safer, you can combine two simple statements: INSERT INTO and SELECT.
*/
/*
customer	                 email	zip_code
Astoria hotel	hotelastoria@hotel.com	99501
Pasta Inc             	pasta@inc.com	85055

We have a new table users with columns user VARCHAR(40), user_email VARCHAR(50), zip_code INT and city VARCHAR(20), that already has one pre-existing row:

user	user_email	zip_code	city
Tadfield Cinema	tadf@cinema.com	56567	Tadfield
*/

INSERT INTO users (user, user_email, zip_code) 
SELECT * FROM customers; 

/*
When we execute this query, our table users will look as following:

user	              user_email	     zip_code	city
Tadfield Cinema	tadf@cinema.com	     56567	Tadfield
Astoria hotel	hotelastoria@hotel.com	99501	NULL
Pasta Inc	              pasta@inc.com	85055	NULL
*/


/*
INSERT INTO SELECT with WHERE
When we use the INSERT INTO SELECT statement, we can use WHERE in the nested SELECT query.

Now let's add information from the table suppliers with columns supplier VARCHAR(40), city VARCHAR(20), supplier_email VARCHAR(45) and zip_code INT:

supplier	  city	supplier_email	ZIP_code
Tomato Inc	York	tomato@inc.uk	  01904
Potato Inc	London	potato@inc.uk	53342


Say we need to add only the information about Tomato Inc:
*/

INSERT INTO users
SELECT 
    supplier, 
    supplier_email,
    zip_code,
    city 
FROM 
    suppliers
WHERE
    supplier = 'Tomato Inc'; 
    
/*
Here we should reorder columns in the SELECT statement or the INSERT INTO statement because the order of columns doesn't match.

After the query execution we will have a new row in the table users:

user	             user_email	       zip_code	  city
Tadfield Cinema	tadf@cinema.com	      56567	  Tadfield
Astoria hotel	hotelastoria@hotel.com	99501	  NULL
Pasta Inc	    pasta@inc.com	          85055   NULL
Tomato Inc	  tomato@inc.uk	          01904	  York

Notice that here the types of columns user_email and supplier_email aren't the same: VARCHAR(50) for user_email and VARCHAR(45) for supplier_email. 
We can transfer data because these types are compatible, so remember to check whether the types are compatible in your case, because if not, you can get an error.
*/

--to transfer data from one table to another, use this query template:

INSERT INTO table1 (column_1, column_2, ..., column_n)
SELECT 
    column_1,
    column_2,
    ...,
    column_n 
FROM 
    table2
WHERE 
    condition; 


--Orders
/*Copy all data from the table new_orders with columns order_no INT, customer VARCHAR(40) and city VARCHAR(40):

order_no	customer	city
47546	  Frank Smith	Tadfield

to the table orders (to columns order_no INT, customer VARCHAR(40) and city VARCHAR(40) respectively):

order_no	customer	city	priority
46568	   Tom Rogers	Redfield	1

*/

INSERT INTO orders(order_no, customer, city)
SELECT * FROM new_orders;


--New job
/*
Copy the data about John Marley from the table sellers:

name	surname	seller_email
Tom	     Smith	tomsmith@sale.uk
John	Marley	johnmarley@sale.uk

to the table managers:

name	surname	manager_email
Ann	     Tomas	anntomas@sale.uk
You should copy name VARCHAR(20), surname VARCHAR(20) and seller_email VARCHAR(40) to name VARCHAR(20), surname VARCHAR(20) and manager_email VARCHAR(50) respectively.
*/

INSERT INTO managers(name, surname, manager_email)
SELECT * FROM sellers
WHERE name = 'John' && surname = 'Marley';


--Only names
/*
Copy only the names of developers from the table developers with columns name VARCHAR(20), surname VARCHAR(15) and position VARCHAR(40):

name	surname	position
Tamara	Chavez	middle developer
Nikolay	Zimin	junior developer
to the table employees with columns last_name VARCHAR(20), first_name VARCHAR(20) and department VARCHAR(40):

last_name	first_name	department
Chris	       Tomas	HR
You should copy data from surname to last_name and from name to first_name.
*/

INSERT INTO employees(first_name, last_name)
SELECT name, surname FROM developers;


