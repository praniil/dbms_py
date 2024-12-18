import psycopg2
from dotenv import load_dotenv
import os

load_dotenv()

dbname = os.getenv("DB_NAME")
user = os.getenv("DB_USER")
password = os.getenv("DB_PASSWORD")
host = os.getenv("DB_HOST")
port = os.getenv("DB_PORT")

connection = psycopg2.connect(
    dbname = dbname,
    user = user,
    password = password,
    host = host,
    port = port,
)

cursor = connection.cursor()

department_table = '''
    CREATE TABLE if not exists Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
    );

    INSERT INTO Departments (dept_id, dept_name) VALUES
    (101, 'HR'),
    (102, 'Engineering'),
    (103, 'Marketing'),
    (104, 'Finance');
'''

cursor.execute(department_table)

employee_table = '''
    CREATE TABLE if not exists Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) references Departments(dept_id)
    );

    INSERT INTO Employees (emp_id, emp_name, dept_id) VALUES
    (1, 'Alice', 101),
    (2, 'Bob', 102),
    (3, 'Charlie', 101),
    (4, 'David', 103),
    (5, 'Eve', 102);
'''
cursor.execute(employee_table)

inner_join = '''
    select * from employees 
    inner join departments 
    on employees.dept_id = departments.dept_id;
'''
cursor.execute(inner_join)
rows = cursor.fetchall()

for row in rows:
    print(row)

connection.commit()

print("connected to the database")
cursor.close()
connection.close()