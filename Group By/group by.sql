create database shopping_mall;
use shopping_mall;

create table sales2(
sale_id int,
product_name varchar(50),
category varchar(50),
quantity int,
price int,
region varchar(50),
salesperson varchar(50),
sale_date date
);

insert into sales2( sale_id,product_name,category,quantity,price,region,salesperson,sale_date)
values
(1,"laptop","eletronics",5,5000,"east","john","2024-01-05"),
(2,"mobile","eletronics",10,20000,"west","mery","2024-01-10"),
(3,"chair","furniture",20,1500,"east","john","2024-02-05"),
(4,"table","furniture",8,5000,"north","steve","2024-02-18"),
(5,"laptop","eletronics",7,55000,"south","mery","2024-03-01"),
(6,"mobile","eletronics",15,18000,"east","john","2024-03-05"),
(7,"sofa","furniture",3,2500,"west","steve","2024-03-20"),
(8,"laptop","eletronics",2,52000,"north","mery","2024-03-05"),
(9,"mobile","eletronics",12,22000,"west","steve","2024-04-15"),
(10,"chair","furniture",30,1200,"south","john","2024-04-12");

select * from sales2;

-- 1 find total sales amount for each region.

select region,sum(quantity*price) as total_sales
from sales2
group by region;

-- 2 find total quantity sold by each salesperson.


  
-- 3 show categories where total quantity sold is more than 30.

select category,sum(quantity) as total_sales
from sales2
group by category
having sum(quantity)>30;

-- 4 find total revenue by each category.

select category,sum(price*quantity) as total_revenue
from sales2
group by category;

-- 5 find salesperson who sold total quantity more than 20

select salesperson,sum(quantity) as total_sales
from sales2
group by salesperson
having sum(quantity)>20;

-- 6 find region-wise average sale price

select region,avg(price) as average_sales_price
from sales2
group by region;

-- 7 find total revenue for each salesperson and show only those having revenue above $300000

select salesperson, sum(price*quantity) as revenue
from sales2
group by salesperson
having revenue>300000;

-- 8 find how many product each category has

select category,count(distinct product_name) as product_count
from sales2
group by category;

-- 9 find total sales per  month

select month(sale_date) as month, sum(quantity*price) as total_sales
from sales2
group by month(sale_date);

-- 10 find each region's maximum sale price.

select region,max(price) as sales_price
from sales2
group by region;

-- 11 find each category's average quantity sold, but show only where avg>10







-- 12 find total revenue by region and category

select region,category,sum(price*quantity) as revenue
from sales2
group by region , category;

-- 13 find how many sales each salesperson made in each region.

select salesperson,region,sum(price*quantity) as revenue
from sales2
group by region , salesperson;

-- 14 find the region where total quantity sold exceeds 20

select region,sum(quantity) as total_quantity
from sales2
group by region
having total_quantity>20;

-- 15 find salesperson who sold in more than one region

select salesperson, count(distinct region) as count
from sales2
group by salesperson
having count(distinct region)>1;

-- 16 find category having total revenue between $200000 and $1000000

select category,sum(price*quantity) as revenue
from sales2
group by category
having revenue between 200000 and 2000000;










