CREATE TABLE Students
(
    StudentID   char(11) PRIMARY KEY,
    FirstName   varchar(20) NOT NULL,
    LastName    varchar(20) NOT NULL,
    Gender      char(1)     NOT NULL,
    DateofBirth date        NOT NULL
);

CREATE TABLE Courses
(
    CourseCode varchar(6) PRIMARY KEY,
    CourseName varchar(70) NOT NULL,
    Level      char(2),
    Credits    int         NOT NULL
);
CREATE TABLE Registration
(
    StudentID  char(11),
    CourseCode varchar(6),
    Grade      decimal(2, 1) NOT NULL,
    PRIMARY KEY (StudentID, CourseCode),
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
    FOREIGN KEY (CourseCode) REFERENCES Courses (CourseCode)
);

INSERT INTO Students (StudentID, FirstName, LastName, Gender, DateofBirth)
VALUES ('861103-2438', 'Adam', 'Johnson', 'M', '1990-10-01'),
       ('911212-1746', 'Eva', 'Smith', 'F', '1991-08-20'),
       ('950829-1848', 'Anna', 'Washington', 'F', '1993-09-26'),
       ('123456-0980', 'Eric', 'Alonzo', 'M', '1990-05-26'),
       ('908023-2456', 'Bo', 'Ek', 'M', '1992-03-15'),
       ('098735-3456', 'Danny', 'Goss', 'M', '1992-02-01'),
       ('124345-3430', 'Mike', 'White', 'M', '1995-06-10'),
       ('124568-1345', 'Emily', 'Young', 'F', '1995-04-28'),
       ('908409-0010', 'Cathy', 'Lee', 'F', '1993-10-06'),
       ('124587-9088', 'Ben', 'Woo', 'M', '1992-11-30'),
       ('120953-0909', 'Anna', 'Washington', 'F', '1990-10-09'),
       ('120449-1008', 'John', 'Goss', 'M', '1995-10-26');

INSERT INTO Courses (CourseCode, CourseName, Level, Credits)
VALUES ('CS056', 'Database Systems', 'G1', 6),
       ('CS010', 'C++', 'U1', 5),
       ('ENG111', 'English', 'U1', 3),
       ('FIN052', 'Finance', 'G1', 5),
       ('PHY210', 'Physics', 'U2', 5),
       ('CHE350', 'Chemistry', 'U3', 5),
       ('BIO001', 'Biology', 'U1', 3),
       ('CS052', 'Operating Systems', 'G1', 5);

INSERT INTO Registration (StudentID, CourseCode, Grade)
VALUES ('861103-2438', 'CS056', 4),
       ('861103-2438', 'CS010', 4),
       ('861103-2438', 'PHY210', 3.5),
       ('911212-1746', 'ENG111', 2),
       ('950829-1848', 'CHE350', 3),
       ('950829-1848', 'BIO001', 2.5),
       ('123456-0980', 'CS052', 3.5),
       ('123456-0980', 'CS056', 4),
       ('908023-2456', 'PHY210', 3.0),
       ('908023-2456', 'CS056', 1.0),
       ('908023-2456', 'CS010', 2.0),
       ('124345-3430', 'FIN052', 2.5),
       ('124345-3430', 'CHE350', 4),
       ('908409-0010', 'CS052', 2),
       ('124587-9088', 'BIO001', 4),
       ('124587-9088', 'CS052', 3.5);

SELECT FirstName, LastName
FROM Students
ORDER BY LastName, FirstName;

SELECT StudentID, FirstName, LastName, DateofBirth
FROM Students
WHERE Gender = 'F'
  AND DateofBirth < '1993-01-01';

SELECT COUNT(*) AS Num_Students
FROM Registration
WHERE CourseCode = 'PHY210';


SELECT COUNT(*) AS Num_Courses
FROM Courses
WHERE CourseCode LIKE 'CS%';

SELECT CourseCode, CourseName
FROM Courses
WHERE Level = 'G1'
  AND Credits = 5;

SELECT Level, COUNT(*) AS Num_Courses
FROM Courses
GROUP BY Level;

SELECT AVG(Grade) AS Average_Grade
FROM Registration
WHERE StudentID = '861103-2438';

SELECT MAX(Grade) AS Max_Grade
FROM Registration
WHERE CourseCode = 'CS052';

SELECT CourseCode
FROM Registration
WHERE StudentID = '861103-2438'
  and StudentID = '123456-0980';

SELECT StudentID
FROM Students
WHERE StudentID NOT IN (SELECT StudentID FROM Registration);

#13
SELECT StudentID, SUM(Grade) AS Total_Grade, AVG(Grade) AS Average_Grade
from Registration
GROUP BY StudentID
having 3;

#14
SELECT StudentID, COUNT(*) AS Num_Courses
FROM Registration
GROUP BY StudentID
ORDER BY Num_Courses DESC
LIMIT 1;

SELECT DISTINCT StudentID
FROM Registration
WHERE CourseCode = 'PHY210'
   OR CourseCode = 'BIO001';

SELECT FirstName, LastName
FROM Students
ORDER BY DateofBirth DESC
LIMIT 1;

SELECT COUNT(DISTINCT StudentID) AS NumberOfStudents
FROM Students
WHERE StudentID NOT IN (SELECT DISTINCT StudentID
                        FROM Registration
                        WHERE CourseCode = 'CS056');

UPDATE Courses
SET Credits = 6
WHERE CourseCode LIKE 'CS%'
  AND Credits = 5;

DELETE
FROM Registration
WHERE StudentID = '908409-0010';