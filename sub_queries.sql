create database subqueries_class;

use subqueries_class;

create table subqueries(
emp_id int ,
emp_name varchar(20),
dept_id int,
salary int,
age int
);

insert into subqueries(emp_id,emp_name,dept_id,salary,age)
values
(1,"john",101,50000,28),
(2,"emma",101,65000,32),
(3,"raj",102,45000,26),
(4,"meera",103,70000,38),
(5,"ravi",102,48000,30),
(6,"naina",103,52000,29),
(7,"alex",101,58000,31);

select*from subqueries;

create table department(
dept_id int,
dept_name varchar(20)
);

insert into department(dept_id,dept_name)
values
(101,"sales"),
(102,"marketing"),
(103,"finance");

select*from department;

-- find employees whose salary is greater than the average salary. 

select emp_name
from subqueries
where salary > (select avg(salary) from subqueries);

-- find employees who work in the sales department

select emp_name
from subqueries 
where dept_id=(select dept_id from department where dept_name="sales");

#subqueries_based(assignment)

create table employees1(
emp_id int,
emp_name varchar(20),
dept_name varchar(20),
salary int,
manager_id int);

insert into employees1(emp_id,emp_name,dept_name,salary,manager_id)
values
(1,"Arjun","HR",40000,NULL),
(2,"Neha","IT",65000,5),
(3,"Rohan","IT",55000,5),
(4,"Meera","Finance",70000,NULL),
(5,"Suresh","IT",90000,4),
(6,"Alia","HR",45000,1),
(7,"Karan","Finance",75000,4),
(8,"Rahul","Marketing",30000,NULL),
(9,"Priya","Marketing",35000,8),
(10,"Varun","IT",50000,5);

select * from employees1;

-- 1. List employees earning more than the average salary.

select emp_name
from employees1
where salary>(select avg(salary) from employees1);

-- 2. Find employees who earn the maximum salary.

select emp_name
from employees1
where salary in (select max(salary) from employees1);

-- 3. Find employees working in the same department as ‘Neha’.

select emp_name ,dept_name
from employees1
where dept_name in (select dept_name from employees1 where emp_name="neha");

-- 4. List employees whose salary is higher than Suresh’s salary.

select emp_name ,salary
from employees1
where salary>(select salary from employees1 where emp_name="suresh");

-- 5. Show departments where the minimum salary is less than 40,000.

select dept_name
from employees1
where salary in (select min(salary) from employees1 where salary < 40000);

-- 6. Find employees who do not have a manager.

select emp_name
from employees1
where emp_name in (select emp_name from employees1 where manager_id is null);

-- 7. Find employees who report to the same manager as Rohan.

select emp_name 
from employees1
where manager_id in (select manager_id from employees1 where emp_name like "rohan");

-- 8. Show employees whose salary is in the bottom 3.

select emp_name,salary 
from employees1
where salary in (select salary from (select salary from employees1 order by salary asc limit 3) as s);

-- 9. Show employees whose salary is within the top 3.

select emp_name,salary
from employees1
where salary in (select salary from(select salary from employees1 order by salary desc limit 3) as s);

-- 10. Find employees earning more than the HR department 's average salary.

select emp_name,dept_name,salary
from employees1
where salary>(select avg(salary) from employees1 where dept_name like "Hr");


-- 11. List employees having the same salary as Priya.

select emp_name,salary
from employees1
where salary in (select salary from employees1 where emp_name like "priya");

-- 12. Count employees who earn below overall average.

select count(emp_id) as avg_salary
from employees1
where salary<(select avg(salary) from employees1 );

-- 13. Show employees whose manager earns more than 70,000.

select emp_name,salary
from employees1
where manager_id in (select manager_id from employees1 where salary>70000);


-- 14. Display employees in departments where more than 2 employees work.

select emp_name,dept_name
from employees1
where dept_name =(select dept_name from employees1
group by dept_name
having count(emp_name)>2);

-- 15. Show departments where the average salary is above company average.

select dept_name,avg(salary),(SELECT AVG(salary) FROM employees1) as avg_salary
from employees1
GROUP BY dept_name
HAVING AVG(salary)>
(SELECT AVG(salary) FROM employees1);

-- 16. Find the 2nd highest salary.

select emp_name,salary
from employees1
where salary< (select max(salary) from employees1)
ORDER BY salary DESC
LIMIT 1;

-- 17. Employees with salaries greater than the average salary of their manager’s team.

select emp_name,salary
from employees1 e
where salary >
(select avg(salary) from employees1 where manager_id=e.manager_id group by manager_id) ;

-- 18. Show employees who work in a department where Suresh works.

select emp_name,dept_name
from employees1
where dept_name=(select dept_name from employees1 where emp_name like "suresh");

-- 19. List employees whose manager earns the maximum salary.

select emp_name,salary
from employees1
where manager_id=(select manager_id from employees1 where salary =(select max(salary) from employees1));

-- 20. Show employees whose salaries appear more than once.

SELECT emp_name, salary
FROM employees1
WHERE salary IN (
    SELECT salary
    FROM employees1
    GROUP BY salary
    HAVING COUNT(*) > 1
); 
-- 21. List employees earning less than the minimum IT salary.

select emp_name,salary,dept_name
from employees1
where salary<(select min(salary) from employees1 where dept_name="IT");

-- 22. Show employees with salaries higher than the Finance average salary.

select emp_name,salary
from employees1
where salary>(select avg(salary) from employees1 where dept_name="finance");

-- 23. Find employees earning exactly the 3rd highest salary.

select emp_name,salary
from employees1
where salary<(select max(salary) from employees1)
ORDER BY salary DESC LIMIT 1 offset 2;

-- 24. List employees having salary in the same salary group as Meera’s department.

select emp_name,salary,dept_name
from employees1
where dept_name=(select dept_name from employees1 where emp_name="meera");

-- 25. list employee in IT with salary above the IT Average. 

select emp_name,salary,dept_name
from employees1
where dept_name="IT" AND salary>(select avg(salary) from employees1 where dept_name="IT");


