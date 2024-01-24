show databases;
use org;
select*from worker;
select*from bonus;
select*from title;

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
select concat(First_Name,' ',Last_Name) as Complete_name from  worker;
 
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
-- or
select*from worker
where department in ('Admin');

-- 16)print details of the Workers whose FIRST_NAME contains ‘a’.
  select *from worker
  where First_name like ('%a%');
  
-- 17)print details of the Workers whose FIRST_NAME ends with ‘a’.
select *from worker
where First_Name like ('%a');

-- 18)print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets
select *from Worker
where First_Name like('_____h'); 

-- 19)print details of the Workers whose SALARY lies between 100000 and 500000
select *from worker 
where salary between 100000 and 500000;

-- 20)print details of the Workers who joined in Feb 2021.
select *from worker 
where year(Joining_date)=2021 and month(Joining_date)=2;

-- 21)fetch the count of employees working in the department ‘Admin’.
select*from worker;
select department, count(*) from worker where Department="Admin";

-- 22)fetch worker names with salaries >= 50000 and <= 100000.
select concat(First_name,' ',last_Name) as Worker_Name,salary from worker where salary between 50000 and 100000; 

-- 23)fetch the number of workers for each department in descending order.
select Department,count(worker_id) as no_of_workers from worker
group by Department
order by no_of_workers desc;

-- 24)print details of the Workers who are also Managers.
select *from worker;
select *from title;
select  * from worker as w
inner join Title as T
on T.Worker_ref_Id=w.Worker_ID where T.Worker_title='Manager';

-- 25)fetch duplicate records having matching data in some fields of a table.
select worker_title,Affected_from,count(*) from title
group by Worker_title,Affected_from
having count(*)>1;

-- 26)SQL query to show only odd rows from a table.
select *from worker
where mod(worker_ID,2) <> 0;

-- 27)SQL query to show only even rows from a table.
select *from Worker
where mod(worker_ID,2) =0;

-- 28)SQL query to clone a new table from another table.
create table workerclone like worker; 

-- 29)fetch intersecting records of two tables.
select *from worker as w 
inner join title as t
on w.Worker_ID=t.worker_Ref_ID;

-- 30)query to show records from one table that another table does not have.
select*from bonus;
select * from worker 
where worker_ID not in (select worker_ref_id from bonus);

-- 31)query to show the current date and time.
select curdate();
select now();

-- 32)query to show the top n (say 10) records of a table. 
select *from worker limit 5;
-- or Top salaries
select *from worker
order by salary desc limit 5;

-- 33)query to determine the nth (say n=5) highest salary from a table.
select *from worker
order by salary desc limit 4,1;

-- 34)query to determine the 5th highest salary without using the TOP or limit method.
SELECT Salary FROM Worker as W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker as W2
 WHERE W2.Salary >= W1.Salary
 );
 
-- 35)fetch the list of employees with the same salary.
select *from worker as w,worker as W1
where w.salary=w1.salary
and w.worker_ID !=W1.worker_ID;

-- 36) query to show the second-highest salary from a table.
select *from worker 
order by salary desc limit 2,1;
-- or
select max(salary) from worker
where salary not in (select max(salary) from worker);

-- 37) query to show one row twice in the results from a table.
select FIRST_NAME, DEPARTMENT from worker as W where W.DEPARTMENT='HR' 
union all 
select FIRST_NAME, DEPARTMENT from Worker as W1 where W1.DEPARTMENT='HR'; 

-- 38)fetch intersecting records of two tables.
select *from worker as w
inner join bonus as b
on w.worker_ID=b.worker_ref_id;

-- 39)fetch the first 50% of records from a table.
select *from worker
where worker_ID<=(Select count(worker_ID)/2 from worker);

-- 40)fetch the departments that have less than five people in them.
select Department,count(worker_ID) as no_of_worker from worker
group by department having no_of_worker <5;

-- 41)show all departments along with the number of people in there.
select department,count(department) as No_of_worker from worker
group by department; 

-- 42)query to show the last record from a table
select *from worker where worker_ID= (select max(worker_id) from worker);

-- 43)fetch the first row of a table.
 select *from worker
 where worker_ID=(select min(Worker_id) from worker);
 
-- 44)fetch the last five records from a table
select *from worker
order by worker_ID desc limit 5;

-- 45)print the names of employees having the highest salary in each department.
select *from worker
where max(salary) in (select max(salary) from worker group by department);

-- 46)fetch three max salaries from a table.
select *from worker
order by salary desc limit 3;

-- 47)fetch three min salaries from a table.
select *from worker
order by salary asc limit 3;
  
-- 48)fetch nth max salaries from a table. 
SELECT distinct Salary from worker 
order by Salary desc limit 3;

-- 49)fetch departments along with the total salaries paid for each of them. 
select distinct department,sum(salary) as Total_salaries from worker 
group by department;
 
-- 50)fetch the names of workers who earn the highest salary.
select concat(first_name,' ',last_name) as worker_name,salary from worker
where salary=(select max(salary) from worker);