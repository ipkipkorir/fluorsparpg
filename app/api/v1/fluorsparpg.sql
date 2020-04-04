/*drop database if exists*/
DROP DATABASE IF EXISTS fluorsparpg;

/*create database*/
CREATE DATABASE fluorsparpg;

/*display all databases*/
\l

/*connect to fluorsparpg database*/
\connect fluorsparpg

/*display all tables in the fluorsparpg database*/
\dt

/*create tables*/
/****************/
/*create table parent*/
CREATE TABLE parent (
	firstName VARCHAR(10) NOT NULL,
	lastName VARCHAR(10) NOT NULL,
	otherName VARCHAR(10) NULL,
	parentId SERIAL,
	nationalId BIGINT NULL UNIQUE,
	phoneNo BIGINT NULL UNIQUE,
	emailAddress VARCHAR(130) NULL,

	PRIMARY KEY(parentId)
);

/*create table class*/
CREATE TABLE class (
	classId SERIAL,
	className VARCHAR(10) NOT NULL UNIQUE,
	description VARCHAR(150) NULL,

	PRIMARY KEY(classId)
);

/*create table student*/
CREATE TABLE student ( 
	firstName VARCHAR(10) NOT NULL,
	lastName VARCHAR(10) NOT NULL,
	otherName VARCHAR(10) NULL,
	birthDate date NOT NULL,
	studentId INT NOT NULL,
	classId SERIAL,
	parentId SERIAL,

	PRIMARY KEY(studentId),
	CONSTRAINT studentClassFk FOREIGN KEY(classId) REFERENCES class(classId) ON DELETE CASCADE,
	CONSTRAINT studentParentFk FOREIGN KEY(parentId) REFERENCES parent(parentId) ON DELETE CASCADE
	);

/*create table category*/
CREATE TABLE category (
	categoryId SERIAL,
	categoryName VARCHAR(40) NOT NULL,
	description VARCHAR(150) NULL,

	PRIMARY KEY(categoryId)
);

/*create table subject*/
CREATE TABLE subject (
	subjectId SERIAL,
	subjectName VARCHAR(40),
	categoryId SERIAL,

	PRIMARY KEY (subjectId),
	CONSTRAINT subjectCategoryFk FOREIGN KEY(categoryId) REFERENCES category(categoryId) ON DELETE CASCADE
);

/*create table receipt*/
CREATE TABLE receipt (
	receiptId SERIAL,
	issueDate date NOT NULL,
	paymentMethod VARCHAR(20) NOT NULL,
	amount BIGINT NOT NULL,
	studentId INT NOT NULL,
	parentId SERIAL NOT NULL,

	PRIMARY KEY(receiptId),
	CONSTRAINT studentReceiptFk FOREIGN KEY(studentId) REFERENCES student(studentId) ON DELETE CASCADE,
	CONSTRAINT parentReceiptFk FOREIGN KEY(parentId) REFERENCES parent(parentId) ON DELETE CASCADE
);

/*create table studentSubject*/
CREATE TABLE studentSubject (
	studentId INT NOT NULL,
	subjectId SERIAL NOT NULL,

	PRIMARY KEY(studentId, subjectId),
	CONSTRAINT studentSubjectFk1 FOREIGN KEY(studentId) REFERENCES student(studentId) ON DELETE CASCADE,
	CONSTRAINT studentSubjectFk2 FOREIGN KEY(subjectId) REFERENCES subject(subjectId) ON DELETE CASCADE
);

/*create table department*/
CREATE TABLE department(
	departmentName VARCHAR(50) NOT NULL,
	departmentId SERIAL,
	description VARCHAR(150) NULL,

	PRIMARY KEY(departmentId)
);

/*create table employee*/
CREATE TABLE employee (
	firstName VARCHAR(12) NOT NULL,
	lastName VARCHAR(12) NOT NULL,
	otherName VARCHAR(12) NULL,
	employeeId SERIAL NOT NULL,
	startDate date NOT NULL,
	departmentId SERIAL,
	nationalId BIGINT NOT NULL UNIQUE,
	jobTitle VARCHAR(150),
	salary BIGINT NOT NULL,

	PRIMARY KEY(employeeId),
	CONSTRAINT employeeFk FOREIGN KEY(departmentId) REFERENCES department(departmentId) ON DELETE CASCADE
);

/*Display table description*/
\d parent;

/*Display extended table description*/
\d+ parent;

