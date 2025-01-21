-- Write your PostgreSQL query statement below
select CASE 
    WHEN COUNT(DISTINCT salary) < 2 THEN NULL
    ELSE MIN(salary)
    END AS "SecondHighestSalary"
from
    (select distinct salary from employee
    order by salary desc limit 2);