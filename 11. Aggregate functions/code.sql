SELECT AGG_FUNCTION(column_name)
FROM table_name;

/*
Vendors of different SQL-compatible database management systems provide their users with slightly different sets of aggregate functions. 
Here is a list of aggregate functions according to the ANSI SQL standard:

MIN
MAX
AVG
COUNT
SUM
*/

SELECT MAX(price)
FROM stocks;

SELECT SUM(yesterday_deals)
FROM stocks;


SELECT 
    AVG(price) AS avg_price,
    AVG(yesterday_deals) AS avg_deals 
FROM 
    stocks 
WHERE 
    price > 40;
    
    
    
    
--When working with large amounts of data, you might be interested in omitting all duplicate values.
--To do that, place the DISTINCT keyword inside the brackets of your aggregate function:    

SELECT COUNT(DISTINCT yesterday_deals)
FROM stocks;    


/*
A regular call of the COUNT function with a column name as an argument will simply count the total amount of values in the column. 
If you call COUNT with an asterisk, then you're telling the function to count all rows that exist in the table.
The final result won't be affected by the particular types of columns or the values that their cells store.*/

--All aggregate functions except COUNT(*) ignore the NULL values.

COUNT(*)


SELECT MAX(current_location) FROM agents;
