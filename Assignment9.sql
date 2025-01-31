CREATE DATABASE Organization;
USE Organization;
-- Consider the Worker table with following fields:
-- Worker_Id INT FirstName CHAR(25), LastName CHAR(25), Salary INT(15), JoiningDate DATETIME, Department CHAR(25)) 
 CREATE TABLE Worker(
 Worker_Id INT,
 FirstName CHAR(25), 
 LastName CHAR(25), 
 Salary INT(15), 
 JoiningDate DATETIME,
 Department CHAR(25)
 ) ;
 DESC Worker;
 -- 1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table
 -- and adds a new record to the table and then invokes the procedure call.
DELIMITER $$

CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT(15),
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END $$

DELIMITER ;

-- Invoke the procedure
CALL AddWorker(1, 'sita', 'Ram', 50000, '2025-01-31 13:00:00', 'HR');
SELECT * FROM Worker;

-- 2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. 
 -- It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the procedure call.

DELIMITER $$

CREATE PROCEDURE GetWorkerSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE Worker_Id = p_Worker_Id;
END $$

DELIMITER ;

-- Invoke the procedure
CALL GetWorkerSalary(1, @p_Salary);
SELECT @p_Salary;

 -- 3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. 
 -- It should update the department of the worker with the given ID. Then make a procedure call. 
 
 DELIMITER $$

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END $$

DELIMITER ;

-- Invoke the procedure
CALL UpdateWorkerDepartment(1, 'Finance');
SET SQL_SAFE_UPDATES=0;
SELECT * FROM Worker;

 -- 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount.
 -- It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call. 
 DELIMITER $$

CREATE PROCEDURE GetWorkerCountByDepartment(
    IN p_Department CHAR(25),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount
    FROM Worker
    WHERE Department = p_Department;
END $$

DELIMITER ;

-- Invoke the procedure
CALL GetWorkerCountByDepartment('HR', @p_workerCount);
SELECT @p_workerCount;

 -- 5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. 
-- It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.

DELIMITER $$

CREATE PROCEDURE GetAvgSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_avgSalary FLOAT
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary
    FROM Worker
    WHERE Department = p_Department;
END $$

DELIMITER ;
INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES 
(2, 'Smitha', 'Shah', 50000, '2025-01-31 13:00:00', 'HR'),
(3, 'Jimi', 'Jeorge', 60000, '2025-02-01 09:00:00', 'Finance'),
(4, 'Minu', 'Gandhi', 55000, '2025-03-15 10:30:00', 'IT'),
(5, 'Elas', 'Chako', 70000, '2025-04-20 11:45:00', 'Marketing'),
(6, 'Nitha', 'Thilak', 65000, '2025-05-25 14:00:00', 'Sales');

SELECT * FROM Worker;
-- Invoke the procedure
CALL GetAvgSalaryByDepartment('HR', @p_avgSalary);
SELECT @p_avgSalary;

