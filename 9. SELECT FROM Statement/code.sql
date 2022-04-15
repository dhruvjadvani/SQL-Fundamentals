SELECT * FROM table_name;

SELECT
    day, 
    hour,
    phenomena,
    temperature as "temperature in Celsius",
    feels_like as "feels like in Celsius",
    wind_speed as "wind speed in m/s"
FROM
    weather
;

--The type of data extraction when you select a subset of table columns is called projection.

--Here's a general schema for such queries: keyword SELECT, list of column names with optional aliases, keyword FROM, table name, and a semicolon to mark the end of the statement:

SELECT
    col1 [AS alias1], ..., colN [AS aliasN]  
FROM
    table_name
;




SELECT
    'London' as place,
    day, 
    hour,
    phenomena,
    temperature*9/5+32 as "temperature in Fahrenheit",
    feels_like < temperature as "feels colder",
    wind_speed as "wind speed in m/s"
FROM
    weather
;

