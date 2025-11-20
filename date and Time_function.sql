##date function
select current_date();
select curdate();
select sysdate();
select now();
select date ("2025-10-14 10:09:21");
select month ("2025-10-14 10:09:21");
select year ("2025-10-14 10:09:21");
select quarter ("2025-10-14 10:09:21");
select day ("2025-10-14 10:09:21");
select dayofmonth("2025-10-14 10:09:21");
select dayname("2025-10-14 10:09:21");
select dayofweek("2025-10-14 10:09:21");
select week("2025-10-14 10:09:21");
select weekday("2025-10-14 10:09:21");
select yearweek("2025-10-14 10:09:21");
select last_day("2025-10-14 10:09:21");
select extract(month from "2025-10-14 10:09:21");
select extract(year from "2025-10-14 10:09:21");
select extract(week from "2025-10-14 10:09:21");
select extract(day from"2025-10-14 10:09:21");
select extract(hour from "2025-10-14 10:09:21");
select extract(minute from "2025-10-14 10:09:21");
select extract(second from "2025-10-14 10:09:21");
select adddate("2025-10-14",interval 10 day);
select adddate("2025-10-14",interval 1 month);
select adddate("2025-10-14",interval 1 year);
select adddate("2025-10-14", interval 500 minute);
select subdate("2025-10-14", interval 1 day);
select datediff("2025-10-14","2025-10-13");

##TIME FUNCTIONS
select current_time();
select curtime();
select current_timestamp();
select localtime();
select localtimestamp();
select time("2025-10-14 10:09:21");
select hour("2025-10-14 10:09:21");
select minute("2025-10-14 10:09:21");
select second("2025-10-14 10:09:21");
select timediff("10:09:21","09:09:21");

