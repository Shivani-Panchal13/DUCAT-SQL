/* 01/07/2025 (Tusesday)*/

-- all ways end the command with ; it is like a full stop for sql you can write like this to explain your command to other coder and you
-- can click ctrl+b to make it look more beautiful 

-- firstly we are going to create a database to store all table 
CREATE DATABASE Homerevison;

-- So we have created the database we are telling computer to use it 
USE Homerevison;

-- Now we are going to make table for the database to store data INT means number, VARCHAR mean to write some word, CHAR means also are 
-- words and NOT NULL mean that you can not leave this place empty 
CREATE TABLE student
(
id INT NOT NULL,
name VARCHAR(30),
gender CHAR(10)
);

-- DESC is used to describe the table use to see table 
DESC student;

-- To INSERT the data in the table 
INSERT INTO student(id,name,gender) values
(1,"Mayank Bhatt","Male"),
(2, "Dexant Bhatt", "Male"),
(3, "Sonali Bhatt", "Female");

-- To see table * mean all 
SELECT * FROM student;

-- 02/07/2025 (Wednesday) 

-- UNIQUE mean only one, PRIMARY KEY mean it is like a mix of UNIQUE and NOT NULL 
CREATE TABLE department (
Did INT PRIMARY KEY,
Dname VARCHAR(30) UNIQUE,
Dlocation VARCHAR(30) NOT NULL
);

-- to INSERT the data in the table 
INSERT INTO department(Did,Dname,Dlocation) VALUES
(1, "Mayank Bhatt", "Delhi"),
(2, "Dexant Bhatt","Delhi"),
(3, "Sonali Bhatt", "UP");

-- 03/07/2025 (Thursday) 

-- to delete the table we use DROP TABLE and we can drop the database also by DROP DATABASE
DROP TABLE Department;

-- Create table to link other table you can say there are two type of table parent table and child table here we are linking Department to 
-- employee meaning we will be useing departmnet column in employee table 
CREATE TABLE Department (
 D_id INT PRIMARY KEY, 
 D_name VARCHAR(25) UNIQUE
 );

-- CREATE TABLE IF NOT EXISTS is a good practice to use it is used to check if that table exist if not make it 
-- FLOAT allows decimal numbers, CONSTRAINT keyword in SQL is used to set rules on columns in a table (this is not that important)  
-- FOREIGN KEY creates a relationship It links D_id in the employee table to D_id in the Department table.
-- REFERENCES is like telling that this column is telling about this columns.
CREATE TABLE IF NOT EXISTS employee(
e_id INT PRIMARY KEY,
e_name VARCHAR(40),
salary FLOAT,
D_id INT,
CONSTRAINT FOREIGN KEY(D_id) REFERENCES Department (D_id)
);


-- 08/07/2025 (Tuesday)
-- INSERT data in department 
INSERT INTO department (D_id,D_name) VALUES
(101,"HR"),
(102, "Admin"),
(103, "Devloper");

-- INSERT data in employee
INSERT INTO employee(e_id,e_name,salary,D_id) VALUES
(1001, "Mayank","45000","101");

-- CHECK is like to put some condition before INSERT data will CREATEing table 
CREATE TABLE emp(
e_id INT PRIMARY KEY,
E_name VARCHAR(30),
age INT CHECK(Age>=18),
address VARCHAR(50)
);

-- INSERT data in emp
INSERT INTO emp(e_id,Age) VALUES
(1, 20);

-- to see the table 
SELECT * FROM emp;

-- INSERT data but it will not take it because age is not 18+ will creating table we used check to see age must be +18
INSERT INTO emp(e_id,Age) VALUE
(1, 15); 

-- DEFAULT is like haveing default value if you not put anything  
CREATE TABLE emp1(
e_id INT PRIMARY KEY,
E_name VARCHAR(30) DEFAULT("New Joiner"),
age INT CHECK(Age>=18),
address VARCHAR(50)
);

-- INSERT data in emp1
INSERT INTO emp1(e_id,Age) VALUES
(1, 20); 

-- see the table but you can see E_name New Joiner because will creating table we put default value in emp1 
SELECT * FROM emp1;


-- 9/6/2025 (wednesday)
DROP DATABASE Company1;

CREATE DATABASE company1;

USE company1;

CREATE TABLE Branch(
Branch_id INT PRIMARY KEY,
B_name VARCHAR(20),
Location VARCHAR(50)
);

DESC Branch;

CREATE TABLE Department(
Dep_id INT PRIMARY KEY,
Dep_name VARCHAR(20),
Branch_id INT,
CONSTRAINT FOREIGN KEY(Branch_id) REFERENCES Branch(Branch_id)
);

CREATE TABLE employee(
e_id INT PRIMARY KEY,
e_name VARCHAR(40),
salary FLOAT,
D_id INT,
CONSTRAINT FOREIGN KEY(D_id) REFERENCES Department (Dep_id)
);

Create table Product(
P_id int primary key,
P_name Varchar(30),
Branch_id int,
constraint foreign key(Branch_id) references Branch(Branch_id)
);

-- we created this table so we can make a relation between many to many 
Create table Product_emp(
Start_date Date primary key,
P_id int,
e_id int,
constraint foreign key(p_id) references Product(p_id),
constraint foreign key(e_id) references employee(e_id)
);

-- INT for numbers and BIGINT for big number
-- FLOAT for number like (1.00) and DOUBLE for number like (1.998443)
-- CHAR() for one word, VARCHAR() for more then one word and TEXT for write a text 
-- DATE for date and DATETIME for date & time 


-- 10/7/2025 (Thusday)
-- Revison of inserting data 
INSERT INTO Branch VALUES
(01,"Management Branch","Delhi"),
(02, "Head", "Delhi"),
(03, "Mumbai","uk"),
(04, "Mayank", "UP"),
(05, "Bhatt", "Patna");

