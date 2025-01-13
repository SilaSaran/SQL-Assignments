CREATE DATABASE Global_data;
USE Global_data;
--  Creating a table named Country with fields: Id Country_name Population Area
CREATE TABLE Country ( 
Id INT PRIMARY KEY, 
Country_name VARCHAR(50),
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
 DESC Country;
 -- Insert 10 rows into Country table 
 INSERT INTO Country (Id, Country_name, Population, Area) VALUES 
 (1, 'India', 1393409038, 3287263), 
 (2, 'USA', 331002651, 9833517), 
 (3, 'Canada', 37742154, 9984670), 
 (4, 'UK', 67886011, 243610), 
 (5, 'Australia', 25499884, 7692024),
 (6, 'Germany', 83783942, 357022), 
 (7, 'France', 65273511, 551695),
 (8, 'Japan', 126476461, 377975), 
 (9, 'China', 1439323776, 9596961),
 (10, 'Brazil', 212559417, 8515767);
 SELECT * FROM Country;
 -- Insert 10 rows into Persons table
 INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
 (11, 'John', 'Samual', 331002651, 4.5, 2, 'USA'),
 (12, 'James', 'Antony', 1393409038, 4.2, 1, 'India'), 
 (13, 'Alice', 'Jacob', 37742154, 3.8, 3, 'Canada'), 
 (14, 'Bob', 'Kurian', 67886011, 4.7, 4, 'UK'), 
 (15, 'Christy', 'Marcus', 25499884, 4.1, 5, 'Australia'), 
 (16, 'David', 'Wilson', 83783942, 3.9, 6, 'Germany'), 
 (17, 'Eldias', 'Taimore', 65273511, 4.6, 7, 'France'), 
 (18, 'Francis', 'Anto', 126476461, 4.3, 8, 'Japan'), 
 (19, 'Grace', 'Antony', 1439323776, 4.8, 9, 'China'), 
 (20, 'Hamster', 'Poulose', 212559417, 3.7, 10, 'Brazil');
 SELECT * FROM Persons;
 -- (1)List the distinct country names from the Persons table
 SELECT DISTINCT Country_name FROM Persons;
-- (2)Select first names and last names from the Persons table with aliases. 
SELECT Fname AS First_name, Lname AS Last_name FROM Persons;
-- (3)Find all persons with a rating greater than 4.0. 
SELECT * FROM Persons where Rating > 4.0;
-- (4)Find countries with a population greater than 10 lakhs. 
SELECT Country_name,Population FROM Country WHERE Population > 1000000;
-- (5)Find persons who are from 'USA' or have a rating greater than 4.5.
SELECT Fname,Lname,Rating,Country_name FROM Persons WHERE Country_name='USA' OR Rating > 4.5;
--  (6)Find all persons where the country name is NULL.
SELECT * FROM Persons WHERE Country_name IS NULL; 
-- (7)Find all persons from the countries 'USA', 'Canada', and 'UK'. 
SELECT * FROM Persons WHERE Country_name IN ('USA','Canada','UK');
-- (8)Find all persons not from the countries 'India' and 'Australia'.
SELECT * FROM Persons WHERE Country_name NOT IN ('India','Australia');
-- (9)Find all countries with a population between 5 lakhs and 20 lakhs. 
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;
-- (10)Find all countries whose names do not start with 'C'.
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';