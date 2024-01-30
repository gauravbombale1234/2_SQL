/*Q1. Write a SQL statement to create a table named jobs including 
columns job_id, job_title, min_salary, max_salary and check whether the 
max_salary amount exceeding the upper limit 25000.*/

create table jobs(
	job_id integer primary key unique, 
	job_title varchar(20) not null , 
	min_salary integer , 
	max_salary integer check(max_salary > 25000)
)
select * from jobs
/*Q2. Write a SQL statement to change the email column of the 
employees table with 'not available' for all employees.*/
Alter table jobs add email varchar(30) default 'not available';

select * from jobs

/*Q3. Write a SQL statement to rename the table jobs to jobs_new.*/
alter table jobs 
rename to jobs_new

/*Q.4 Write a SQL statement to add a column dept_id to 
the table locations.*//
Alter table jobs add dept_id integer ;

select * from jobs;

/*Q.5 Write a SQL statement to insert a record with your own value into 
the table jobs_new against each column.*/
insert into jobs(job_id,job_title,min_salary,max_salary,dept_id)
values (123,'Data Scientist','2000','100000',200);

select * from jobs;

/*Q.6 Write a query to display the names (job_id,dept_id) .*/
select job_id,dept_id from jobs;

/*Q.7 Write a query to get the maximum total salaries payable to employees.*/
insert into jobs(job_id,job_title,min_salary,max_salary,dept_id)
values (124,'Software Engineer','20000','300000',201);

select sum(max_salary) from jobs;

/*Q.8 Write a query to get the average salary and number of employees 
are working.*/
select avg(max_salary),count(*) from jobs; 

/*Q.9 Create a table manager_details comprises of manager_id,
manager_name ,dept_id and Write a query to make a join with two tables 
jobs_new and manager_details */
create table manager_details (
	manager_id integer primary key not null,
	manager_name varchar(30) not null,
	dept_id integer not null
)

select * from manager_details

insert into manager_details (manager_id,manager_name,dept_id)
values (2001,'Gaurav',200)

insert into manager_details (manager_id,manager_name,dept_id)
values (2002,'Vaibhav',202)

insert into manager_details (manager_id,manager_name,dept_id)
values (2003,'Ketan',201)

select * from manager_details

select * from manager_details
inner join jobs
on manager_details.dept_id = jobs.dept_id
order by manager_name

/*Q.10 Write a SQL subquery to find the emp_id  of all employees  from 
jobs_new table who works in the IT department.*/


