/*INSERT data into parent table*/
INSERT INTO parent (firstName,lastName,phoneNo_1) VALUES('Patrick','Moi',0725223814);
INSERT INTO parent (firstName,lastName,phoneNo_1) VALUES('Alex','Kiptum',0710160954);
INSERT INTO parent (firstName,lastName,phoneNo_1) VALUES('Abel','Sawe',0727010146);
INSERT INTO parent (firstName,lastName,phoneNo_1) VALUES('Samantha','Kipngeno',0724518465);
INSERT INTO parent (firstName,lastName,phoneNo_1) VALUES('Caren','Jepkosgei',0704648579);
INSERT INTO parent (firstName,lastName,phoneNo_1) VALUES('Bernadine','Jerop',0791083078);
INSERT INTO parent (firstName,lastName,phoneNo_1) VALUES('Maurine','Yego',0706627424);
INSERT INTO parent (firstName,lastName,otherName,phoneNo_1) VALUES('Ismael','Kipruto','Kiplagat',0710179457);
INSERT INTO parent (firstName,lastName,phoneNo_1) VALUES('Leonida','Chebet',0729305516);
INSERT INTO parent (firstName,lastName,phoneNo_1) VALUES('Joseph','Cheruiyot',0723537071);
INSERT INTO parent (firstName,lastName,phoneNo_1) VALUES('Surum','Jepkirui',0720395210);
INSERT INTO parent (firstName,lastName,phoneNo_1) VALUES('Daniel','Kiptoo',0715842959);
INSERT INTO parent (firstName,lastName,phoneNo_1) VALUES('Lesley','Jebet',0791318035);
INSERT INTO parent (firstName,lastName,phoneNo_1) VALUES('Amos','Orina',0721118297);
INSERT INTO parent (firstName,lastName,phoneNo_1) VALUES('Cynthia','Maiyo',0719798164);
INSERT INTO parent (firstName,lastName,phoneNo_1) VALUES('Stanley','Kipkilach',0720639976);


/*INSERT data into class table*/
INSERT INTO class (className,description) VALUES('Day Care','Minimum 3 years old children admitted');
INSERT INTO class (className,description) VALUES('PP1','First class in Early Years of Education');
INSERT INTO class (className,description) VALUES('PP2','Second class in Early Years of Education');
INSERT INTO class (className,description) VALUES('Grade 1','First class in Primary School of Early Years of Education');
INSERT INTO class (className,description) VALUES('Grade 2','Second class in Primary School of Early Years of Education');
INSERT INTO class (className,description) VALUES('Grade 3','Third class in Primary School of Early Years of Education');
INSERT INTO class (className,description) VALUES('Grade 4','Fourth class in Primary School of Early Years of Education');
INSERT INTO class (className,description) VALUES('Grade 5','Fifth class in Primary School of Early Years of Education');
INSERT INTO class (className,description) VALUES('Grade 6','Sixth class in Primary School of Early Years of Education');
INSERT INTO class (className,description) VALUES('STD 5','Fifth class in Primary School of 8-4-4 system of education'),
												('STD 6','Sixth class in Primary School of 8-4-4 system of education'),
												('STD 7','Seventh class in Primary School of 8-4-4 system of education'),
												('STD 8','Eighth class in Primary School of 8-4-4 system of education');


/*INSERT data into student table*/
INSERT INTO student (firstName,lastName,otherName,birthDate,studentId,parentId,classId) VALUES('Stacy','Limo','Jerop','01-01-2016',5000,1,1),
																						('Merlin','Jeptoo','01-01-2016',5001,17,1),
																						('Ryan','Kiprotich','01-01-2016',5002,2,1),
																						('Lucky','Kipruto','01-01-2008',5003,10,11),
																						('Enock','Kipchirchir','Kimeli','01-01-2007',5004,11,12),
																						('Blessed','Korir','Kosgei','01-01-2016',5005,3,1),
																						('Dylan','Kiprop','','01-01-2016',5006,4,1),
																						('Keith','Kipkurui','','01-01-2016',5007,5,1);


/*INSERT data into category table*/
INSERT INTO category (categoryName,description) VALUES
												('ECD', 'Nursery School - Day Care, PP1, PP2'),
												('Lower Primary', 'Grade 1 to Grade 3'),
												('Upper Primary', 'Grade 4 to Grade 6, then STD 6 to STD 8');


/*INSERT data into subject table*/
INSERT INTO subject (subjectName,categoryId) VALUES('Mathematics',3),
													('English',3),
													('Kiswahili',3),
													('Science',3),
													('Social Studies',3),
													('CRE',3);
/*DROP categoryid from table subject
******No need for this column******
*/
ALTER TABLE subject DROP categoryid;
/**
Now create a LINKING table subjectid_categoryid
**/
CREATE TABLE subject_category (categoryId SERIAL NOT NULL, subjectId SERIAL NOT NULL,
PRIMARY KEY(categoryId,subjectId),
CONSTRAINT subject_category_fk1 FOREIGN KEY(subjectId) REFERENCES subject(subjectId) ON DELETE CASCADE,
CONSTRAINT category_subject_fk2 FOREIGN KEY(categoryId) REFERENCES category(categoryId) ON DELETE CASCADE);

/*INSERT data into subject_category table*/
INSERT INTO subject_category(subjectId,categoryId) VALUES(13,3),(14,3),(15,3),(16,3),(17,3),(18,3),
														(13,2),(14,2),(15,2);



/*INSERT data into receipt table*/



/*INSERT data into studentSubject table*/



/*INSERT data into department table*/



/*INSERT data into employee table*/





/**********QUERIES************/


/*Read data from 3 tables: student, parent and class*/
/***************************************************/
SELECT s.firstName AS STUDENT_FIRSTNAME, s.lastName AS STUDENT_LASTNAME, 
p.firstName AS PARENT_FIRSTNAME, p.lastName AS PARENT_LASTNAME, p.phoneno_1 AS PHONE_NO_1,
c.classname AS CLASS 
FROM student s, parent p, class c WHERE s.parentid=p.parentid AND s.classid=c.classid;