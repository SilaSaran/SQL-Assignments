-- Consider the Country table and Persons table that you created earlier and perform the following: 
USE Region;
SELECT * FROM Country;
SELECT * FROM Persons;
-- (1)Perform inner join, Left join, and Right join on the tables.

-- Inner Join
SELECT Persons.*, Country.Country_name, Country.Population, Country.Area
FROM Persons
INNER JOIN Country ON Persons.Country_Id = Country.Id;

-- left Join
SELECT Persons.*, Country.Country_name, Country.Population, Country.Area
FROM Persons
LEFT JOIN Country ON Persons.Country_Id = Country.Id;

-- Right Join
SELECT Persons.*, Country.Country_name, Country.Population, Country.Area
FROM Persons
RIGHT JOIN Country ON Persons.Country_Id = Country.Id;

-- (2)List all distinct country names from both the Country and Persons tables.
SELECT DISTINCT Country_name All_Countries FROM Country
UNION
SELECT DISTINCT Country_name All_Countries FROM Persons;
 
 -- (3)List all country names from both the Country and Persons tables, including duplicates.
SELECT Country_name All_Countries FROM Country
UNION ALL
SELECT Country_name All_Countries FROM Persons;

 -- (4)Round the ratings of all persons to the nearest integer in the Persons table.
 -- Round ratings to the nearest integer
SELECT Id, Fname,Lname, ROUND(Rating) AS Rounded_Rating
FROM Persons; 