SELECT * FROM Branch;

INSERT INTO Department VALUES 
(101,"HR",01),
(102,"MB",02),
(103,"DA",03),
(104,"DS",01),
(105,"ba",02),
(106,"VLB",04),
(107,"SB",05),
(108,"PB",04),
(109,"DB",02),
(110,"DB",04);
SELECT * FROM Department;

Insert INTO employee VALUES
(1001,"Mayank",28000,103),
(1002,"Satyam",25000,106),
(1003,"Dexant",30000,108),
(1004,"Gopal", 20000,102),
(1005,"Uday", 32000,101);
SELECT * FROM employee;

Insert INTO product VALUES
(1,"asd",02),
(2,"ZXC",01),
(3,"QWE",03),
(4,"POI",05),
(5,"LKJ",04);
SELECT * FROM product;

 Insert INTO Product_emp VALUES
('2022-04-02',1,1001),
('2022-04-03',4,1004),
('2022-04-04',3,1002),
('2022-04-05',2,1005),
('2022-04-06',5,1003);
SELECT * FROM Product_emp;

-- 11/7/2025 (friday)

-- Using database that you prefer
USE College;

-- Createing wrong table to learning who to rewrite it without droping it
CREATE TABLE Parson(
Id INT,
NAME CHAR(10),
Address VARCHAR(50)
);

-- This is who to add one rows in the table
ALTER TABLE Parson ADD Contact INT UNIQUE;

-- This is who to add multiple rows in the table
ALTER TABLE Parson ADD (Gender CHAR(6),Email VARCHAR(50), Age INT CHECK(age>=18));

-- To see if every thing is good
SELECT * FROM Parson;

-- Inserting data
INSERT INTO parson VALUES 
(01,"Mayank","abcd",4667775,"Male","asf@gmail.com",35),
(02,"Dexant","efgh",9455445,"Woman","acf@gmail.com",34),
(03,"Satyam","ijkl",9344245,"Transwoman","vsf@gmail.com",65);

-- To drop a row of a table without droping the whole table
ALTER TABLE Parson DROP COLUMN Gender;

-- To modify meaning to rewrite the charteristic of row header which we did wrong above
ALTER TABLE Parson MODIFY Contact BIGINT;
ALTER TABLE Mayank MODIFY Name VARCHAR(30);

-- To renameing the database 
ALTER TABLE Parson RENAME Mayank;

-- To see every thing is good 
SELECT * FROM Mayank;

-- 15/7/2025 (Tuesday)

-- using the database we changed name ok the database 
USE mayank;

-- TO renameing the column name of the table
ALTER TABLE course RENAME COLUMN course_id TO BHATT; 

-- To remove all the data of the table without droping the table
TRUNCATE TABLE course;

-- Add Constraint primary key in the column 
ALTER TABLE course ADD UNIQUE (TITLE);

-- You can change Constraint and charteristic in one line
ALTER TABLE course MODIFY title VARCHAR(45) NOT NULL;
ALTER TABLE course MODIFY credits INT UNIQUE;
ALTER TABLE course MODIFY Bhatt VARCHAR(45) DEFAULT "Bhatt";

ALTER TABLE COURSE ADD CONSTRAINT title CHECK (title IN ("Delhi","Mayank"));

-- to see if  all thing work good  
SELECT * FROM course;
DESC course;
INSERT INTO course (Bhatt,title,credits)VALUES
("so","BHATT",2);


-- 16/7/2025 (wednesday)
-- Useing the database
USE mayank;

-- making table to add foregin key in it by alter
CREATE TABLE customer(
c_id INT PRIMARY KEY,
name VARCHAR(50),
address TEXT,
contact BIGINT
);

CREATE TABLE orders(
o_id INT PRIMARY KEY,
o_date DATE,
item VARCHAR(50),
c_id INT
);

-- adding the foregin key after the table was already created
ALTER TABLE orders ADD CONSTRAINT cust_order1 FOREIGN KEY(c_id) REFERENCES customer(c_id);

-- droping foreign key but 
ALTER TABLE orders DROP FOREIGN KEY cust_order1;

-- Inserting the data to see everthing ok
INSERT INTO orders VALUES(01, "2025-07-16","adc",123);
SELECT * FROM orders;


-- 17/07/2025 (Thursday)

-- Ways to insert the data in the table
CREATE table XYZ(
A INT,
B VARCHAR(30),
C FLOAT,
D DATE
);

-- Type no 1 to add one row
INSERT INTO XYZ VALUES (3, "ABCD", 4.56, '2005-09-21');

-- Type no 2 to add more then one in one time
INSERT INTO XYZ VALUES 
(1, "ABCD", 4.56, '2005-09-21'),
(2, "EFGH", 5.67, '2005-04-22');

-- Type no 3 to add data in selected column 
INSERT INTO XYZ (B,D)VALUES 
("ABCD",'2005-09-21'),
("EFGH",'2005-04-22');

-- Type no 4 nothing new but it can solve some maths 
INSERT INTO XYZ(A,C) VALUES (7,10+(20/5));

-- Checking everything
SELECT * FROM XYZ;

-- Use of auto_increment it is used for to count something like we give everyone id so we have to give one id then we don't need to add 
-- Anything after we tell sql the one id it will now count it by himself like first id we gave was 1 then we don't need to add id after  
-- That will count it from the number we give it in our case 1,2,3,4,5,__ and so on if it was 100,101,102,103,__  
CREATE TABLE bhatt(
A INT PRIMARY KEY AUTO_INCREMENT,
B VARCHAR(30) DEFAULT("Mayank"),
C FLOAT,
D DATE
);

