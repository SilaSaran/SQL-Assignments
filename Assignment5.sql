CREATE DATABASE Region;
USE Region;
-- Create a table named Country with fields: Id Country_name Population Area 
CREATE TABLE Country(
Id INT PRIMARY KEY,
Country_name VARCHAR(15),
Population BIGINT,
Area BIGINT
);
DESC Country;
-- Create another table named Persons with fields: Id Fname Lname Population Rating Country_Id Country_name 
CREATE TABLE Persons(
Id INT PRIMARY KEY,
Fname VARCHAR(15),
Lname VARCHAR(15),
Population BIGINT,
Rating FLOAT,
Country_Id INT,
Country_name VARCHAR(15),
FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);
DESC Persons;
-- Insert 10 rows into both tables, as given below.
INSERT INTO Country (Id, Country_name, Population, Area) VALUES 
(1, 'India', 1393409038, 3287263),
(2, 'China', 1444216107, 9596961), 
(3, 'USA', 331893745, 9833517), 
(4, 'Indonesia', 273523621, 1904569), 
(5, 'Pakistan', 225199937, 881912), 
(6, 'Brazil', 213993437, 8515767), 
(7, 'Nigeria', 211400708, 923768), 
(8, 'Bangladesh', 166303498, 147570), 
(9, 'Russia', 145912025, 17098242), 
(10, 'Mexico', 130262216, 1964375);
SELECT * FROM Country;
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
 (1, 'John', 'Samual', 100000, 4.5, 1, 'India'), 
 (2, 'Joy', 'Sevier', 200000, 4.7, 2, 'China'), 
 (3, 'Misha', 'Patel', 300000, 4.8, 3, 'USA'), 
 (4, 'Elvin', 'Davis', 400000, 4.6, 4, 'Indonesia'), 
 (5, 'Dino', 'Chako', 500000, 4.9, 5, 'Pakistan'), 
 (6, 'Sanjay', 'Shyam', 600000, 4.4, 6, 'Brazil'), 
 (7, 'Gireesh', 'Damodar', 700000, 4.3, 7, 'Nigeria'), 
 (8, 'Anna', 'Wilson', 800000, 4.2, 8, 'Bangladesh'), 
 (9, 'Joyal', 'Thomas', 900000, 4.1, 9, 'Russia'), 
 (10, 'Lidiya', 'Martin', 1000000, 4.0, 10, 'Mexico');
 SELECT * FROM Persons;
-- 1. Write an SQL query to print the first three characters of Country_name from the Country table. 
SELECT Country_name,LEFT(Country_name, 3) AS "First Three Characters" FROM Country; 
-- 2. Write an SQL query to concatenate first name and last name from Persons table. 
SELECT CONCAT(Fname," ",Lname) AS "Full Name" FROM Persons;
-- 3. Write an SQL query to count the number of unique country names from Persons table. 
SELECT COUNT(DISTINCT Country_name) "Unique Country Name" FROM Persons;
-- 4. Write a query to print the maximum population from the Country table.
SELECT MAX(Population) "Maximum Population" FROM Country;
--  5. Write a query to print the minimum population from Persons table. 
SELECT MIN(Population) "Minimum Population" FROM Persons;
-- 6. Insert 2 new rows to the Persons table making the Lname NULL. 
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES 
(11, 'Nick', NULL, 1100000, 3.9, 1, 'India'),
 (12, 'Sam', NULL, 1200000, 3.8, 2, 'China');
-- Then write another query to count Lname from Persons table.
SELECT COUNT(Lname) "Count Lname" FROM Persons;
-- 7. Write a query to find the number of rows in the Persons table.
SELECT COUNT(*) "No of rows" FROM Persons;
-- 8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
SELECT Country_name, Population FROM Country LIMIT 3;
-- 9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT) 
SELECT * FROM Country ORDER BY RAND() LIMIT 3;
-- 10. List all persons ordered by their rating in descending order.
SELECT * FROM Persons ORDER BY Rating DESC;
--  11. Find the total population for each country in the Persons table. 
SELECT Country_name, SUM(Population) "Total Population" FROM Persons GROUP BY Country_name;
-- 12. Find countries in the Persons table with a total population greater than 50,000
SELECT Country_name, SUM(Population) "Total Population" FROM Persons GROUP BY Country_name HAVING SUM(Population) > 50000;
 -- 13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.
 SELECT Country_name, COUNT(*) AS TotalPersons, AVG(Rating) AS AverageRating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY AverageRating ASC;
