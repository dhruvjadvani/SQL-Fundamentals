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
    
    
 
