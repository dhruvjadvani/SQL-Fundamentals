SELECT 'Hello, World!';

SELECT 2.3*4+5;

-- Tuple
SELECT 'Alice', 170, 170*0.393701;


--Alias
SELECT 
  'Alice' AS name, 
  170 AS height_in_centimeters, 
  170*0.393701 AS "height in inches"
;


--code readability
SELECT 'Bob' AS name, 160 AS "height in centimeters", 160*0.393701 AS "height in inches";

SELECT 
  'Bob' AS "name", 
  160 AS "height in centimeters", 
  160*0.393701 AS "height in inches"
;

SELECT 
  'Bob'        AS "name", 
  160          AS "height in centimeters", 
  160*0.393701 AS "height in inches"
;


--general form
SELECT val1 [AS name1], ..., valN [AS nameN];
