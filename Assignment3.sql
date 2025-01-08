-- Creating the database as 'Company'
CREATE DATABASE Company;
USE Company;
-- Create a table named Managers 
-- with fields : Manager_Id First_name Last_Name DOB Age ->Use check constraint Last_update Gender Department Salary -> NOT NULL
CREATE TABLE Managers(
Manager_Id INT PRIMARY KEY AUTO_INCREMENT,
First_name VARCHAR(15),
Last_name VARCHAR(15),
Dob DATE,
Age INT CHECK(Age>20),
Last_update TIMESTAMP,
Gender CHAR(1),
Department VARCHAR(15),
Salary int NOT NULL
);
DESC Managers;
-- 1. Insert 10 rows. 
INSERT INTO Managers (First_name,Last_name,Dob,Age,Last_update,Gender,Department,Salary)
VALUES
('John', 'Doe', '1980-01-15', 45, current_timestamp(), 'M', 'Sales', 35000), 
('Aaliya', 'Patel', '1985-03-22', 40, current_timestamp(), 'F', 'Marketing', 80000),
 ('Michael', 'Johnson', '1978-07-10', 47, current_timestamp(), 'M', 'IT', 90000), 
 ('Emily', 'Davis', '1990-11-05', 34, current_timestamp(), 'F', 'HR', 70000), 
 ('David', 'Brown', '1982-09-18', 42, current_timestamp(), 'M', 'Finance', 25000), 
 ('Sarah', 'Wilson', '1988-02-14', 37, current_timestamp(), 'F', 'IT', 78000), 
 ('James', 'Taylor', '1975-12-30', 49, current_timestamp(), 'M', 'Legal', 95000), 
 ('Laura', 'Anderson', '1992-06-25', 32, current_timestamp(), 'F', 'IT', 72000), 
 ('Robert', 'Thomas', '1983-08-08', 41, current_timestamp(), 'M', 'R&D', 81000), 
 ('Linda', 'Martinez', '1987-04-19', 38, current_timestamp(), 'F', 'IT',50000);
 SELECT * FROM Managers;
 -- 2. Write a query that retrieves the name and date of birth of the manager with Manager_Id 1. 
 SELECT First_name,Last_name,Dob FROM Managers WHERE Manager_Id=1;
-- 3. Write a query to display the annual income of all managers. 
SELECT Manager_Id, First_name, Last_name, Salary * 12 AS Annual_Income FROM Managers;
-- 4. Write a query to display records of all managers except ‘Aaliya’.
SELECT * FROM Managers WHERE First_name != 'Aaliya';
-- 5. Write a query to display details of managers whose department is IT and earns more than 25000 per month.
SELECT * FROM Managers WHERE Department= 'IT'AND Salary>25000;
-- 6. Write a query to display details of managers whose salary is between 10000 and 35000. 
SELECT * FROM Managers WHERE Salary BETWEEN 10000 AND 35000;





