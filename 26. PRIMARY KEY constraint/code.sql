/*
Sometimes we need to be sure that all the rows in our table are unique. 
For example, we want to store information about the conference participants: their name, email, date of birth, and city; 
we want to make sure that no one is registered twice. In this case, we should find a combination of data that is unique for each participant. 
Maybe some people will have the same name, but they surely won't share the same personal email, so we can use this field as a unique key to prevent creating duplicates.
This unique key is commonly called a primary key.
*/


--PRIMARY KEY constraint