-- Trying to add data
INSERT INTO bhatt (a, c, d) VALUES (100,12.44,'2005-04-22');
INSERT INTO bhatt (c, d) VALUES (12.44,'2005-04-22');
SELECT * FROM bhatt;


-- 19/07/2025 (Friday)
-- Using the dataset
USE mayank;

-- use of Decimal(6,2) it means you can put like 6 number in it like 100000 and 2 means (.) before that number from last like 1000.00 
-- Default(now()) in datetime means it is used to put the date and correct timeing in which data was stored 
CREATE TABLE bhatt2(
A INT PRIMARY KEY AUTO_INCREMENT,
B VARCHAR(30) DEFAULT("Mayank"),
C DECIMAL (6,2), -- 1000.00
D DATETIME DEFAULT (now())
);
-- Inserting the data 
INSERT INTO bhatt2 VALUES (200,"mayank",4.7,'2002-09-23');
INSERT INTO bhatt2 (b,c,d)VALUES ("mayank",2234.7445,'2005-09-13');
INSERT INTO bhatt2 (b,c) VALUES("anuj",2224.23);
SELECT * FROM bhatt2;

-- use of default (curdate()) in datatime it is used to only put the data only
CREATE table bhatt3(
A INT PRIMARY KEY AUTO_INCREMENT,
B VARCHAR(30) DEFAULT("Mayank"),
C DECIMAL (6,2), -- 1000.00
D DATETIME DEFAULT (curdate())
);
-- inserting the data
INSERT INTO bhatt3 VALUES (200,"mayank",4.7,'2002-09-23');
INSERT INTO bhatt3 (b,c,d) VALUES ("mayank",2234.7445,'2005-09-13');
INSERT INTO bhatt3 (b,c) VALUES ("anuj",2224.23);
SELECT * FROM bhatt3;

-- Nothing new here
CREATE table bhatt3(
A INT PRIMARY KEY AUTO_INCREMENT,
B VARCHAR(30) DEFAULT("Mayank"),
C DECIMAL (6,2), -- 1000.00
D DATETIME DEFAULT (curdate())
);
-- Inserting data by default,default which will fill the default value given in table
INSERT INTO bhatt4 VALUES (202,"mayank",DEFAULT,DEFAULT);
SELECT * FROM bhatt4;

-- creating the table to copy the data from another table
CREATE table bhatt3(
A INT PRIMARY KEY,
B VARCHAR(30),
C DECIMAL, 
D DATETIME
);
-- Select * from in insert is used to copy the data from another table but the column name and there type should be same
INSERT INTO bhatt5(a,b,c,d) SELECT * FROM bhatt;
SELECT * FROM bhatt5;

-- delete from is use to delete data from the table and wrhere is used to tell where to see for it
DELETE FROM bhatt5 WHERE a=104;
DELETE FROM bhatt5 WHERE b="mayank";

-- sql make sure you are 100% sure about deleting anything so if you are sure about it so we remove safe update from it by set sql_safe_updates=0;
SET sql_safe_updates=0;

-- it is same like truncate to remove all data from it 
DELETE FROM bhatt5;

-- 22/07/2025 (Tuseday)
-- useing batch4pm
USE batch4pm;

-- Limit 1 is used to give the number of lines of data you want
SELECT e_id,e_name FROM employee LIMIT 1;

-- Drop tables if already exist
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;

-- Create Department Table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    Location VARCHAR(100)
);

INSERT INTO Department (DepartmentID, DepartmentName, Location) VALUES
(1, 'HR', 'Delhi'),
(2, 'Finance', 'Mumbai'),
(3, 'IT', 'Bangalore'),
(4, 'Sales', 'Chennai'),
(5, 'Support', 'Hyderabad');

-- Create Employee Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    ManagerID INT,
    Salary DECIMAL(10, 2),
    JoinDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

INSERT INTO Employee (EmployeeID, Name, DepartmentID, ManagerID, Salary, JoinDate) VALUES
(101, 'Amit Sharma', 1, NULL, 60000, '2022-01-15'),
(102, 'Bhavna Mehra', 2, 101, 55000, '2022-03-18'),
(103, 'Chirag Verma', 3, 101, 65000, '2022-05-22'),
(104, 'Deepa Rawat', 3, 103, 70000, '2022-07-25'),
(105, 'Eshan Singh', 4, 101, 48000, '2022-09-29'),
(106, 'Farah Khan', 5, 101, 52000, '2022-11-30'),
(107, 'Gaurav Patel', 1, 101, 58000, '2023-01-10'),
(108, 'Heena Das', 2, 102, 61000, '2023-02-15'),
(109, 'Imran Ali', 3, 103, 54000, '2023-03-21'),
(110, 'Jyoti Rana', 4, 105, 47000, '2023-04-18'),
(111, 'Kunal Joshi', 5, 106, 51000, '2023-05-20'),
(112, 'Lata Sharma', NULL, NULL, 40000, '2023-06-12'),  -- No department (test LEFT JOIN)
(113, 'Manoj Bhat', 1, 107, 63000, '2023-07-25'),
(114, 'Nisha Jain', 2, 108, 57000, '2023-08-30'),
(115, 'Omkar Rao', 3, 104, 75000, '2023-09-05'),
(116, 'Pooja Sen', 4, 110, 49000, '2023-10-10'),
(117, 'Qasim Sheikh', NULL, NULL, 42000, '2023-11-11'), -- No department
(118, 'Ritika Ghosh', 5, 106, 53000, '2023-12-01'),
(119, 'Sanjay Sinha', 1, 107, 62000, '2024-01-01'),
(120, 'Tina Kaur', 2, 102, 58000, '2024-02-12'),
(121, 'Uday Bhatt', 3, NULL, 67000, '2024-03-15');

SELECT * FROM Employee;

