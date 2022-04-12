/*
Let's keep working with our students database and create a table students_info that will contain four columns: student_id, name, surname and age.
The column student_id will hold the unique student identifier of the INT type. The columns name and surname will have VARCHAR(30) data. 
The age column will hold INT values.
*/

CREATE TABLE students_info ( 
    student_id INT, 
    name VARCHAR(30), 
    surname VARCHAR(30), 
    age INT
);


-- general form
CREATE TABLE table_name ( 
    column_1 column_1_type,
    column_2 column_2_type,
    ...., 
    column_n column_n_type
);
