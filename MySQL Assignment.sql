CREATE DATABASE ASSSIGNMENT;

CREATE TABLE ASSSIGNMENT.EmployeeDetails (
  EmpId INT PRIMARY KEY,
  FullName VARCHAR(100) NOT NULL,
  ManagerId INT,
  DateOfJoining DATE,
  City VARCHAR(50)
);

SELECT * FROM ASSSIGNMENT.EmployeeDetails;

INSERT INTO  ASSSIGNMENT.EmployeeDetails(EmpId,FullName,ManagerId,DateOfJoining,City)
VALUES(101,"Marcus Saul",301,"2001/01/21","Paris");

INSERT INTO  ASSSIGNMENT.EmployeeDetails(EmpId,FullName,ManagerId,DateOfJoining,City)
VALUES(102,"Walter White",302,"2002/02/22","Toronto");

INSERT INTO  ASSSIGNMENT.EmployeeDetails(EmpId,FullName,ManagerId,DateOfJoining,City)
VALUES(103,"Jessi Pinkman",303,"2003/03/23","Los Angeles");

INSERT INTO  ASSSIGNMENT.EmployeeDetails(EmpId,FullName,ManagerId,DateOfJoining,City)
VALUES(104,"Hank Saw",304,"2004/04/24","New York");

INSERT INTO  ASSSIGNMENT.EmployeeDetails(EmpId,FullName,ManagerId,DateOfJoining,City)
VALUES(105,"Skylar White",305,"2005/05/25","Dalas");


CREATE TABLE ASSSIGNMENT.EmployeeSalary (
  EmpId INT PRIMARY KEY,
  Project VARCHAR(100) NOT NULL,
  Salary DECIMAL(10,2) NOT NULL,
  Variable DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (EmpId) REFERENCES EmployeeDetails(EmpId)
);

SELECT * FROM ASSSIGNMENT.EmployeeSalary;

INSERT INTO  ASSSIGNMENT.EmployeeSalary(EmpId,Project,Salary,Variable)
VALUES(101,"Amazon",80000,500);

INSERT INTO  ASSSIGNMENT.EmployeeSalary(EmpId,Project,Salary,Variable)
VALUES(102,"Myntra",120000,1000);

INSERT INTO  ASSSIGNMENT.EmployeeSalary(EmpId,Project,Salary,Variable)
VALUES(103,"Flipkart",150000,1500);

INSERT INTO  ASSSIGNMENT.EmployeeSalary(EmpId,Project,Salary,Variable)
VALUES(104,"Nyyka",180000,2000);

INSERT INTO  ASSSIGNMENT.EmployeeSalary(EmpId,Project,Salary,Variable)
VALUES(105,"Snapdeal",200000,2500);

-- SQL Query to fetch records that are present in one table but not in another table.

SELECT ASSSIGNMENT.EmployeeDetails.*
FROM ASSSIGNMENT.EmployeeDetails
LEFT JOIN ASSSIGNMENT.EmployeeSalary ON ASSSIGNMENT.EmployeeDetails.EmpId = ASSSIGNMENT.EmployeeSalary.Variable
WHERE ASSSIGNMENT.EmployeeSalary.Variable IS NULL;

-- SQL query to fetch all the employees who are not working on any project.

SELECT EmpId 
FROM ASSSIGNMENT.EmployeeSalary
WHERE Project IS NULL;

-- SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020.

SELECT * FROM ASSSIGNMENT.EmployeeDetails
WHERE DateOfJoining BETWEEN '2020/01/01'
AND '2020/12/31';

-- Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.

SELECT ASSSIGNMENT.EmployeeDetails.*
FROM ASSSIGNMENT.EmployeeDetails
INNER JOIN ASSSIGNMENT.EmployeeSalary ON ASSSIGNMENT.EmployeeDetails.EmpId = ASSSIGNMENT.EmployeeSalary.EmpId;

-- Write an SQL query to fetch a project-wise count of employees.

SELECT Project, COUNT(EmpId) as NumEmployees
FROM ASSSIGNMENT.EmployeeSalary
GROUP BY Project;

-- Fetch employee names and salaries even if the salary value is not present for the employee.

SELECT ASSSIGNMENT.EmployeeDetails.FullName, ASSSIGNMENT.EmployeeSalary.Salary
FROM ASSSIGNMENT.EmployeeDetails
LEFT JOIN ASSSIGNMENT.EmployeeSalary ON ASSSIGNMENT.EmployeeDetails.EmpId = ASSSIGNMENT.EmployeeSalary.EmpId;

-- Write an SQL query to fetch all the Employees who are also managers.

SELECT e1.FullName as EmployeeName, e2.FullName as ManagerName
FROM ASSSIGNMENT.EmployeeDetails e1
INNER JOIN ASSSIGNMENT.EmployeeDetails e2 ON e1.EmpId = e2.ManagerId;


-- Write an SQL query to fetch duplicate records from EmployeeDetails.

SELECT EmpId, COUNT(*) as NumDuplicates
FROM ASSSIGNMENT.EmployeeDetails
GROUP BY EmpId
HAVING COUNT(*) > 1;

-- Write an SQL query to fetch only odd rows from the table.

SELECT *
FROM ASSSIGNMENT.EmployeeDetails
WHERE MOD(EmpId, 2) = 1;

-- Write a query to find the 3rd highest salary from a table without top or limit keyword.

SELECT Salary
FROM (
  SELECT Salary, ROW_NUMBER() OVER (ORDER BY Salary DESC) as RowNum
  FROM ASSSIGNMENT.EmployeeSalary
) as Salaries
WHERE RowNum = 3;