-- Where is used to see where is the thing 
SELECT * FROM Employee WHERE EmployeeID=107;
SELECT * FROM Employee WHERE DepartmentID=1;
SELECT * FROM Employee WHERE ManagerID=107;

-- You can use ( +, -, *, / ) in select 
SELECT Salary+1000 FROM Employee;
SELECT (salary+(salary*10)/100) FROM Employee;
SELECT salary*1.10 FROM Employee;

-- you can use ( <, >, <=, >=, != ) in select
SELECT * FROM Employee WHERE salary<50000;
SELECT * FROM Employee WHERE salary>50000;
SELECT * FROM Employee WHERE salary<=50000;
SELECT * FROM Employee WHERE salary>=50000;
SELECT * FROM Employee WHERE salary!=50000;

-- and in select is to confirm both statement 
 SELECT * FROM Employee WHERE salary>50000 AND DepartmentID=1;
-- or in select is to confirm if first statment is ture if not check for second name
SELECT * FROM Employee WHERE salary>50000 OR ManagerID=102;

-- we can use ( count, sum, min, max, avg ) in select
SELECT COUNT(*) FROM Employee; 
SELECT COUNT(DepartmentID) FROM Employee;
SELECT sum(Salary) FROM Employee; 
SELECT max(Salary) FROM Employee; 
SELECT min(Salary) FROM Employee; 
SELECT avg(Salary) FROM Employee;

-- 23/7/2025 (wednesday)
-- useing the database
USE batch4pm;

-- use of (where) and (and) in select 
SELECT * FROM employee WHERE salary!=50000 and DepartmentID=1;

-- use of like Operator in select like is used to show like this one
SELECT * FROM employee WHERE name LIKE "A%"; -- any value start with a
SELECT * FROM employee WHERE name LIKE "%A"; -- any value that end with a
SELECT * FROM employee WHERE name LIKE "%A%"; -- any value that have a in it
SELECT * FROM employee WHERE name LIKE "_A%"; -- any value that have a in second position
SELECT * FROM employee WHERE name LIKE "A_%"; -- any value that start with a and are at least 2 charaters in length
SELECT * FROM employee WHERE name LIKE "A__%"; -- any value that start with a and are at least 3 charaters in length
SELECT * FROM employee WHERE name LIKE "A%A"; -- find any values that start with a and end with a 

-- use of distinct is it find the unique values in data 
SELECT DISTINCT(departmentID) FROM employee;
SELECT DISTINCT(departmentID) FROM employee where DepartmentID IS NOT NULL;

-- use of IN is which was these value in it
SELECT * FROM employee WHERE name IN ("Amit Sharma", "uday Bhatt", "Manyank Bhatt");
SELECT * FROM employee WHERE salary IN (40000,55000,40000);

-- (between) and (add) is used to see anything which between the data
SELECT * FROM employee WHERE salary BETWEEN 40000 AND 55000;

-- order by is used order things in table in asc and desc
SELECT * FROM employee ORDER BY SALARY ASC;
SELECT * FROM employee ORDER BY SALARY DESC;

-- group by is used in makeing the group 
SELECT DepartmentID,sum(Salary) FROM Employee GROUP BY DepartmentID;
SELECT DepartmentID,max(Salary) FROM Employee GROUP BY DepartmentID;
SELECT DepartmentID,min(Salary) FROM Employee GROUP BY DepartmentID;
SELECT DepartmentID,avg(Salary) FROM Employee GROUP BY DepartmentID;


SELECT * FROM employee;
-- use of count() and group by in one line
SELECT DepartmentID,COUNT(*) FROM Employee GROUP BY DepartmentID;
SELECT EmployeeID,COUNT(*) FROM Employee GROUP BY EmployeeID;

-- use of count(), group by and order by in one line;
SELECT DepartmentID,COUNT() FROM Employee GROUP BY DepartmentID ORDER BY COUNT();


-- 24/7/2025 (Thursday) 

-- using the database
USE batch4pm;

-- did some question 
SELECT departmentID,sum(salary) AS total_salary FROM Employee GROUP BY DepartmentID HAVING Total_salary>150000;
SELECT departmentID,avg(salary) AS avg_salary FROM Employee GROUP BY DepartmentID HAVING avg_salary<55000; 
SELECT ManagerID,count(EmployeeID) AS employee FROM Employee GROUP BY ManagerID HAVING Employee>2 AND ManagerID IS NOT NULL; 
SELECT ManagerID,count(EmployeeID) AS employee FROM Employee WHERE managerID IS NOT NULL GROUP BY ManagerID HAVING Employee>2; 
SELECT * FROM Employee WHERE DepartmentID IS NULL;
SELECT * FROM employee ORDER BY JoinDate DESC;
SELECT * FROM employee ORDER BY Name ASC;
SELECT * FROM Department ORDER BY departmentName ASC;
SELECT * FROM employee ORDER BY salary DESC LIMIT 5;

-- round used in int to round things up 
SELECT EmployeeID,Name,round(((salary-(salary*5)/100))) as salary FROM Employee;


-- 7/25/2025 (Friday)
USE batch4pm;

-- Merge to join two table in one select but it need something same in both table to join
-- Some ude case of Merge
SELECT * FROM Employee, department WHERE Employee.DepartmentID=department.departmentID;
SELECT * FROM Employee E, department D WHERE E.DepartmentID=D.departmentID;
SELECT E.EmployeeID,E.Name,D.DepartmentID,D.DepartmentName,E.ManagerID,D.Location,E.salary,E.JoinDate FROM Employee E, department D 
 WHERE E.DepartmentID=D.departmentID;
SELECT E.EmployeeID,E.Name,D.DepartmentID,D.DepartmentName,E.ManagerID,D.Location,E.salary,E.JoinDate FROM Employee E, department D 
 WHERE E.DepartmentID=D.departmentID AND D.DepartmentName="hr";
