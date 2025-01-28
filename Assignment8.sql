-- Consider the Country table and Persons table that you created earlier and perform the following: 
USE Region;
SELECT * FROM Country;
SELECT * FROM Persons;
-- 1. Find the number of persons in each country. 
SELECT Country_name, COUNT(*) AS Number_Of_Persons
FROM Persons
GROUP BY Country_name;
-- 2. Find the number of persons in each country sorted from high to low.
SELECT Country_name, COUNT(*) AS Number_Of_Persons
FROM Persons
GROUP BY Country_name
ORDER BY Number_Of_Persons DESC;
-- 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0 
SELECT Country_name, AVG(Rating) AS Average_Rating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;
-- 4. Find the countries with the same rating as the USA. (Use Subqueries) 
SELECT Country_name
FROM Persons
WHERE Rating = (SELECT Rating FROM Persons WHERE Country_name = 'USA');
-- 5. Select all countries whose population is greater than the average population of all nations.
SELECT Country_name
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);
-- Create a database named Product and create a table called Customer with the following fields in the Product database:
    -- Customer_Id - Make PRIMARY KEY First_name Last_name Email Phone_no Address City State Zip_code Country 
CREATE DATABASE Product;
USE Product;
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
); 
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country) VALUES
(1, 'Peter', 'Joe', 'peter.joe@sample.com', '1234567890', '123 Main St', 'New York', 'NY', '10001', 'USA'),
(2, 'Jane', 'Sam', 'jane.sam@sample.com', '2345678901', '456 Elm St', 'Los Angeles', 'CA', '90001', 'USA'),
(3, 'Mishel', 'Johnson', 'mishel.johnson@sample.com', '3456789012', '789 Oak St', 'Chicago', 'IL', '60601', 'USA'),
(4, 'Sisily', 'Davis', 'sisily.davis@sample.com', '4567890123', '101 Pine St', 'Houston', 'TX', '77001', 'USA'),
(5, 'David', 'Chako', 'david.chako@sample.com', '5678901234', '202 Maple St', 'Phoenix', 'AZ', '85001', 'USA'),
(6, 'Santha', 'Wilson', 'santha.wilson@sample.com', '6789012345', '303 Cedar St', 'Philadelphia', 'PA', '19101', 'USA'),
(7, 'Christy', 'Patel', 'christy.patel@sample.com', '7890123456', '404 Birch St', 'San Antonio', 'TX', '78201', 'USA'),
(8, 'Jemi', 'Martin', 'jemi.martin@sample.com', '8901234567', '505 Walnut St', 'San Diego', 'CA', '92101', 'USA'),
(9, 'Ajith', 'Anto', 'ajith.anto@sample.com', '9012345678', '606 Chestnut St', 'Dallas', 'TX', '75201', 'USA'),
(10, 'Liza', 'Thomas', 'liza.thomas@sample.com', '0123456789', '707 Spruce St', 'San Jose', 'CA', '95101', 'USA');
SELECT * FROM Customer;
-- 1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. 
CREATE VIEW Customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email
FROM Customer;
-- Perform the SELECT operation for the customer_info view
SELECT * FROM Customer_info;
-- 2. Create a view named US_Customers that displays customers located in the US. 
CREATE VIEW US_customers AS
SELECT * 
FROM Customer 
WHERE Country = 'USA';
-- 3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state.
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email, Phone_no, State
FROM Customer;
-- 4. Update phone numbers of customers who live in California for Customer_details view.
SET SQL_SAFE_UPDATES=0;
UPDATE Customer
SET Phone_no = 'New_Number'
WHERE State = 'CA';
SELECT * FROM Customer;
-- 5. Count the number of customers in each state and show only states with more than 5 customers.
SELECT State, COUNT(*) AS Number_Of_Customers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;
-- 6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view. 
SELECT State, COUNT(*) AS Number_Of_Customers
FROM Customer_details
GROUP BY State;
-- 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
SELECT *
FROM Customer_details
ORDER BY State ASC;
