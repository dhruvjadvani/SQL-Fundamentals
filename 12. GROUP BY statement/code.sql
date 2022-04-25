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

    


--Write a grouping query for table tutors that for each tutor returns their name and minimum group capacity. Exclude minimums that equal to or below 30. Do not apply any ordering.

CREATE TABLE tutors (
  group_id INTEGER,
  tutor_name VARCHAR(15),
  course VARCHAR(50),
  capacity INTEGER
);

INSERT INTO tutors (group_id, tutor_name, course, capacity) VALUES
(12,	"Donald Meier",	"Algebra 101",	50),
(14,	"Becky Stout",	"Nuclear Physics 101",	25),
(22,	"Laura Gibbs",	"Renaissance literature 360",	30),
(36,	"Donald Meier",	"Algebra 301",	40),
(23,	"Becky Stout",	"Information retrieval 450",	30),
(38,	"Laura Gibbs",	"Renaissance literature 360",	40);


--ans:
SELECT tutor_name, min(capacity)
FROM tutors
GROUP BY tutor_name
HAVING min(capacity) > 30;






/*Table racing stores information about racers attempting different segments of a racing track.

racer_id	attempt_id	segment_id	time
87	10	2	12.057
14	8	1	13.003
14	9	1	13.001
22	2	2	12.870
87	12	3	25.156
56	1	1	12.897
56	2	2	11.994
22	4	2	12.908
14	10	2	13.007
14	11	1	12.997
87	13	3	25.422
For every racer and segment find minimum time. Apply ordering starting from fastest attempts.*/

SELECT distinct racer_id as racer , segment_id as segment , MIN(time) as "minimum time"
FROM racing
GROUP BY racer_id, segment_id
order by min(time);



/*
In this task, you need to write a query that computes average budget and average box office for every year presented in table movies.
Sort the result by year in ascending order.

title	release_year	budget	box_office
The Aviator	2004	110	121
The Big Short	2015	28	133
The Legend of Tarzan	2016	180	356
Spotlight	2015	20	98
Ex Machina	2015	10	36
The Shape of Water	2017	19	195
The Accountant	2016	44	155
*/


SELECT release_year, avg(budget) as avg_budget, avg(box_office) as avg_box_office
from movies
group by release_year
order by release_year asc;
