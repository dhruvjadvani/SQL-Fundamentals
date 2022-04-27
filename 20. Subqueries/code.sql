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
 
 SELECT *, 
    (SELECT 
         name 
     FROM 
         users_info 
     WHERE 
         username = registered_users.username) AS name 
FROM
    registered_users
 
 
 
 
 SELECT 
    id,
    product 
FROM
    new_orders newor 
WHERE unit_price < (
    SELECT 
        AVG(unit_price) 
    FROM 
        new_orders
    WHERE 
        product_category = newor.product_category);
 
 
 
 
 --Subqueries nested in the UPDATE statement
 UPDATE
    students 
SET
    exams_passed = TRUE 
WHERE 
    name in (
        SELECT
            name
        FROM
            exam_results 
        WHERE
            math_exam_mark >= 18
            AND english_exam_mark >= 18
        ); 
 
 
 
 UPDATE
    students 
SET
    scholarship = (
        SELECT 
            MIN(scholarship)
        FROM students
    ) 
WHERE
    exam_passed = FALSE; 
 
 
 
 --Subqueries nested in the INSERT statement
 INSERT INTO employees 
VALUES (
    'Tomas Hedwig', 
    (SELECT salary FROM employees WHERE name = 'Ann Reed'), 
    (SELECT id FROM departments WHERE department = 'PR')
)
 
 
 
 
 DELETE FROM orders
WHERE customer_id = (SELECT customer_id FROM customers WHERE name = 'Ann Smith')
 
--New student
-- Add to the new_students table a student named Carol Tomas who is in the same grade as Anna Phillips. Table students looks as follows:
/*
name	        grade
Anna Phillips	2
Tom Basil	    3
Nancy Smith	  6
 
 Table new_students has the same columns name and grade.

Use a query with a subquery for this task!

Hint: Do not use aliases when making a request. Such a request is difficult to verify.

Hint: Don't forget to add spaces to the query when specifying the meaning of the names.
 For example, name = 'Anna Phillips' is correct while name='Anna Phillips' is not.

Hint: Do not forget the SELECT query clause order, you can check it in the corresponding topic section.
*/

 
 INSERT INTO new_students (name, grade)
VALUES ('Carol Tomas', 
       (SELECT grade from students WHERE name = "Anna Phillips")
       );
 
 
 --The oldest one
 /*
 elect all rows from the persons table with the maximum age.

first_name	last_name	age
Lucy           	Maud	35
Tom	         Edwards	27
Ann	      Montgomery	30
Janis           	Lyn	35
 
*/
 
 SELECT * FROM persons
WHERE age = (SELECT MAX(age) FROM persons);
 
 
 
/*
 Henry Richards received some dividends. Select the sum of his dividends accrual using the two following tables: stockholders and dividends.

The stockholders table has columns id(INT), name(VARCHAR(20)):

id	name
1	Henry Richards
2	Anna Romanoff
3	Tom Cavil
 
The dividends table has columns accrual(INT), stockholder_id(INT):

accrual	stockholder_id
500      	1
34	       3
6	        1
Use a query with a subquery for this task!

Hint: Do not use aliases when making a request. Such a request is difficult to verify.

Hint: Don't forget to add spaces to the query when specifying the meaning of the names.
 For example, name = 'Henry Richards' is correct while name='Henry Richards' is not.

Hint: Do not forget the SELECT query clause order, you can check it in the corresponding topic section.
 
 */
 
 SELECT SUM(accrual) FROM dividends
WHERE
    stockholder_id = (SELECT id FROM stockholders where name = "Henry Richards");
 
 
 --Passed exam
 /*
 Delete from the students table all the students who got less than the average percentage of correct answers during the exam.

students

id	name
1	Anne Boleyn
2	Tom King
3	Harley Jones
4	Ben Sparrow
exam_results

student_id	percentage
1	100
2	90
3	45
4	34
Hint: To check if the value is in the set of results you can use SQL IN operator, for example:

WHERE value IN (SELECT value FROM table)
Hint: Do not forget the SELECT query clause order, you can check it in the corresponding topic section.

*/
 
 
 DELETE FROM students
WHERE id in (SELECT student_id FROM exam_results AS er WHERE percentage < (SELECT AVG(percentage) FROM exam_results))
 
 
 
 
 
