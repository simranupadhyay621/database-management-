create database student1;
use student1;

-- create table using contraints
 CREATE TABLE student_2
	(
	std_id INT NOT NULL UNIQUE,
        std_name VARCHAR(30) NOT NULL,
        age INT NOT NULL CHECK(age>=18),
       mobile VARCHAR(10) NOT NULL UNIQUE,
       city VARCHAR(30) DEFAULT "Delhi",
     gender VARCHAR(1) NOT NULL	);

INSERT INTO student_2(std_id,std_name,age,mobile,city,gender)
 VALUES
	(1,"ABC",18,876547,"Agra","M"),
    (2,"DEF",21,765413,"Noida","F"),
    (3,"GHI",23,765414,"Noida","F");
     
     SELECT * FROM student_2;

ALTER TABLE student_2 RENAME COLUMN std_name TO name;

 ALTER TABLE student_2 CHANGE name std_name VARCHAR(30);
 
 ALTER TABLE student_2 MODIFY gender VARCHAR(1) NOT NULL AFTER age;
 
 ALTER TABLE student_2 MODIFY std_name VARCHAR(30) NOT NULL FIRST;
