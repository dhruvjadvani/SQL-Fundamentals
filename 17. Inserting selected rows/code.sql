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


