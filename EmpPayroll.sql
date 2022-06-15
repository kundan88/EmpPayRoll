
-------UC-1--Create Database--------

create database payroll_service
use payroll_service


-----UC2--Create Employee PayRoll Table----
create table employee_paroll(ID int IDENTITY(1,1)NOT NULL PRIMARY KEY,
Name varchar(20),
salary int,
StartDate DateTime
);

----UC3--Insert data into table----
INSERT INTO employee_paroll Values('Kundan',10000,'2022-06-12');
INSERT INTO employee_paroll Values('Ravikant',12000,'2022-06-05');
INSERT INTO employee_paroll Values('Shree',16000,'2022-06-11');
INSERT INTO employee_paroll Values('Ritesh',14000,'2022-06-02');

----UC4---Retrive Data----
SELECT * FROM employee_paroll;

----UC5--Salary of Particular Employee---
SELECT salary FROM employee_paroll WHERE Name='Kundan'; 

-----UC6---Add gender Column--
ALTER TABLE employee_paroll ADD Gender varchar(1);
UPDATE employee_paroll SET Gender ='M' WHERE Name='Kundan';

-----UC7---SUM Of Salary----
SELECT Gender, SUM(salary) AS Sum_OF_SALARY FROM employee_paroll GROUP BY Gender ;
-- Average of salary
SELECT Gender, AVG(salary) AS AVG_OF_SALARY FROM employee_paroll GROUP BY Gender ;
--Min salary
SELECT Gender, MIN(salary) AS MIN_SALARY FROM employee_paroll GROUP BY Gender ;
--max salary
SELECT Gender, MAX(salary) AS MAX_SALARY FROM employee_paroll GROUP BY Gender ;
--number of males and females
SELECT Gender, COUNT(Gender) AS GENDER_COUNT FROM employee_paroll GROUP BY Gender;




---UC8-Extend Employee Pay_Roll----

Alter table employee_paroll ADD phone BIGINT, Address varchar(100) default('Latur'),Department varchar(40);

--UC9---

ALTER TABLE Employee_Paroll ADD Basic_Pay BIGINT;
ALTER TABLE Employee_Paroll ADD Deductions BIGINT;
ALTER TABLE Employee_Paroll ADD Taxable_Pay BIGINT;
ALTER TABLE Employee_Paroll ADD Income_Tax BIGINT;
ALTER TABLE Employee_Paroll ADD Net_Pay BIGINT;

--UC10---
INSERT INTO Employee_Paroll(Name,Phone,StartDate,Salary,Gender,Address,Department,Basic_Pay,Deductions,Taxable_Pay,Income_Tax,Net_Pay)
VALUES ('Terissa',09345564,'2022-06-14',347563,'F','Mumbai','Sales',240000,34567,35612,12367,123456);

CREATE TABLE Department(
Dept_ID int NOT NULL,
Name VARCHAR(100),
Dept_Name VARCHAR(50),
CONSTRAINT FK FOREIGN KEY (Dept_ID) REFERENCES Employee_Paroll(ID)
);

INSERT INTO Department(Dept_ID,Name,Dept_Name)
VALUES(1,'Terrisa','Sales'),
(1,'Terrisa','Marketing');

CREATE TABLE Company(
ID int NOT NULL,
CompanyName VARCHAR(100),
CONSTRAINT Foreign_Key FOREIGN KEY (ID) REFERENCES Employee_Paroll(ID)
);


