CREATE DATABASE joins_concept;
USE joins_concept;

CREATE TABLE students
	(
		student_id INT PRIMARY KEY AUTO_INCREMENT,
        student_name VARCHAR(50),
        course_id INT
    );
INSERT INTO students(student_name,course_id)
VALUES
("John",101),
("Emma",102),
("Raj",103),
("Sara",NULL),
("Alex",101);

SELECT * FROM instructors;

CREATE TABLE courses
	(
		course_id INT PRIMARY KEY,
        course_name VARCHAR(50),
        instructor_id INT UNIQUE
    );
INSERT INTO courses(course_id,course_name,instructor_id)
VALUES
(101,"Data Science",1),
(102,"Machine Learning",2),
(103,"Database Systems",3),
(104,"Web Development",4);

SELECT * FROM courses;

CREATE TABLE instructors
	(
		instructor_id INT PRIMARY KEY,
        instructor_name VARCHAR(50)
	);
INSERT INTO instructors(instructor_id, instructor_name)
VALUES
(1,"Dr. Smith"),
(2,"Dr Miller"),
(3,"Dr Patel"),
(4,"Dr Brown"),
(5,"Dr Jones");

SELECT * FROM courses;

-- Inner Join Display students with their course names
SELECT
	s.student_id,
    s.student_name,
    c.course_name
FROM students s
INNER JOIN courses c ON s.course_id=c.course_id
WHERE course_name="Machine Learning";

-- Display student, course and instructor name
SELECT
	s.student_id,
    s.student_name,
    c.course_name,
    i.instructor_name
FROM students s
INNER JOIN courses c ON s.course_id=c.course_id
INNER JOIN instructors i ON i.instructor_id=c.instructor_id;

SELECT
	s.student_id,
    s.student_name,
    c.course_name
FROM students s
INNER JOIN courses c ON s.course_id=c.course_id
WHERE course_name="Machine Learning";

-- display courses atleast having 1 student
SELECT
    c.course_name,
    COUNT(s.student_id) AS total_students
FROM courses c
INNER JOIN students s ON c.course_id = s.course_id
GROUP BY c.course_name
HAVING COUNT(s.student_id) >= 1;

-- show instructor and corresponding students
SELECT
	s.student_name,
    i.instructor_name
FROM students s
INNER JOIN courses c ON c.course_id=s.course_id
INNER JOIN instructors i ON i.instructor_id=c.instructor_id;

-- List all students with instructors whose names starts with Dr. P
SELECT
	s.student_name,
    i.instructor_name
FROM students s
INNER JOIN courses c ON c.course_id=s.course_id
INNER JOIN instructors i ON i.instructor_id=c.instructor_id
WHERE i.instructor_name LIKE 'Dr P%';

-- select all students and their courses
SELECT
	s.student_id,
    s.student_name,
    c.course_name
FROM students s LEFT JOIN courses c ON s.course_id=c.course_id;

-- Right Join
SELECT
	c.course_name,
    s.student_name
FROM students s
RIGHT JOIN courses c ON c.course_id=s.course_id;

-- Find the students who are not enrolled in any subjects
SELECT
	s.student_id,
    s.student_name,
    c.course_name
FROM students s
LEFT JOIN courses c ON s.course_id=c.course_id
WHERE c.course_name IS NULL;

-- Display all courses and instructors, even if no instructors is assigned
SELECT 
    i.instructor_name,
    c.course_name
FROM courses c LEFT JOIN instructors i ON c.instructor_id = i.instructor_id;

-- Show all instructors with their courses (even if no course)
SELECT 
    i.instructor_name,
    c.course_name
FROM instructors i
LEFT JOIN courses c 
    ON c.instructor_id = i.instructor_id;

-- Alternate with right joins
SELECT 
    i.instructor_name,
    c.course_name
FROM courses c
RIGHT JOIN instructors i 
    ON c.instructor_id = i.instructor_id;

-- Display students and instructors (even if no course assigned)
SELECT
	s.student_name,
    i.instructor_name
FROM courses c
RIGHT JOIN instructors i on i.instructor_id=c.instructor_id
RIGHT JOIN students s ON c.course_id=s.course_id;

-- Simulate FULL OUTER JOIN in MySQL
SELECT *
FROM students s
LEFT JOIN courses c
    ON s.course_id = c.course_id
UNION
SELECT *
FROM students s
RIGHT JOIN courses c
    ON s.course_id = c.course_id;

-- Dilsplay all students and courses using RIGHT JOIN
SELECT
	s.student_name,
    c.course_name
FROM students s
RIGHT JOIN courses c ON c.course_id=s.course_id;

-- Show all Instructors and courses (ensure all courses are displayed)
SELECT
	i.instructor_name,
	c.course_name
FROM courses c
LEFT JOIN instructors i ON c.instructor_id=i.instructor_id;

-- Find all instructors with students (use RIGHT JOIN)
SELECT
	i.instructor_name,
    s.student_name
