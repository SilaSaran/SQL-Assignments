-- ASSIGNMENT 1

-- CREATE A DATABASE 'SCHOOL'
CREATE DATABASE school;
USE school;

-- CREATE A TABLE 'Student'
CREATE TABLE Student (
Roll_no int,
Name Varchar(10),
Marks int,
Grade char(1)
);
DESC Student;

-- INSERTING THE VALUES INTO THE Student TABLE
INSERT INTO Student VALUES(1,'Mini',45,'A');

-- DISPLAY THE TABLE TO SHOWING THE RECORD
SELECT * FROM Student;

-- ADD COLUMN 'Contact' INTO THE Student TABLE
ALTER TABLE Student ADD COLUMN Contact Varchar(15);

-- REMOVE THE 'Grade' column FROM THE Student Table
ALTER TABLE Student DROP COLUMN Grade;

-- RENAME THE TABLE TO 'Classten'
RENAME TABLE Student to Classten;
DESC Classten;

-- DELETE ALL ROWS FROM THE TABLE Classten
TRUNCATE TABLE Classten;
SELECT * FROM Classten;

-- REMOVE TABLE Classten FROM THE DATABASE School
DROP TABLE Classten;
DESC Classten;
DROP DATABASE School;