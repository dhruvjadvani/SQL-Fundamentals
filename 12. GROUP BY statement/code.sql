--general form
SELECT
    stock_name, 
    MAX(price) AS maximum
FROM 
    stocks
GROUP BY
    stock_name;
 
 
 
SELECT
    stock_name,
    MIN(datetime) AS moment,
    MAX(price) AS maximum
FROM
    stocks
GROUP BY
    stock_name;
    



SELECT
    stock_name,
    datetime,
    MAX(price)
FROM
    stocks
GROUP BY
    stock_name,
    datetime;
    
 
 
SELECT
    stock_name,
    datetime,
    MAX(price) AS maximum
FROM
    stock
GROUP BY 
    stock_name,
    datetime
HAVING
    MAX(price) > 50;


SELECT column_name [, list_of_other_columns]
     , aggregation [, list_of_aggregations]
FROM table_name
[WHERE list_of_conditions]
GROUP BY column_name [, list_of_other_columns]
[HAVING list_of_aggregate_conditions]
[ORDER BY list_of_columns/aliases];

    

