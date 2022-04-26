/*When you build a database it is more convenient to store information in several tables. Indeed, it avoids redundancy, makes tables easier to maintain, and establishes the right connections between them.
Working on real projects, you will often need to use more than one table to get the information you want.

This is where JOINs come in. In theory, SQL join is a SQL (Structured Query Language) instruction to combine records from two tables based on a search condition.
Records are joined when the search condition evaluates to true. The resulting row consists of all the columns from both joined tables.
*/

/*
Types of JOINs
There are different types of JOINs in SQL:

[INNER] JOIN: for each record from the left table, 
all records from the right table that satisfy the merge condition will be merged with the original record and added to the resulting table.
If no matching records are found in the right table, the original record is also not added to the resulting table (using keyword INNER is optional).

LEFT/RIGHT JOIN: returns all the records from the left/right table and the matching values from the right/left table. 
If some records in one of the tables (for example, the left one) do not have a match in the other (for example, the right one) table, 
the corresponding columns in the output of this right table will be assigned NULLs.

FULL [OUTER] JOIN: returns all records when there is a match in either the left or the right table. 
Records that do not have a match are assigned NULLs (using keyword OUTER is optional).


CROSS JOIN: joins up every record from the left table and every record in the right table (the algorithm is illustrated in the picture bellow).
Note that we don’t specify the condition on which we join the two tables.


So id1 from table1 gets joined with idA, idB and idC, id2 also gets joined with idA, idB and idC and the same holds true for id3.
*/


/*
INNER JOIN
To see how different types of JOINs work, let's consider the following tables: character, pet and universe.

The character table has columns named character_id (INT), character_name (VARCHAR(30)), and universe_id (INT):

character_id	character_name	universe_id
1	             Harry Potter 	1
2	             Severus Snape	1
3	             Voldemort	    1
4	          Hermione Granger	1
5	          Tyrion Lannister	2
6	         Daenerys Targaryen	2
7	               Argus Filch	1
The pet table has columns named character_id (INT)and pet_species (VARCHAR(50)):

character_id	pet_species
1           	owl
3           	snake
4           	cat
6	            dragon "Drogo"
6	            dragon "Rhaegal"
6	            dragon "Viserion"
8	            puppy
9	            unicorn
The universe table has columns named universe_id (INT), universe_name (VARCHAR(30)), and author (VARCHAR(30)):

universe_id	universe_name	author
1	           Harry Potter	Joanne Rowling
2	          Game of Thrones	George R. R. Martin
*/
--The common syntax for INNER JOIN is the following:

SELECT table1.col_name1, table2.col_name2
FROM table1 [AS a]
INNER JOIN table2 [AS b]
    ON table1.id = table2.id;
    
 /*
Ordering results of INNER JOIN
Returning to our practical example, imagine you would like to know what pet belongs to what character. To do this, we need to execute the following query:
*/
SELECT character_name, pet_species 
FROM character 
INNER JOIN pet
    ON character.character_id = pet.character_id
ORDER BY character.character_name;
 

/*
The resulting table from this query will be the following:

character_name	    pet_species
Daenerys Targaryen	dragon "Drogo"
Daenerys Targaryen	dragon "Rhaegal"
Daenerys Targaryen	dragon "Viserion"
Harry Potter	    owl
Hermione Granger	cat
Voldemort	        snake


However, as you can see, not all characters were included in the result. 
This happened because some records in the left table didn’t have matches in the right table.
In our example not all characters had pets. To fix this problem and include all the characters in the resulting table,
we can use LEFT JOIN. We've combined information from two tables by matching rows where character_id was the same in the two tables.
*/
SELECT character_name, pet_species 
FROM character 
LEFT JOIN pet
    ON character.character_id = pet.character_id
ORDER BY character.character_name;



