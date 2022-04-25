/*
When you query data, SQL does not provide any default order of rows in the query evaluation result.
To specify the order of the resulting rows, you should use the ORDER BY clause in the query.
*/


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

