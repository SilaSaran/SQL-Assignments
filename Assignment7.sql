-- Consider the Country table and Persons table that you created earlier and perform the following: 
USE Region;
SELECT * FROM Persons;
SELECT * FROM Country;
-- 1. Add a new column called DOB in Persons table with data type as Date. 
ALTER TABLE Persons
ADD DOB DATE;
SET SQL_SAFE_UPDATES=0;
UPDATE Persons
SET DOB = CASE 
    WHEN Id = 1 THEN '1990-01-01'
    WHEN Id = 2 THEN '1985-05-15'
    WHEN Id = 3 THEN '1992-07-20'
    WHEN Id = 4 THEN '1988-03-22'
    WHEN Id = 5 THEN '1995-11-10'
    WHEN Id = 6 THEN '1983-09-05'
    WHEN Id = 7 THEN '1991-12-30'
    WHEN Id = 8 THEN '1987-06-18'
    WHEN Id = 9 THEN '1993-04-25'
    WHEN Id = 10 THEN '1989-08-14'
    ELSE DOB
END;

-- 2. Write a user-defined function to calculate age using DOB. 
DELIMITER $$

CREATE FUNCTION CalculateAge (DOB DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, DOB, CURDATE()) - 
           CASE WHEN MONTH(DOB) > MONTH(CURDATE()) OR 
                     (MONTH(DOB) = MONTH(CURDATE()) AND DAY(DOB) > DAY(CURDATE())) 
                THEN 1 ELSE 0 END;
END $$

DELIMITER ;

-- 3. Write a select query to fetch the Age of all persons using the function that has been created.
SELECT Id, Fname, Lname, CalculateAge(DOB) AS Age FROM Persons;
-- 4. Find the length of each country name in the Country table.
SELECT Country_name, LENGTH(Country_name) AS NameLength FROM Country;
-- 5. Extract the first three characters of each country's name in the Country table.
SELECT Country_name, SUBSTRING(Country_name, 1, 3) AS First_Three_Chars
FROM Country;
-- 6. Convert all country names to uppercase and lowercase in the Country table.
SELECT Country_name, 
       UPPER(Country_name) AS Uppercase_Name, 
       LOWER(Country_name) AS Lowercase_Name
FROM Country;
