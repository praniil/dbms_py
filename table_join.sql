-- Create the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Insert data into Departments
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing'),
(5, 'Sales'),
(6, 'IT Support');

-- Create the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert data into Employees
INSERT INTO Employees (EmployeeID, EmployeeName, DepartmentID, Salary)
VALUES
(101, 'Alice', 1, 55000.00),
(102, 'Bob', 2, 60000.00),
(103, 'Charlie', 3, 75000.00),
(104, 'Diana', 3, 72000.00),
(105, 'Eve', 4, 50000.00),
(106, 'Frank', 5, 65000.00);

--inner join
select Departments.DepartmentID, Departments.DepartmentName, Employees.EmployeeName
From Departments
Inner join Employees on
Departments.DepartmentID = Employees.DepartmentID;

--left outer join
select Departments.DepartmentID, Departments.DepartmentName, Employees.EmployeeName 
From Departments
Left Join Employees on
Departments.DepartmentID = Employees.DepartmentID;

--right outer join
select Departments.DepartmentID, Departments.DepartmentName, Employees.EmployeeName 
From Departments
Right Join Employees on 
Departments.DepartmentID = Employees.DepartmentID;

--full outer join
select Departments.DepartmentID, Departments.DepartmentName, Employees.EmployeeName 
From Employees
Full Join Departments on
Departments.DepartmentID = Employees.DepartmentID;