CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY, 
    Name VARCHAR(100) NOT NULL,               
    Age INT NOT NULL,                         
    Occupation VARCHAR(50) NOT NULL,          
    Salary DECIMAL(10, 2) NOT NULL            
);

INSERT INTO Employee (EmployeeID, Name, Age, Occupation, Salary)
VALUES 
    (1, 'John Doe', 30, 'Software Engineer', 75000.00),
    (2, 'Jane Smith', 45, 'Project Manager', 90000.00),
    (3, 'Emily Johnson', 27, 'Data Analyst', 60000.00),
    (4, 'Michael Brown', 40, 'HR Manager', 85000.00),
    (5, 'Sophia Davis', 35, 'Marketing Specialist', 70000.00),
    (6, 'David Wilson', 50, 'CTO', 150000.00),
    (7, 'Olivia Garcia', 28, 'UX Designer', 65000.00),
    (8, 'Liam Martinez', 32, 'DevOps Engineer', 80000.00),
    (9, 'Isabella Lopez', 26, 'Content Writer', 45000.00),
    (10, 'Ethan Thomas', 38, 'Finance Analyst', 72000.00);

--get all the employees
SELECT * FROM Employee;
--get employee whose age is greater than 20
SELECT name From Employee where age > 20;
--get employee where name starts with J
Select name from employee where name like 'J%';
--get employee where name has 8 chars
Select name from employee where name like '________'; --one underscore is one char
--get employee in ascending order of age
select name from employee order by age asc;
--get employee in descending order of salary
select name from employee order by salary desc;

--specify the number of records to return
select name from employee limit 5;	--returns first 5 records
select distinct occupation from employee;	--returns the distinct occupation in the employee table

--multiple columns return
select name, occupation from employee limit 5;

--and or
select name, occupation, salary from employee where salary > 45000.00 and salary < 100000.00;
select name, occupation, salary from employee where salary > 100000.00 or salary < 50000.00 or occupation = 'Data Analyst' limit 5;



