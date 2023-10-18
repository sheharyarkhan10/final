CREATE DATABASE [FinalProject-[5082];
GO

USE [FinalProject-[5082];
GO


CREATE TABLE Students (
    ID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Age INT,
    CourseID INT, -- Foreign key to Courses table
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName NVARCHAR(50) --use NVARCHAR bcoz it can store more data
);

INSERT INTO Courses (CourseID, CourseName)
VALUES 
(1, 'Mathematics'),
(2, 'Computer Science'),
(3, 'History');


INSERT INTO Students (ID, FirstName, LastName, Age, CourseID)
VALUES 
(1, 'Muhammad', 'Sheharyar', 22, 1),
(2, 'Ali', 'Khan', 24, 2),
(3, 'Arslan', 'Munir', 23, 1),
(4, 'Syed', 'Fawad', 25, 2),
(5, 'Shahid', 'Afridi', 21, 3);

Select * from Students;
        
CREATE PROCEDURE AddStudent
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Age INT,
    @CourseID INT
AS
BEGIN
    INSERT INTO Students (FirstName, LastName, Age, CourseID)
    VALUES (@FirstName, @LastName, @Age, @CourseID);
END

CREATE PROCEDURE GetAllStudents
AS
BEGIN
    SELECT * FROM Students;
END

CREATE PROCEDURE UpdateStudentAge
    @ID INT,
    @NewAge INT
AS
BEGIN
    UPDATE Students
    SET Age = @NewAge
    WHERE ID = @ID;
END


CREATE PROCEDURE DeleteStudent
    @ID INT
AS
BEGIN
    DELETE FROM Students
    WHERE ID = @ID;
END

--Advance API Calls


CREATE PROCEDURE GetStudentsOlderThan20
AS
BEGIN
    SELECT * FROM Students WHERE Age > 20;
END;



CREATE PROCEDURE GetStudentsByCourse
    @CourseId INT
AS
BEGIN
    SELECT * FROM Students WHERE CourseID = @CourseId;
END;



CREATE PROCEDURE GetMostPopularCourse
AS
BEGIN
    SELECT TOP 1 CourseID, COUNT(*) AS EnrollmentCount
    FROM Students
    GROUP BY CourseID
    ORDER BY EnrollmentCount DESC;
END;