SELECT E.EmployeeID,E.Name,D.DepartmentID,D.DepartmentName,E.ManagerID,D.Location,E.salary,E.JoinDate FROM Employee E, department D 
 WHERE E.DepartmentID=D.departmentID AND D.LOCaTION="Bangalore";
SELECT count(EmployeeID) FROM Employee E, department D 
 WHERE E.DepartmentID=D.departmentID AND D.DepartmentName="IT";

-- Returns only the rows where there is a match in both tables (common in both)
SELECT * FROM EMPLOYEE AS E INNER JOIN DEPARTMENT D ON E.DepartmentID=D.departmentID;

-- Returns all rows from the left table, plus matching rows from the right table. 
-- If there’s no match in the right table, you get NULLs
SELECT * FROM EMPLOYEE AS E LEFT JOIN DEPARTMENT D ON E.DepartmentID=D.departmentID;

-- Returns all rows from the right table, plus matching rows from the left table.
-- If there’s no match in the left table, you get NULLs
SELECT * FROM EMPLOYEE AS E RIGHT JOIN DEPARTMENT D ON E.DepartmentID=D.departmentID;

-- Returns all rows from both tables. If there’s no match in one table, the other side shows NULLs 
-- UNION is used to combine the results of two or more SELECT queries into a single result set — and it removes duplicate rows by default.
SELECT * FROM EMPLOYEE AS E LEFT JOIN DEPARTMENT D ON E.DepartmentID=D.departmentID UNION 
SELECT * FROM EMPLOYEE AS E RIGHT JOIN DEPARTMENT D ON E.DepartmentID=D.departmentID;

-- UNION ALL is used to combine the results of two or more SELECT queries, just like UNION, but it does NOT remove duplicates.
SELECT * FROM EMPLOYEE AS E LEFT JOIN DEPARTMENT D ON E.DepartmentID=D.departmentID 
UNION ALL
SELECT * FROM EMPLOYEE AS E RIGHT JOIN DEPARTMENT D ON E.DepartmentID=D.departmentID;

-- 29/7/2025 (Tuesday)

-- Using Database
USE batch4pm;
Select * from project1;


-- creating table 
CREATE TABLE PROJECT(
P_id int primary key auto_increment,
name varchar(50),
no_emp int,
r_date date
);

Insert into project (P_id,name,no_emp,r_date) values
(1,'AI Chatbot', 5, '2023-08-01');
INSERT INTO project(name, no_emp, R_date) VALUES
('Fraud Detection', 3, '2023-09-15'),
('Sales Dashboard', 4, '2023-07-10'),
('Customer Segmentation', 2, '2023-06-20'),
('HR Analytics', 6, '2023-10-01'),
('Inventory Forecasting', 3, '2023-09-25'),
('Loan Default Prediction', 5, '2023-08-10'),
('Healthcare AI', 2,'2023-07-22');

-- creating table 
CREATE TABLE PROJECT1(
P_id int primary key auto_increment,
name varchar(50),
no_emp int,
r_date date
);

INSERT INTO project1 (p_id,name, no_emp, R_date) VALUES
(1,'AI Chatbot', 5, '2023-08-01'),
(2,'Fraud Detection', 3, '2023-09-15'),
(3,'Sales Dashboard', 4, '2023-07-10'),
(18,'Customer Segmentation', 2, '2023-06-20'),
(10,'HR Analytics', 6, '2023-10-01'),
(12,'Inventory Forecasting', 3, '2023-09-25'),
(15,'Loan Default Prediction', 5, '2023-08-10'),
(17,'Healthcare AI', 2,'2023-07-22');

-- creating table 
create table employee11(
e_id int primary key auto_increment,
E_name varchar(30),
department varchar(30),
p_id int,
salary int
);

INSERT INTO employee11(E_id,E_name, department, p_id, salary) VALUES
(1,"mayank",'Analytics',1,50000);
INSERT INTO employee11(E_name, department, p_id, salary) VALUES
('Rahul', 'Data Science', 1, 55000),
('Priya', 'Data Science', 1, 58000),
('Ankit', 'Analytics', 12, 60000),
('Neha', 'BI', 3, 50000),
('Karan', 'Marketing', 3, 45000),
('Sonal', 'HR', NULL, 47000),
('Deepak', 'Finance', NULL, 52000),
('Simran', 'Data Science', 4, 61000),
('Amit', 'Marketing', 5, 53000),
('Manish', 'Analytics', 5, 56000),
('Pooja', 'HR', 11, 49000),
('Rohit', 'Analytics', NULL, 62000),
('Meena', 'IT', 4, 65000),
('Vikas', 'Healthcare', 2, 50000),
('Rani', 'Healthcare',NULL,48000),
('Ajay', 'BI',3, 51000);

-- Inner Join
select * from Employee11 E inner join Project P ON E.P_Id=P.P_Id;

-- Left Join
select * from Employee11 E Left join Project P ON E.P_Id=P.P_Id;

-- Right Jion
select * from Employee11 E Right join Project P ON E.P_Id=P.P_Id;

-- Union Join
select * from project 
union 
select * from project1;

-- Union all
select * from project
union all
select * from project2;

-- Creating table to see for cross join
create table cloths(
id int,
name varchar (50)
);

insert into cloths values(101,"Jens"),(102,"shirt"),(103,"shoe");

create table colour(
id int,
name varchar (50)
);

insert into colour values(1,"red"),(2,"yellow"),(3,"green");

-- CROSS JOIN returns the Cartesian product of two tables — meaning it combines every row from the first table with every row from the second.
select * from cloths cross join colour;
select c1.name, c2.name from cloths c1 cross join colour c2;


-- 30/7/2025 (wednesday)
 