FROM students s
RIGHT JOIN courses c ON c.course_id=s.course_id
RIGHT JOIN instructors i on i.instructor_id=c.instructor_id;

-- Display all courses and corresponding students; show NULL if no student
SELECT
	c.course_name,
    s.student_name
FROM students s
RIGHT JOIN courses c ON c.course_id=s.course_id;

#join_based(assignment)

create table employee(
emp_id int,
emp_name varchar(20),
dept_id int,
salary int
);

insert into employee(emp_id,emp_name,dept_id,salary)
values
(1,"john",101,50000),
(2,"emma",101,65000),
(3,"raj",102,45000),
(4,"meera",103,70000),
(5,"ravi",102,48000),
(6,"naina",103,52000),
(7,"alex",101,58000);

select * from employee;

create table department(
dept_id int,
dept_name varchar(20)
);

insert into department(dept_id,dept_name)
values
(101,"sales"),
(102,"marketing"),
(103,"finance"),
(104,"hr");

select * from department;

-- 1- Display employee names with their department name.

select e.emp_name , d.dept_name
from employee e 
inner join department d on e.dept_id=d.dept_id;

-- 2- List all employees including those with no matching department.

select e.emp_id ,e.emp_name , d.dept_name
from employee e 
left join department d on e.dept_id=d.dept_id;

-- 3- List all departments even if there are no employees.

select d.dept_name ,e.emp_name
from department d 
left join employee e on d.dept_id=e.dept_id;


-- 4- Show employees from the Sales department.

select e.emp_name ,d.dept_name
from employee e 
left join department d on e.dept_id=d.dept_id
where d.dept_name="sales" ;

-- 5- Find the top 3 highest paid employees.

select e.emp_name , max(salary)
from employee e
left join department d on e.dept_id=d.dept_id
group by e.emp_name
order by max(salary) desc
limit 3;

-- 6- Find employees earning more than 50,000 from Marketing.

select e.emp_name,e.salary,d.dept_name
from employee e
left join department d on e.dept_id=d.dept_id
where d.dept_name="marketing" and e.salary>50000;

-- 7- Count employees in each department.

select d.dept_name, count(emp_name)
from department d 
inner join employee e on e.dept_id=d.dept_id
group by d.dept_name
order by count(emp_name);

-- 8- Show departments having more than 2 employees.

select d.dept_name,count(emp_name) as emp_name
from department d 
inner join employee e on d.dept_id=e.dept_id
group by d.dept_name
having count(emp_name)>2;

-- 9- Show highest salary in each department.

select d.dept_name,avg(salary) as salary
from department d 
inner join employee e on d.dept_id=e.dept_id
group by d.dept_name
order by avg(salary) desc
limit 1;

-- 10- Show employees whose salary is above department average.

select e.emp_name,d.dept_name,e.salary
from employee e 
inner join department d on e.dept_id=d.dept_id
where e.salary>(select avg(salary) from employee where dept_id=e.dept_id)
order by e.salary;

-- 11- Show employees and their departments sorted by department name.

select e.emp_name, d.dept_name
from employee e 
inner join department d on e.dept_id=d.dept_id
order by d.dept_id desc;

-- 12- List the 2 lowest-paid employees with department names.

select e.emp_name,d.dept_name,e.salary
from employee e 
inner join department d on e.dept_id=d.dept_id
order by e.salary asc
limit 2;

-- 13- Show total salary expenditure per department.

select d.dept_name,sum(salary)
from employee e 
inner join department d on e.dept_id=d.dept_id
group by d.dept_name;

-- 14- Show departments where the total salary spent is more than 150,000.

select d.dept_name,sum(salary)
from employee e 
inner join department d on e.dept_id=d.dept_id
group by d.dept_name
having sum(salary)>150000;

-- 15- Show employees who belong to departments starting with 'S'.

select e.emp_name,d.dept_name
from employee e 
inner join department d on e.dept_id=d.dept_id
where d.dept_name like "s%";

-- 16- Find employees whose salary is the highest in their department.

select e.emp_name,d.dept_name,e.salary
from employee e
inner join department d on e.dept_id=d.dept_id
where e.salary=(select max(salary) from employee where dept_id=e.dept_id);

-- 17- Show employees and departments sorted by salary descending.

select emp_name,d.dept_name,e.salary
from employee e 
inner join department d on e.dept_id=d.dept_id
order by e.salary desc;

-- 18- Count how many employees earn above 50,000 per department. 

select d.dept_name,count(emp_name) as emp_name
from employee e 
inner join department d on e.dept_id=d.dept_id
where salary>50000
group by d.dept_name
order by count(emp_name);

-- 19- Show employee name, department, and salary for employees between 45,000 and 60,000.

select e.emp_name,d.dept_name,e.salary
from employee e 
inner join department d on e.dept_id=d.dept_id
where salary between 45000 and 60000;

-- 20- Find departments with no employees.

select d.dept_name ,e.emp_name
from department d 
left join employee e on d.dept_id=e.dept_id
where e.emp_name is null;
