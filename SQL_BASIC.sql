show databases;
create database org;
use org;
create table worker(
worker_ID int,
First_Name varchar(10),
Last_Name varchar(10),
Salary int,
Department varchar(15),
Joining_date datetime);

insert into worker values
(001,'Monika','Arora',100000,'HR','2021-02-20 09:00:00'),
(002,'Niharika','Verma',80000,'Admin','2021-06-11 09:00:00'),
(003,'Vishal','Singhal',300000,'HR','2021-02-20 09:00:00'),
(004,'Amitabh','Singh',500000,'Admin','2021-02-20 09:00:00'),
(005,'Vivek','Bhati',500000,'Admin','2021-06-11 09:00:00'),
(006,'Vipul','Diwan',200000,'Account','2021-06-11 09:00:00'),
(007,'Satish','Kumar',75000	,'Account','2021-01-20 09:00:00'),
(008,'Geetha','chouhan',90000,'Admin','2021-07-11 09:00:00');


create table Bonus(
worker_ref_id int,
bonus_amt int(10),
bonus_date datetime
);

INSERT INTO Bonus 
	(WORKER_REF_ID, bonus_amt, BONUS_DATE) VALUES
		(001, 5000, '23-02-20'),
		(002, 3000, '23-06-11'),
		(003, 4000, '23-02-20'),
		(001, 4500, '23-02-20'),
		(002, 3500, '23-06-11');

drop table title;
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2023-02-20 00:00:00'),
 (002, 'Executive', '2023-06-11 00:00:00'),
 (008, 'Executive', '2023-06-11 00:00:00'),
 (005, 'Manager', '2023-06-11 00:00:00'),
 (004, 'Asst. Manager', '2023-06-11 00:00:00'),
 (007, 'Executive', '2023-06-11 00:00:00'),
 (006, 'Lead', '2023-06-11 00:00:00'),
 (003, 'Lead', '2023-06-11 00:00:00');
 
 
 -- 1)fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>.
 select *from worker;
 select First_name as WORKER_NAME from worker;
 
 -- 2) fetch “FIRST_NAME” from the Worker table in upper case.
 select *from worker;
 select ucase(First_Name) from worker;
 
-- 3)fetch unique values of DEPARTMENT from the Worker table.
select *from worker;
select Distinct Department from Worker;

-- 4)print the first three characters of  FIRST_NAME from the Worker table.
select *from worker;
select substring(First_name,1,3) from worker;

-- 5)find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table.
 select *from worker;
 select instr(First_Name,Binary'a') from Worker where first_name='Amitabh';
 
 -- 6)print the FIRST_NAME from the Worker table after removing white spaces from the right side.
 select *from worker;
 select rtrim(First_name) from Worker;
 
 -- 7)print the DEPARTMENT from the Worker table after removing white spaces from the left side
 select *from worker;
 select ltrim(Department) from worker; 
 
 -- 8) fetch the unique values of DEPARTMENT from the Worker table and prints its length.
 select *from worker;
 select distinct department,length(department) from worker group by department; 
 
 -- 9)print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.
select *from worker;
select replace(First_Name,'A','a') from worker;

-- 10)print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME. A space char should separate them.
select*from worker;
select concat(First_name,' ',Last_Name) as COMPLETE_NAME from worker;
 
 -- 11)print all Worker details from the Worker table order by FIRST_NAME Ascending.
select *from worker
order by First_Name Asc; 
-- order by first_name; (DEFAULT is ascending)

-- 12) print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select *from worker
order by First_name asc ,Department desc;

-- 13)print details for Workers with the first names “Vipul” and “Satish” from the Worker table.
select * from worker 
where first_name in ('Vipul','Satish');

-- 14)print details of workers excluding first names, “Vipul” and “Satish” from the Worker table
select *from worker 
where first_name not in ('Vipul','Satish');

-- 15)print details of Workers with DEPARTMENT name as “Admin”.
select *from worker
where Department like 'Admin%';