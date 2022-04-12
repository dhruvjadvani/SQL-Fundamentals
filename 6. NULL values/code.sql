--NULL is used in SQL to indicate that some data value is unknown or undefined. It should not be confused with a value of 00 or ''. 

/*A NULL value can be stored in a column of any type. 
However, a software engineer may use a NOT NULL constraint in create table statement to specify that a column should not store NULL values.*/

CREATE TABLE winners ( 
    year INTEGER NOT NULL,
    field VARCHAR(20) NOT NULL, 
    winner_name VARCHAR(100) NOT NULL, 
    winner_birth_year INTEGER);
