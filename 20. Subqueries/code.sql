/*
Typically, working with data, we need to use the results of one query execution in the second query. 
For example, we need to select the tuples where the value from one column is equal to the max value in another column.
We can do it with simple subqueries: select the max value and then write another subquery in which we simply hard code the max value.
Thankfully, SQL has a powerful tool to combine queries — subqueries.
*/

--Subqueries
/*
A subquery (also called inner or nested query) is a query within another SQL query (called main or outer query).
Subqueries can be nested within SELECT, UPDATE, INSERT, and DELETE statements.
*/

--Subqueries nested in SELECT statement
--In general, the SELECT query is formed in the following clause order:

[ WITH { [ XMLNAMESPACES ,] [ <common_table_expression> ] } ]

SELECT selected_list [ INTO new_table ]

[ FROM table_source ]

[ WHERE search_condition ]

[ GROUP BY group_expression ]

[ HAVING search_condition ]

[ ORDER BY order_expression [ ASC | DESC]
 
--Let's have a look at the following example.

--Table registered_users has two columns: username VARCHAR(30) and sign_up_date DATE:
/*
username	sign_up_date
timbrown	2012-12-04
awesometomas	2014-11-06
darlingKate	2012-12-04
frMartin	2014-07-03
We will use a query with a subquery nested into WHERE clause to select the first registered users:
*/
 
SELECT
    username,
    sign_up_date 
FROM
    registered_users 
WHERE
    sign_up_date = (
        SELECT 
            MIN(sign_up_date) 
        FROM 
            registered_users
    ); 
/*
 The result of the query will look as follows:

username	sign_up_date
timbrown	2012-12-04
darlingKate	2012-12-04
 
 */
 
 
 /*
 The subquery from the example above is a single row subquery.
 In this case, it is safe to use simple SQL comparison operators (=, >, <=, e.t.c.), because we can be sure that our query will return only one row with one column.

If we use a subquery along with comparison operators and our subquery returns more than one row, we will get an error.
 This doesn't mean that you can't use the multiple-row subquery that will return one or more rows, just use a multiple-row comparison operator, such as IN and ANY.
 */
 
 
