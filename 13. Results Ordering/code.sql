/*
When you query data, SQL does not provide any default order of rows in the query evaluation result.
To specify the order of the resulting rows, you should use the ORDER BY clause in the query.
*/

--By default, the order is assumed to be ascending, which is why we omitted the keyword ASC in the previous examples of queries.

SELECT
    hotel_id, 
    hotel_name, 
    price_per_night,
    price_for_early_check_in,
    rating, 
    stars
FROM 
    hotels
ORDER BY
    price_per_night 
;


--ou may sort the rows by expressions as well. For example, in the query below, we order hotels by price for two nights with an early check-in:
SELECT
    hotel_id, 
    hotel_name, 
    price_per_night,
    price_for_early_check_in,
    rating, 
    stars
FROM 
    hotels
ORDER BY
    price_per_night*2 + price_for_early_check_in
;



--Ascending and descending order
--Ascending means increasing 1 2 3 4 5 6...
--Decending means decreasing 5 4 3 2 1 
--The sorting is based on the definition of the comparison operator (<) for the expression type. 
--It can specify whether greater or smaller values should be placed higher in the list. Let's consider an example:

SELECT
    hotel_id, 
    hotel_name, 
    price_per_night,
    price_for_early_check_in,
    rating, 
    stars
FROM 
    hotels
ORDER BY
    rating DESC
;

--Multiple expressions
--Let's write a query that sorts hotels by both price and rating:

SELECT
    hotel_id, 
    hotel_name, 
    price_per_night,
    price_for_early_check_in,
    rating, 
    stars
FROM 
    hotels
ORDER BY
    rating DESC,
    price_per_night*2 + price_for_early_check_in 
;


/*Syntax
If you sort the resulting rows by an expression that defines a result attribute, you can address it in the ORDER BY clause by a column alias or number.
For example, in the query below, we sort rows by total price and rating:*/

SELECT
    hotel_name, 
    price_per_night*2 + price_for_early_check_in AS total_price,
    rating, 
    stars
FROM 
    hotels
ORDER BY
    total_price, 3 DESC
;



/*
--A table is defined by the following statement:

CREATE TABLE Titanic_passengers (
    passenger_id INTEGER,
    survived BOOLEAN,
    passenger_class INTEGER,
    first_name varchar(20),
    last_name varchar(20),
    is_male BOOLEAN,
    age INTEGER,
    sibsp INTEGER,
    parch INTEGER
);

Write a query that selects the following info about each passenger:

first_name;
last_name;
age;
passenger_class.
Sort the results by class with younger passengers at the beginning.

*/



SELECT 
    first_name,
    last_name,
    age,
    passenger_class
FROM 
   Titanic_passengers
ORDER BY  
    passenger_class ASC, age;
    
    
    
    
    
    
    
/*
A table is defined by the following statement:

CREATE TABLE hotels (
    hotel_name VARCHAR(100), 
    price_per_night DECIMAL(10,2),
    price_for_early_check_in DECIMAL(10,2),
    rating FLOAT, 
    stars INTEGER);
Write a query that selects all the hotels sorted by stars(lowest at the beginning), rating (poor at the end), and total price for 5 nights with early check-in (cheapest at the beginning).


*/



SELECT * FROM hotels
ORDER BY 
    stars ASC,
    rating DESC,
    price_per_night * 5 + price_for_early_check_in ASC;


/*
A table "Titanic_passengers" that stores info about the passengers of the Titanic has the following columns:

integer passenger_id
boolean survived
integer passenger_class
varchar(20) first_name
varchar(20) last_name
boolean is_male
integer age (in 1912)
integer sibsp (number of siblings/spouses aboard)
integer parch (number of parents/children aboard)
Write a query that selects all the info about each passenger. Sort the results by the number of relatives aboard (large families should go first).
*/

SELECT * FROM Titanic_passengers
ORDER BY 
    sibsp DESC,
    parch DESC;