-- using database
use batch4pm;

select * from employee;

-- distinct is like unique used in select 
select distinct managerId FROM EMPLOYEE;

-- A SELF JOIN is when a table is joined with itself — it's useful when you want to compare rows within the same table, 
-- like finding a manager of an employee, or comparing items in a hierarchy.
SELECT * FROM EMPLOYEE E1 JOIN EMPLOYEE E2 ON E1.EMPLOYEEid= E2.MANAGERid;
SELECT E1.NAME AS EMPLOYEE_NAME ,E2.NAME AS MANAGER FROM EMPLOYEE E1 JOIN EMPLOYEE E2 ON E1.MANAGERid = E2.EMPLOYEEid;
SELECT distinct E2.NAME AS MANAGER FROM EMPLOYEE E1 JOIN EMPLOYEE E2 ON E1.MANAGERid = E2.EMPLOYEEid;


-- 31/1/2025 (Thursday)

-- using database
use batch4pm;

SELECT E1.NAME AS EMPLOYEE_NAME, E2.NAME AS MANAGER, E1.DEPARTMENTID FROM EMPLOYEE E1 JOIN EMPLOYEE E2 ON E1.MANAGERid = E2.EMPLOYEEid 
WHERE E1.DEPARTMENTID != E2.DEPARTMENTID;

-- A subquery is a SQL query that is written inside another query.
-- It helps you get data that the main (outer) query depends on.
select name,max(salary) from employee;
select * from employee where salary=75000;

-- Uncorrelated= The inner query is independent of the outer query. 
-- It executes once, returning a set of results used by the outer query.
select * from employee where salary = (select max(salary) from employee);
-- find the record of employee who get more salary then avg salary
SELECT Name, Salary FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee);
-- find the name of emp whose salary is high then manager
SELECT Name, Salary FROM Employee WHERE Salary > (SELECT Salary FROM Employee where employeeID = managerID);

-- Correlated= The inner query depends on the outer query. 
-- Each iteration of the outer query runs the inner query with the current row's value.
SELECT Name, Salary FROM Employee E WHERE Salary > (SELECT Salary FROM Employee WHERE EmployeeID = E.ManagerID);

-- Nested= Multiple subqueries are nested within each other. 
-- The innermost query executes first, and the results are used by the next query, and so on.
select *,(select avg(salary) from employee ) as avg_salary from employee;


-- 1/8/2025 (friday)

-- Test day

-- 5/8/2025 (Tuesday)

-- Using the Database
use batch4pm;

SELECT E1.NAME AS EMPLOYEE_NAME, E2.NAME AS MANAGER, E1.DEPARTMENTID FROM EMPLOYEE E1 JOIN EMPLOYEE E2 ON E1.MANAGERid = E2.EMPLOYEEid 
WHERE E1.DEPARTMENTID != E2.DEPARTMENTID;
select name,max(salary) from employee;
select * from employee where salary=75000;

-- subquery
select * from employee where salary = (select max(salary) from employee);
-- find the record of employee who get more salary then avg salary
SELECT Name, Salary FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee);
-- find the name of emp whose sAlary is high then manager
SELECT Name, Salary FROM Employee WHERE Salary > (SELECT Salary FROM Employee where employeeID = managerID);
SELECT Name, Salary FROM Employee E WHERE Salary > (SELECT Salary FROM Employee WHERE EmployeeID = E.ManagerID);
select *,(select avg(salary) from employee ) as avg_salary from employee;


use homework;

Select * from employee;
Select * from Department;


-- 1. Find the employee(s) who earns the maximum salary.
select name from employee where salary = (select max(salary) from employee);

-- 2. List employees who earn more than the average salary of all employees.
SELECT Name, Salary FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee);

-- 3. Find the department name of the employee ‘Omkar Rao’.
select departmentName from department where departmentID = (select departmentID from employee where name = "Omkar Rao");

-- QUESTION
-- 1. List all employees working in department ID 3.
SELECT * FROM Employee WHERE departmentID=3;

-- 2. Show details of employees who joined after '2023-01-01'.
SELECT * FROM Employee WHERE JoinDate='2023-01-01';

-- 3. Find employees with salary greater than 60000.
SELECT * FROM Employee WHERE Salary>60000;

-- 4. Show employees who do not have any department assigned.
SELECT * FROM Employee WHERE DepartmentID is null; 					-- correct  

-- 5. Find employees who report to ManagerID 101.
SELECT * FROM Employee WHERE ManagerID=101;

-- 6. List all distinct department IDs from Employee table.
SELECT DISTINCT(departmentID) FROM employee;

-- 7. Show distinct salaries from the Employee table.
SELECT DISTINCT(Salary) FROM employee;

-- 8. List all unique ManagerIDs assigned to employees.
SELECT DISTINCT(ManagerID) FROM employee;

-- 9. Display all distinct locations from the Department table.
SELECT DISTINCT(location) FROM Department;

-- 10. Show distinct join dates from the Employee table.
SELECT DISTINCT(JoinDate) FROM Employee;

-- 11. Show employees who work in department 2 and earn more than 55000.
SELECT * FROM Employee where departmentID=2 and Salary>55000;

-- 12. List employees who joined in 2023 or earn less than 50000.
SELECT * FROM Employee where JoinDate LIKE "%3" or Salary<50000; 				

-- 13. Show employees who do not belong to department 1.
SELECT * FROM Employee where departmentID!=1;

-- 14. Find employees who joined after '2023-01-01' and have salary < 60000.
SELECT * FROM Employee where JoinDate>2023-01-01 and Salary<60000; 						

-- 15. Show employees whose department is 3 or 4 and salary is greater than 60000.
SELECT * FROM Employee where DepartmentID=3 or 4 and Salary<60000;

