SELECT *
FROM table
WHERE conditions

SELECT id, title, rating
FROM books
WHERE author = 'Charles Dickens';



SELECT *
FROM products
WHERE price > 250

/*
=	equality check
<, >	less, greater
<=, >=	less or equal, greater or equal
<>, !=	not equal
*/

SELECT *
FROM products
WHERE category = 'vegetables'

/*
NOT returns True if argument equals to False and vice versa.
AND compares operands and returns True only if all of them are True. Alternatively, returns False.
OR returns True if at least one of the operands is True. Otherwise, returns False.
*/

SELECT *
FROM personel
WHERE NOT(status="Junior") AND skills="SQL"

SELECT *
FROM personel
WHERE (status="Middle" OR status="Senior") AND skills="SQL"


