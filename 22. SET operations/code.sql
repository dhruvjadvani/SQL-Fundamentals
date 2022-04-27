/*
Occasionally, you may need to somehow combine the results of several queries that have the same structure (that is, the same order, number and types of columns), and return a result. 
In order to do that, you should use set operations.
*/

/*
Set operations
Set operations combine rows from the result sets of multiple SELECT statements.
There are multiple set operators, and all provide different ways to do it. In SQL, these are UNION, UNION ALL, INTERSECT, and EXCEPT or MINUS.

Note that these set operators can only be used if all SELECT statements have the same number of columns, all the corresponding columns have similar data types, and all columns are selected in the same order.
*/


/*
UNION
The UNION operator merges the results of two or more SELECT statements, and eliminates all duplicate rows.
*/

SELECT name FROM teachers 
UNION 
SELECT name FROM administrative_staff


/*
UNION ALL
The UNION ALL operator does almost the same thing as UNION but keeps all the duplicates.
*/

SELECT name FROM teachers 
UNION ALL
SELECT name FROM administrative_staff



/*
INTERSECT
The INTERSECT operator returns the records that are common for all component queries without the duplicates
*/

SELECT name FROM teachers
INTERSECT
SELECT name FROM administrative_staff


/*
MINUS or EXCEPT
The EXCEPT operator returns only those rows that belong to the first result set but not to the second one. It omits all the duplicates.
*/

SELECT name FROM teachers
EXCEPT
SELECT name FROM administrative_staff

/*
Here, we use the EXCEPT operator, but in some SQL dialects, the EXCEPT operator is called the MINUS operator,
so you can make the same query replacing EXCEPT with MINUS.
*/

/*
In queries with UNION, UNION ALL and INTERSECT, it doesn't matter in which order we put the component queries.

If we change the order of the component queries in a query with EXCEPT or MINUS, we also change the meaning of the query and the result set. In case of more than 2 queries, parentheses can be used to change the order in which operators must be executed.

The query below will return all the administrative workers who don't work as teachers:
*/

SELECT name FROM administrative_staff 
EXCEPT
SELECT name FROM teachers


--You can use this general template for a query with set operators:

SELECT 
    column_1_1, 
    column_1_2,
    ..., 
    column_1_n 
FROM 
     table_1 
[WHERE logical_expression]
SET_OPERATOR
SELECT 
    column_2_1,
    column_2_2,
    ...,
    column_2_n  
FROM table_2 
[WHERE logical_expression]
[SET_OPERATOR
...]























