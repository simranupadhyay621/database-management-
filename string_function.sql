use student1;

create table student3
	(
	 id int not null unique,
	name varchar(20) not null,
	percentage float(5),
	age int not null check (age>17),
	gender varchar(1) not null,
	 phone varchar(10) not null,
	 city varchar (20)default "delhi"
	 );

insert into student1(id ,name ,percentage ,age , gender ,phone ,city )
values 
(1,"Ram kumar",45,19,"M",6725764,"Agra"),
(2,"Sarita kumari",55,22,"F",6546543,"Delhi"),
(3,"Salman khan", 62,20,"M",675567,"Agra"),
(4,"Juhi chawla",47,18,"F",78676,"Bhopal"),
(5,"Anil kapoor",74,22,"M",89676,"Agra"),
(6,"John abraham",64,21,"M",98687,"Delhi"),
(7,"Shahid kapoor",52,20,"M ",756578,"Agra");


## string function 

select id, upper(name), percentage from student1;

select id,ucase(name), percentage from student1;

select id, lower (name), percentage from student1;

select id , lcase(name), percentage from student1;

select id,name, character_length (name), percentage from student1;

select id,name,char_length (name),percentage from student1;

select id ,name,length(name),percentage from student1;

select id , concat(name,percentage) from student1;

select id, concat(name," ", percentage)from student1;

select concat("simran upadhyay");

select concat_ws(" ","simran","hello","class");

select position("world" in"helloworld");

select position ("o" in "helloworld");

select instr ("helloworld","ell");

select locate ("ell","helloworld");

select locate ("l","helloworld",3);

select substring("simran upadhyay",5);

select substring ("simran upadhyay", 3,6);

select substrin ("simran upadhyay",-6,3);

select mid("simran upadhyay",-6,3);

select substring_index("www.simranupadhyay.net",".",1);

select substring_index("www.simranupadhyay.net",".",2);

select substring_index("www.simranupadhyay.net","e",2);

select strcmp("simran upadhyay","simran upadhyay");

select strcmp("simran upadhyay","simran");

select strcmp ("simran","simran upadhyay");

select format(235.3568,3);

select left("simran upadhyay",3);

select right ("simran upadhyay "3);

select left ("simran upadhyay ",5);

select rpad("simran upadhyay",20,"-");

select rpad("simran upadhyay",20,"*");

select lpad ("simran upadhyay ",20,"*");

select reverse ("simran upadhyay ");

select replace("simran upadhyay","simran","ms.");

select field("a","x","a","k");

select field("b","x","a","k");

select field("a","X","A","K")

select field(5,0,1,2,3,4,5);

select field("ram","Ram","Mohan","Shyam");

select field_in_set("Mohan","Ram,Mohan,Shyam");
