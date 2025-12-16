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

