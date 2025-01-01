-- Create the Departments table
CREATE TABLE Depart (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Insert data into Departments
INSERT INTO Depart (DepartmentID, DepartmentName)
VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing'),
(5, 'Sales'),
(6, 'IT Support');

-- Create the Employees table
CREATE TABLE Employeee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
	Country VARCHAR(50),
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Depart(DepartmentID)
);

-- Insert data into Employees
INSERT INTO Employeee (EmployeeID, EmployeeName, DepartmentID, Country, Salary)
VALUES
(101, 'Alice', 1, 'USA', 55000.00),
(102, 'Bob', 2, 'AUS', 60000.00),
(103, 'Charlie', 3, 'USA', 75000.00),
(104, 'Diana', 3, 'NEP', 72000.00),
(105, 'Eve', 4, 'AUS', 50000.00),
(106, 'Frank', 5, 'AUS', 65000.00);

select Depart.DepartmentID, Employeee.EmployeeName 
From Depart 
Inner Join Employeee on
Depart.DepartmentID = Employeee.DepartmentID;

--aggregate functions
select count(*) from Employeee;
select sum(salary) from Employeee;
select avg(salary) from Employeee;
select min(salary) from Employeee;

--group
select country, count(*) as number
from employeee
group by country;

select DepartmentID, sum(salary) as Total
from employeee
group by DepartmentID;