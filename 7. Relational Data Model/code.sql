/*
The Relational Data Model (RDM) is an abstract mathematical model on the basis of which modern databases are designed. 
Here's the list of several relational DBMS: Postgres, MySQL, Oracle, etc.
*/

/*
A relation is essentially a two-dimensional table that represents some entity or relationship.

An entity is an abstraction of some object (like a class in OOP), for example, a student, a car, a building.
A relationship defines how entities are interconnected.
For example, each student studies in one of the groups, such a relationship in Relational DB is called many-to-one relationship (more on the types of relationships below).

A relation consists of attributes and tuples. 
An attribute is a column in a table, some property of which has a relation. 
For example, in relation to a student, there are the following attributes: last name, first name, date of birth, and student number. 
A tuple is a row in a table, a collection of specific attribute values.

For example, for a student relation with the attributes student number, last name, first name, date of birth, the tuple can be 88881111, Jackson, John, 01.01.2000. 
A relation with its attributes can be briefly denoted as follows: Student(student_number, last_name, first_name, date_of_birth).

student_number|	last_name | first_name	| date_of_birth
88881111	    |   Jackson	| John	      |  01.01.2000
*/

/*
Restrictions
The following restrictions are imposed on the relations in the relational data model:

1> There cannot be two relations with the same name in a database.
2> All attributes within the same relationship have to have different names.
3> There should only be one value in each cell.
4> The order of the rows and columns in the relations is not important.
*/

/*
Entity integrity
Integrity is the conformity of a data model with certain rules. There are two kinds of integrity: entity integrity and referential integrity.

The integrity of the entity means that there cannot be two identical tuples (rows) in the table. 
As in the real world, we cannot have two absolutely identical objects, for example, there are no identical students, they are all distinct.
To maintain the integrity of an entity, the concept of a primary key (PK) is introduced.


Referential integrity
Referential integrity occurs when we have two connected relations. 
The relationship of the relations is provided using a foreign key (FK).
A foreign key is an attribute of a relation (subordinate/dependent) that points to the primary key of another relation (main/master).
Referential integrity means that there cannot be a foreign key in the subordinate table that points to a nonexistent tuple in the main table.

For example, there are two relations: student and group. 
The Group has an attribute number, which is the primary key, and the Student relation has the same attribute, which indicates the student's belonging to a certain group. 
In student relation, the group number is a foreign key. 
If in the Student table for some tuple the value of the foreign key points to the tuple of a group that is not in the Group table, then there will be a violation of the referential integrity.


FK is used to create a many-to-one (one-to-many) relationship.*/

/*

/*
Relationships
There are relationships of one-to-one, one-to-many, and many-to-many types.

one-to-one relationship (1-1) means that one tuple of the first relation can be associated with no more than one tuple of another relation. 
The opposite is also true. For example, passport — citizen (one person can have only one passport and a passport refers to one person).

one-to-many relationship (1-M) means that a tuple of the first relation can be associated with one or more tuples of the second relation, but the opposite is not true. 
Any tuple of the second relation can be associated with only one tuple of the first relation. 
For example, student — group (there can be many students in a group, but each student belongs to only one group).

many-to-many (M-M) relationship means that any tuple of the first relation can be associated with one or more tuples of another relation. The opposite is also true. For example, student — discipline (each student studies many disciplines, each discipline can be studied by many students).
It should also be noted that many-to-many relationships do not exist in RDM. It is split into two one-to-many relationships, so that an intermediate associative relation appears, which has two foreign keys as attributes that indicate the primary keys of the original relations.
Any of the relationships described above can be identifying or non-identifying. A relationship is identifying if the foreign key of a subordinate relationship goes into (or becomes part of) its primary key. For example, the order number (PK of order relation) in the store is generated based on the customer number and the order date. The customer number is the PK for the customer relation. The order number is a composite PK of two attributes: customer number (also a foreign key) and order date.

In a non-identifying relationship the foreign key relationship does NOT go to the primary key, for example, the Student-Group relationship discussed above.


*/


