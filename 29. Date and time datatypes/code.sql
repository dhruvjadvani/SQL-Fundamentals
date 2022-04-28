/*
SQL works with data of different types organized into tables. You already know some basic data types that allow you to store numbers, strings, or logical data. 
There's another thing we face every day. Think of what you do first when you wake up – yeah, you check what's the time! We face date and time data regularly
SQL provides a wide variety of date and time types.
*/

/*
Date & Time types
In different SQL dialects, date and time types may differ, but here we will talk about the most common ones: DATE, TIME, DATETIME, TIMESTAMP, and INTERVAL.
The DATE type is used for storing a date that consists of a year, a month, and a day (without the time) in the 'YYYY-MM-DD' format.
You can use it to store the dates like '2020-12-31' (the 31st of December 2020) or '1996-11-06' (the 6th of November 1996). 
This type supports any date ranging from '1000-01-01' to '9999-12-31'
*/

/*
f you want to store only the time without the date, you can use the TIME type. 
The TIME type stores hours, minutes, and seconds in the 'hh:mm:ss' format. 
You can use it to store the time of the day or to store the time that will represent the interval between two dates because the range supported by this type is very wide, 
from '-838:59:59' to '838:59:59'. So, in MySQL both '00:00:00' and '-455:34:34' are valid values of the TIME type.
You can also use values like '54:45' as TIME values but be careful: this value will be interpreted by MySQL as '54:45:00' not as '00:54:45'
*/



/*
The DATETIME type stores both date and time in the 'YYYY-MM-DD hh:mm:ss' format. 
It supports the range from '1000-01-01 00:00:00' to '9999-12-31 23:59:59'. 
The TIMESTAMP is another type used to store both data and time but in MySQL,
its range is more narrow. The range of TIMESTAMP type is from '1970-01-01 00:00:01' UTC to '2038-01-19 03:14:07' UTC.
*/

/*
Another interesting data type for time storage is INTERVAL. 
You can use it to store the interval between two dates.
There are two classes of the INTERVAL type: INTERVAL YEAR TO MONTH and INTERVAL DAY TO SECOND. 
The first one is used to store the difference between two dates in years and months,
while the second one will be useful if you need to store the difference in days, hours, minutes, and seconds. You can meet this date type, for example,
in Oracle SQL dialect.
*/


--Current date & time
/*
Quite often, we need to use the current date and time in our work with data. For these purposes, 
MySQL provides several functions that allow us to get time, date, or both.

To get the current date, we can use the CURDATE() or CURRENT_DATE() functions. 
These two functions are fully equivalent. To select the current date, we can use a very simple query:
*/



SELECT CURDATE(); 

--To select both date and time, apply CURRENT_TIMESTAMP() function:

SELECT CURRENT_TIMESTAMP(); 


--Date & time difference
/*
f you want to get the difference between the two dates, you can use the DATEDIFF(first_date, second_date) function.
For MySQL dialect, the DATEDIFF() function returns the number of days between two dates, but in some other SQL dialects,
you can also specify the units in which you want to get the difference: in years, months, seconds, etc.

For example, the query below in MySQL will return 5 as the result:
*/

SELECT DATEDIFF('2020-05-15 09:34:34', '2020-05-10 15:34:43');


--Be careful! You can also get a negative number as the query execution result if the first_date is smaller than the second_date.

--In MySQL, you can also use the function TIMEDIFF(first_time, second_time) to get the difference between two TIME values.


--Parts of dates
--To get a part of the date, you can use the EXTRACT(unit FROM date) function, which extracts a specified piece from a given date.

--The query below will extract the month from the given date and return 11 as the result:

SELECT EXTRACT(MONTH FROM '2020-11-04');


--Adding and subtracting dates
/*
You can also add and subtract dates using DATE_ADD(date, INTERVAL value_of_interval units) and DATE_SUB(date, INTERVAL value_of_interval units) functions, respectively.

Let's add ten days to the current date, using the DATE_ADD function:
*/

SELECT DATE_ADD(CURDATE(), INTERVAL 10 DAY);


--This query will return the date that will be in 10 days from today. For example, today is the 28th of April 2022, so the query will return '2022-05-08'.
--There is also a function called ADDDATE which has two forms: the first is similar to DATE_ADD and the second accepts only days as an argument:
SELECT ADDDATE(CURDATE(), 10);


--The date subtraction works similarly. Let's subtract 2 years from the date '1996-11-30':
SELECT DATE_SUB('1996-11-30', INTERVAL 2 YEAR);
--As the query result, we will get '1994-11-30'.



/*
Time zone support
There are a lot of time zones around the world, so sometimes we need to change the timezone of the date and time values.

In MySQL, to convert dates from one time zone to another, you can use CONVERT_TZ (value, from_time_zone, to_time_zone). 
As a timezone, you can use both named time zones such as 'Europe/Helsinki' or 'UTC' or offsets in the inclusive range from '-12:59' to '+13:00'. 
You can also use the system time zone using keyword 'SYSTEM'.


For example, the query below will convert the given date and time from the 'UTC' time zone to the 'US/Eastern' timezone:
*/


SELECT CONVERT_TZ('2008-05-15 12:00:00','UTC','US/Eastern');

--You can also set the time zone per session using the following query:

SET time_zone = timezone;


--Back to the Future
--Use SQL to get the date that will be in 27 days from '2045-01-15'.
SELECT ADDDATE('2045-01-15', 27);


--New Year
--Extract the year from the date '2021-01-31'.
SELECT EXTRACT(YEAR FROM '2021-01-31');


--Date gap
--Calculate the difference between the two dates: '2018-11-11' and '2030-10-25'.
SELECT DATEDIFF('2030-10-25',  '2018-11-11');
















































