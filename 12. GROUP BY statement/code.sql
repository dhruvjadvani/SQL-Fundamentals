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
    
    
/*A fair question would be "why can't we utilize WHERE for the filtering"? The reason for that is the order of evaluation of the statements:

FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
All the conditions that you put in HAVING have to relate to aggregation functions. However, besides that there are no other special restrictions. */


SELECT column_name [, list_of_other_columns]
     , aggregation [, list_of_aggregations]
FROM table_name
[WHERE list_of_conditions]
GROUP BY column_name [, list_of_other_columns]
[HAVING list_of_aggregate_conditions]
[ORDER BY list_of_columns/aliases];

    

