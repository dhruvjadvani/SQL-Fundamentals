/*
Concatenation of strings
The first string function you are going to learn is the concat(string1, string2, ...) function that returns a concatenation of two or more strings. 
For example, the following expression SELECT concat('Jet', 'Brains'); returns a single 'JetBrains' string.


To consider a real-life example, suppose we have a table of persons that stores first and last names:

first_name	last_name
Drew	      Bradley
Jaden	      Lewis
Mell	      Andrews
Rebecca	    Donovan
Using this function, we can combine the names separated by a space.
*/

SELECT concat(first_name, ' ', last_name)
FROM persons;
The result will be the following one-column table:
/*
Drew Bradley
Jaden Lewis
Mell Andrews
Rebecca Donovan
*/

--Getting string length
/*Another simple function is char_length(string) that returns the length of a string measured in individual characters. 
There are a few simple examples on how to work with this function:
*/

SELECT char_length('apple'); returns 5;
SELECT char_length(''); returns 0 because the given string is empty.

--We can apply this function to the first_name column of the previous table to show the length of the names:

SELECT char_length(first_name)
FROM persons;
In this case, the result will be the following one-column table:

/*
4
5
4
7
*/

--Extracting a substring
/*The function substr(string, i_from, n_char) extracts a substring containing n_char from a given string starting at position i_from. For example, SELECT substr('Microphone', 6, 5); returns the string 'phone' from the initial string.

As an example, suppose we need to extract only the first two characters from the last names of the persons. We can do it using the following SQL statement:
*/
SELECT substr(last_name, 1, 2)
FROM persons;
/*
Our result will look like this:

Br
Le
An
Do
*/

/*
Replacing a substring
There is also a function replace(string, s_what, s_with) that replaces one substring; s_what of the original string, with another substring s_with. 
For example, the following statement SELECT replace('Rafael', 'f', 'ph'); returns the string 'Raphael' as the result. 
Like the others, this function can be applied to table columns.

When invoked with SELECT , this function doesn't modify the actual data stored in your database, it just modifies the result of your selection.
*/

/*
Reversing a string
In addition, there is a function called reverse(string) that returns the original string with the order of the characters reversed.
For example, if we invoke SELECT reverse('SQL Tutorial');, then we get the string 'lairotuT LQS' as the result.

Although this function is supported by most of the commonly-used databases, it is not often used in practice.

*/

--International phones
/*There is a table named phones that stores US local phone codes. This table has two columns: integer id and string number.

You need to select the numbers and add +1 before them to convert local codes to international ones.
*/ 

SELECT concat('+1', number) AS number FROM phones;

--Words
/*
A table named dictionary that has one field word. This table stores British English words with the "our" ending.
You need to get their analogues from American English with the "or" ending.

For example, the following British English words colour, flavour, behaviour are color, flavor, behavior in the American English.
*/

SELECT replace(word, "our", "or") FROM dictionary

