-- 16. Display each employee’s salary increased by 10%.
SELECT salary*1.10 FROM Employee;

-- 17. Show salary after 2000 deduction for all employees.
SELECT salary-2000 FROM Employee;

-- 18. List employees with bonus = salary * 0.2.
SELECT salary+salary*0.2 FROM Employee;

-- 19. Find employees whose salary + 5000 is more than 60000.
SELECT salary+5000 FROM Employee WHERE Salary>60000;

-- 20. Show employee names and their yearly salary (monthly salary * 12).
SELECT name,salary*12 FROM Employee;

-- 21. Find the total salary paid to all employees.
SELECT sum(Salary) FROM Employee; 

-- 22. Count the number of employees in department 3.
SELECT count(EmployeeID) FROM Employee WHERE DepartmentID=3; 

-- 23. Find average salary of employees in department 1.
SELECT avg(salary) FROM Employee WHERE DepartmentID=1;

-- 24. Show minimum and maximum salary among all employees.
SELECT max(Salary),min(Salary) FROM Employee; 

-- 25. Find the number of employees without department (DepartmentID IS NULL).
SELECT count(EmployeeID) FROM Employee WHERE DepartmentID=NULL;

-- 26. List employees working in departments 1, 2, and 5.
SELECT DepartmentID,count(EmployeeID) FROM Employee GROUP BY DepartmentID;

-- 27. Show employees with EmployeeID IN (101, 105, 110).
SELECT * FROM employee WHERE employeeID IN (101,105,110);

-- 28. Show departments located in ('Delhi', 'Mumbai', 'Chennai').
SELECT DepartmentName FROM Department WHERE Location IN ('Delhi', 'Mumbai', 'Chennai');

-- 29. Find employees whose ManagerID is in (101, 102, 103).
SELECT EmployeeID FROM employee WHERE ManagerID IN (101,102,103);

-- 30. Display employees who joined in months with join date in ('2023-03-21', '2023-04-18').
SELECT EmployeeID FROM employee WHERE JoinDate BETWEEN  '2023-03-21' AND '2023-04-18';

-- 31. Show employees with salary between 50000 and 60000.
SELECT * FROM employee WHERE salary BETWEEN 50000 AND 60000;

-- 32. List employees who joined between '2023-01-01' and '2023-12-31'.
SELECT * FROM employee WHERE JoinDate BETWEEN '2023-01-01' AND '2023-12-31';

-- 33. Display departments with DepartmentID between 2 and 4.
SELECT DepartmentName,DepartmentID FROM Department WHERE DepartmentID BETWEEN 2 AND 4;				-- ask sir

-- 34. Show employees whose EmployeeID is between 110 and 120.
SELECT Name FROM employee WHERE EmployeeID BETWEEN 110 and 120;

-- 35. Find employees whose salary + 1000 lies between 60000 and 70000.
SELECT Name,(salary+1000) from employee where salary between 60000 and 70000;

-- 36. Find employees whose name starts with 'A'.
SELECT * FROM employee WHERE name LIKE "A%";

-- 37. Show employees whose name ends with 'a'.
SELECT * FROM employee WHERE name LIKE "%A";

-- 38. List employees whose name contains 'an'.
SELECT * FROM employee WHERE name LIKE "%an%";

-- 39. Find employees whose name has second character as 'h'.
SELECT * FROM employee WHERE name LIKE "_a%";

-- 40. Display employees whose name starts with any 4-letter word followed by 'a'.
SELECT * FROM employee WHERE name LIKE "__a%";


-- 41. Show all employees ordered by salary in ascending order.
SELECT * FROM employee ORDER BY SALARY ASC;

-- 42. List employees ordered by JoinDate descending.
SELECT * FROM employee ORDER BY JoinDate desc;

-- 43. Show departments ordered by DepartmentName alphabetically.
SELECT * FROM department ORDER BY departmentName ASC;

-- 44. Display employees ordered by department and salary.
SELECT * FROM Employee ORDER BY DepartmentID asc, salary ASC;

-- 45. List employees ordered by salary descending and then by name ascending.
SELECT * FROM Employee ORDER BY Salary DESC, Name ASC;

-- 46. Find employees from department 3 with salary > average salary of all employees.
SELECT * FROM Employee WHERE DepartmentID = 3 AND Salary > (SELECT AVG(Salary) FROM Employee);

-- 47. List names of employees with salary > 50000 and name contains 'a'
SELECT Name,salary FROM Employee WHERE name like"%a%" AND Salary > 50000;

-- 48. Show count of employees for each department using GROUP BY.
select DepartmentID,count(EmployeeID) from employee GROUP BY DepartmentID;

-- 49. Find top 5 highest paid employees using ORDER BY and LIMIT.
SELECT * FROM employee ORDER BY salary DESC limit 5;

-- 50. List employees who joined in 2023, belong to department 4 or 5, and earn less than 50000.
select * from employee WHERE JoinDate LIke "2023%" AND DepartmentID IN (4, 5)AND Salary < 50000;

SELECT * FROM Employee;
SELECT * FROM Department;




-- 06/08/25
use College;
Select * from employee where salary=(Select max(salary) from Employee) ;

-- Display record of employee whose belong to department in mumbai
Select * from Employee where DepartmentID  IN (Select DepartmentID from Department where Location="Mumbai");

-- Display the record of Employee working in department name HR,IT
Select * from Employee where DepartmentID IN(select DepartmentID from Department where Departmentname IN("HR","IT")); 
-- Find employee who earns the highest salary in their Department
Select * from Employee where (DepartmentID,Salary) IN (Select DepartmentID,Max(salary) from Employee Group BY DepartmentID);

-- Find employee who share (departmentId,ManagerId) with those earning more than 60000.