/*
character_name	pet_species
Argus Filch	NULL
Daenerys Targaryen	dragon "Drogo"
Daenerys Targaryen	dragon "Rhaegal"
Daenerys Targaryen	dragon "Viserion"
Harry Potter	owl
Hermione Granger	cat
Severus Snape	NULL
Tyrion Lannister	NULL
Voldemort	snake
*/


/*
So far we've worked only with two tables, but we can also join together multiple tables. 
For example, we also want to know which universe our characters come from. As you can see, 
values that didn’t have matches in the right table were assigned with NULL values.
*/
SELECT c.character_name, p.pet_species, u.universe_name 
FROM universe AS u
LEFT JOIN character as c
    ON u.universe_id = c.universe_id
LEFT JOIN pet AS p
    ON p.character_id = c.character_id
    
/*
character_name	    pet_species	       universe_name
Harry Potter	     owl	           Harry Potter
Severus Snape	     NULL	           Harry Potter
Voldemort	         snake	           Harry Potter
Hermione Granger	 cat	           Harry Potter
Tyrion Lannister	 NULL	           Game of Thrones
Daenerys Targaryen	dragon "Drogo"	   Game of Thrones
Daenerys Targaryen	dragon "Rhaegal"   Game of Thrones
Daenerys Targaryen	dragon "Viserion"  Game of Thrones
Argus Filch	NULL	Harry Potter

*/

/*
We should also mention that it is not mandatory to use JOIN if you want to connect tables.
You can use the WHERE condition to get the same result. Please consider the script below. It would give an identical result to the one above:
*/
SELECT table1.col_name1, table2.col_name2
FROM table1 [AS a], table2 [AS b]
    WHERE table1.id = table2.id;
    

--To join multiple tables, follow this general template:

SELECT val1 [AS name1], ..., valN [AS nameN]
FROM table1 
[type_of_join] JOIN  table2 
    ON table1.col_name_table1 = table2.col_name_table2
[type_of_join] JOIN table3
    ON table2.col_name_table2 = table3.col_name_table3;
    




/*
Books in a library database
You need to create a database for a library. There are two tables in it:

books (id INT, title VARCHAR(40), author_id INT)
authors (id INT, name VARCHAR(40))
Write a query that returns the titles of all the books written by 'Isaac Asimov'.

Note, that for simplicity every book has only one author here. In a real situation, a book may have several authors.

*/

SELECT books.title as titles
FROM books
INNER JOIN authors
    ON books.author_id = authors.id
WHERE authors.name = 'Isaac Asimov';


/*
Online orders
There is an online store where people can order some groceries. It has a database consisting of three tables that contain all the data about the orders:

users (id INT, email VARCHAR(50))
groceries (id INT, name VARCHAR(50))
orders (user_id INT, grocery_id INT)
Write a query that returns all groceries (name) ordered by a particular user (email). The order of rows is not important.

email	        name
john@gmail.com	milk
user@gmail.com	milk
vikki@gmail.com	cheese
user@gmail.com	cheese
vikki@gmail.com	soda
*/

SELECT users.email as email, groceries.name 
FROM users
INNER JOIN orders
    ON users.id = orders.user_id
INNER JOIN groceries
    ON orders.grocery_id = groceries.id;




--Movies database
/*
Suppose you need to create a database for all the movies and their reviews (like IMDB).

In this database, the movies table contains some information about the movies (id: INT, title: VARCHAR(40)), and the reviews table contains anonymous movie reviews: reviews (movie_id: INT, score: INT, feedback: VARCHAR(1000)). The score is a value from 1 to 10.

Write a query that returns pairs of movie names and scores (title, score) for all the movies that have at least one review. The result should be ordered alphabetically by the names, and the scores should be in ascending order.

Here is an example output:

title	score
Forrest Gump	8
Forrest Gump	10
Interstellar	9
Seven Samurai	5
Seven Samurai	7
Seven Samurai	10

*/

SELECT movies.title AS title, reviews.score AS score
FROM movies
INNER JOIN reviews
    ON movies.id = reviews.movie_id
ORDER BY title, score ASC;
