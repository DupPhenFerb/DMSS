-- 1) CREATE TABLE
-- TABLE Student
CREATE TABLE Student (
	SID INT NOT NULL UNIQUE,
	S_FName VARCHAR(20) NOT NULL,
	S_LName VARCHAR(30) NOT NULL,
	PRIMARY KEY (SID)
);

-- TABLE Course
CREATE TABLE Course (
	CID INT NOT NULL,
	C_Name VARCHAR(30) NOT NULL,
	PRIMARY KEY (CID)
);

--TABLE Course_Grades
CREATE TABLE Course_Grades (
	CGID INT NOT NULL UNIQUE,
	Semester CHAR(4) NOT NULL,
	CID INT NOT NULL,
	SID INT NOT NULL,
	Grade CHAR(2) NOT NULL,
	PRIMARY KEY (CGID),
	--FOREIGN KEY (CID) REFERENCES Course(CID),
	--FOREIGN KEY (SID) REFERENCES Student(SID),
	CONSTRAINT CID_FK FOREIGN KEY(CID) REFERENCES Course(CID),
	CONSTRAINT SID_FK FOREIGN KEY(SID) REFERENCES Student(SID)
);

-- 2) Write the SQL to insert the following data into the respective tables
-- INSERT TABLE Student
INSERT INTO Student (SID, S_FName, S_LName)
	VALUES 
		(12345, 'Chris', 'Rock'),
		(23456, 'Chris', 'Farley'),
		(34567, 'David', 'Spade'),
		(45678, 'Liz', 'Lemon'),
		(56789, 'Jack', 'Donaghy');

-- INSERT TABLE Course
INSERT INTO Course (CID, C_Name)
	VALUES
		(101001, 'Intro to Computers'),
		(101002, 'Programming'),
		(101003, 'Databases'),
		(101004, 'Websites'),
		(101005, 'IS Management');

-- INSERT TABLE Course_Grades
INSERT INTO Course_Grades (CGID, Semester, CID, SID, Grade)
	VALUES
		(2010101, 'SP10', 101005, 34567, 'D+'),
		(2010308, 'FA10', 101005, 34567, 'A-'),
		(2010309, 'FA10', 101001, 45678, 'B+'),
		(2011308, 'FA11', 101003, 23456, 'B-'),
		(2012206, 'SU12', 101002, 56789, 'A+');

-- SELECT: READ
SELECT * FROM Student
SELECT * FROM Course
SELECT * FROM Course_Grades

-- 3) In the Student table, change the maximum length for Student first names to be 30 characters long
ALTER TABLE Student
ALTER COLUMN S_FName VARCHAR(30);

-- 4)  In the Course table, add a column called “Faculty_LName” where the Faculty last name can vary up to 30 characters long. This column cannot be null and the default value should be “TBD”
ALTER TABLE Course
ADD Faculty_LName VARCHAR(30) NOT NULL DEFAULT 'TBD';

-- 5)  In the Course table, update CID 101001 where will be Faculty_LName is “Potter” and C_Name is “Intro to Wizardry”.
 UPDATE Course SET Faculty_LName = 'Potter', Course = 'Intro to Wizardry' WHERE CID = 101001;

 -- 6)In the Course table, change the column name “C_Name” to be “Course_Name”.
EXEC sp_rename 'Course.C_Name', 'Course_Name', 'COLUMN';

-- 7)Delete the “Websites” class from the Course table
DELETE FROM Course WHERE Course_Name = 'Websites';

-- 8)Remove the Student table from the database.
DROP TABLE Student;

-- 9)Remove all the data from the Course table, but retain the table structure
DELETE FROM Course;

-- 10)Remove the foreign key constraints from CID and SID columns in the Course_Grades table
ALTER TABLE Course_Grades DROP CONSTRAINT CID_FK;
ALTER TABLE Course_Grades DROP CONSTRAINT SID_FK;