-- Find employee whose (departmentid,salary) match of those employee join in 2023.
Select  DepartmentId,salary,name,JoinDate from Employee where JoinDate like "2023%" and DepartmentId is not null ;

-- Find the record of employee whose belong to particular department.
select * from Employee E where exists(select * from Department D where E.DepartmentID=D.DepartmentID);

-- employee whose department is located in hyderabad
Select * from Employee E where exists(select * from Department D where E.DepartmentID=D.DepartmentId and Location="Hyderabad");


-- 7/08/2025
-- Date and Time Functions

-- 1 Now
Select Now(); -- Returns current date and time
-- 2 CurDATE()
Select CURDATE(); -- Returns current Date
-- 3 CurTime
select CurTime(); -- Returns Current Time
-- 3 DATE()
Select DATE('2025-08-07 16:40:52') as date;
-- 4. TIME
Select TIME('2025-08-07 16:40:52') as time;
-- 5. MONTH()
Select MONTH('2025-08-07 16:40:52') as month;
-- 6. YEAR()
Select YEAR('2025-08-07 16:40:52') as year;
-- 7. WEEK()
Select WEEK('2025-08-07 16:40:52') as week;
-- 8. DAY()
Select DAY('2025-08-07 16:40:52') as day;
-- 9. MINUTE()
Select MINUTE('2025-08-07 16:40:52') as minute;
-- 8. HOUR
Select HOUR('2025-08-07 16:40:52') as hour;

-- 9. DATEDIFF() -- Calculate the difference between two Dates
Select DATEDIFF('2025-08-07','2024-09-17') as datediff;
-- 10. DATE-ADD()
Select DATE_ADD('2025-08-07',interval 10 day) as new_date;
-- 11. DATE_SUB()
Select DATE_SUB(NOW(),interval 3 month ) as Modified_Date;
Select DATE_SUB(NOW(),interval 3 year ) as Modified_year;
-- 12. DATE FORMAT
Select DATE_FORMAT(NOW(),'%y-%m-%d') AS format_date;
-- 13. FIND WEEKDAYS
Select DAYNAME(NOW()) AS weekday;
-- 14. LAST_DAY
Select LAST_DAY('2025-08-07') AS Last_day;


Select year(CURDATE())-year('2002-03-13')-
(DATE_FORMAT(CURDATE(),'%m%d') < DATE_FORMAT('2002-03-13','%m%d')) AS age;

use college;
-- WINDOWS FUNCTION
-- Over() is used with window functions to perform calculations across a set of rows related to the current row without collapsing them.
select *, avg(salary) over() AS avg_salary from Employee;
-- Over(PARTITION BY Column) is used with window functions to perform calculations across groups of rows that share the same value in that column,
-- without collapsing rows. It's like GROUP BY but keeps all row details visible.
select *, avg(salary) over(PARTITION BY DepartmentID) AS avg_salary from Employee;
select *, min(salary) over(PARTITION BY DepartmentID) AS min_salary from Employee;
-- max,count,sum
select *, max(salary) over(PARTITION BY DepartmentID) AS max_salary from Employee;
select *, count(salary) over(PARTITION BY DepartmentID) AS count_salary from Employee;
select *, sum(salary) over(PARTITION BY DepartmentID) AS sum_salary from Employee;

-- 8/08/2025
-- Windows Functions
select *, max(salary) over() AS max_salary from Employee;

select *, min(salary) over() AS min_salary from Employee;
select *, Avg(salary) over() AS avg_salary from Employee;
select *, count(salary) over() AS count_salary from Employee; 

Select * from (select *, max(salary) over() AS max_salary from Employee) AS E where salary = Max_Salary;
 Select *, Row_number() over() As ROW_NUMBERS From Employee;
 
 -- PARTITION BY
 Select *, Row_number() over(PARTITION BY DepartmentID) As ROW_NUMBERS From Employee;
 
-- ORDER BY
  Select *, Row_number() over(PARTITION BY DepartmentID ORDER BY Salary Desc) As ROW_NUMBERS From Employee;
-- RANK
  Select *, Rank() over() As RANKING From Employee;
  Select *, Rank() over(ORDER BY salary Desc) As RANKING From Employee;
-- DENSE RANK
    Select *, Dense_Rank() over(ORDER BY salary Desc) As RANKING From Employee;
-- Find the record of employee who get Nth highest salary
    Select * from (Select *, Dense_Rank() over(ORDER BY salary Desc) As RANKING From Employee) E where ranking=5;
    use college;
-- 13/08/2015
-- Value/Analytic
-- LEAD() is a window function that lets you access a row's value from the next row without needing a self-join.
Select * ,Lead(salary) over(order by JoinDate desc) As Lead_row  from employee;

-- LAG() is the opposite of LEAD() - it retrieves a value from a previous row in the result set without using a self-join.
select *,Lag(Name) over(order by Joindate desc) As Lag_Row
 from Employee;
-- FIRST_VALUE() Returns the first value in  an ordered set - kind of like saying.
Select * ,first_value(DepartmentId) over(order by DepartmentID desc) As First_values,
-- LAST_VALUE() MYSQL can be misleading because it returns the last vaue in the current window frame,
-- not the overall partition. To truly get the last row in a group,you have to set the window frame manually.
Last_value(DepartmentID) over(order by DepartmentId desc) As Last_Values
 from Employee;
-- Both in One
select *,first_value(Name) over(order by DepartmentID desc) as lead_row,
last_value(Name) over(order by DepartmentID desc) as lag_row
from employee;
 
 # Data import
Create table person2(
S_no int,
Name varchar(40),
age int
);
desc person2;
-- to take data from excel

Load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/PERSON1.csv"
into table Person2
Fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

select * from person2;
select * from person3;
Select * from Students1;


use college;
Select * from Employee;

use batch4pm;
select * from employee11;
