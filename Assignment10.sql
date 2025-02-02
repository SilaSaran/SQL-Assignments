CREATE DATABASE School;
USE School;

-- 1: Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows.

CREATE TABLE Teachers (
    Id INT PRIMARY KEY,
    Name VARCHAR(100),
    Subject VARCHAR(50),
    Experience INT,
    Salary FLOAT
);
DESC Teachers;
INSERT INTO Teachers VALUES
(1, 'Anup', 'Math', 5, 50000.00),
(2, 'Raji', 'Science', 8, 55000.00),
(3, 'Soumya', 'English', 3, 45000.00),
(4, 'Dona', 'History', 10, 60000.00),
(5, 'Nandu', 'Geography', 2, 40000.00),
(6, 'Firoz', 'Physics', 7, 52000.00),
(7, 'Ginto', 'Chemistry', 6, 51000.00),
(8, 'Hari', 'Biology', 4, 48000.00);
SELECT * FROM Teachers;

-- 2: Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative”
-- if the salary inserted to the table is less than zero.

DELIMITER &&
CREATE TRIGGER Before_insert_teacher
BEFORE INSERT ON Teachers
FOR EACH ROW
BEGIN
IF NEW.Salary <0 THEN 
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'salary cannot be negative';
END IF;
END &&
DELIMITER ;
INSERT INTO Teachers VALUES (9, 'Neena', 'Botany', 9, -1);

-- 3: Create an after insert trigger named after_insert_teacher 
-- that inserts a row with teacher_id,action, timestamp to a table called teacher_log 
-- when a new entry gets inserted to the teacher table.
-- tecaher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted.

CREATE TABLE Teacher_log (
    Log_id INT AUTO_INCREMENT PRIMARY KEY,
    Teacher_id INT,
    Action VARCHAR(50),
    Timestamp DATETIME
);
Desc Teacher_log;

DELIMITER &&
CREATE TRIGGER After_insert_teacher
AFTER INSERT ON Teachers
FOR EACH ROW
BEGIN
INSERT INTO Teacher_log(Teacher_id,Action,Timestamp) VALUES
(NEW.Id,"Inserted",Now());
END &&
DELIMITER ;
INSERT INTO Teachers VALUES (10, 'Siju', 'CS', 9, 50000.00);
SELECT * FROM Teachers;
SELECT * FROM Teacher_log;
INSERT INTO Teachers VALUES (11, 'Minu', 'ECE', 12, 75000.00);

-- 4: Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years. 

DELIMITER &&
CREATE TRIGGER Before_delete_teacher
BEFORE DELETE ON Teachers
FOR EACH ROW
BEGIN
IF OLD.Experience>10 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='cannot delete';
END IF;
END &&
DELIMITER ;
DELETE FROM Teachers where Id=11;

 -- 5: Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.

DELIMITER &&
CREATE TRIGGER After_delete_teacher
AFTER DELETE ON Teachers
FOR EACH ROW
BEGIN
INSERT INTO Teacher_log(Teacher_id,Action,Timestamp) VALUES
(OLD.Id,"Deleting",Now());
END &&
DELIMITER ;

DELETE FROM Teachers where Id=9;
SELECT * FROM Teachers;
SELECT * FROM Teacher_log;