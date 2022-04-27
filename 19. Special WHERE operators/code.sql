/*
BETWEEN operator
The BETWEEN operator in WHERE clause selects values that are within the given range. The range is set by the minimum and maximum values and can include dates, numbers, or text data. 
The BETWEEN operator is inclusive, so the minimum and maximum values are included in the range.

Let's select products with a price greater than or equal to 8 and less than or equal to 13 from the table products given below.

product	price
milk	10
tofu	15
pasta	12
bread	8
*/
SELECT
    product 
FROM
    products 
WHERE 
    price BETWEEN 8 AND 13; 
/*    
The result set of the query above will have three rows:

product
milk
pasta
bread
*/

