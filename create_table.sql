create table account(
	user_id SERIAL PRIMARY KEY,
	username varchar(50) UNIQUE NOT NULL,
	password varchar(50) NOT NULL,
	email varchar(250) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
)

---->
create table job(
	job_id SERIAL PRIMARY KEY,
	job_name varchar(200) UNIQUE NOT NULL
)

--->
create table account_job(
	user_id integer REFERENCES account(user_id),
	job_id integer REFERENCES job(job_id),
	hire_date TIMESTAMP)
	
--->
insert into account(username,password,email,created_on)
values
('Ram','root','ram1@sanjivani.org',CURRENT_TIMESTAMP)
	
insert into account(username,password,email,created_on)
values
('Ram1','root1','ram@sanjivani.org',CURRENT_TIMESTAMP)	
	
select * from account	

---->
insert into job(job_name)
values('DATA SCIENTIST')
	
select * from job
	
-->
insert into account_job(job_id,user_id,hire_date)
values(1,1,CURRENT_TIMESTAMP)

----> update
update account
set last_login = current_timestamp

-->returning affected rows
select * from account 

update account
set last_login = created_on
returning user_id,last_login

--->
update account_job
set hire_date=account.created_on
from account
where account_job.user_id=account.user_id

-->
update account
set last_login=current_timestamp
returning email,created_on,last_login

--->
insert into job(job_name)
values ('Cowboy')

select * from job

--
delete from job
where job_name='Cowboy'
returning job_id,job_name

--->ALTER 
create table information(
	info_id SERIAL primary key,
	title varchar(500) not null,
	person varchar(50) not null unique)

select * from information
---> change table name
alter table information
rename to new_info

select * from new_info

--->
alter table  new_info
rename column person to people

select * from new_info

--->error
insert into new_info(title)
values ('Some New Title')

insert into new_info(title)
values ('Some_New_Title')

---->
alter table new_info
alter column people drop not null

insert into new_info(title)
values ('Some New Title')

----->
select * from new_info

---->drop
alter table new_info
drop column people

select * from new_info

-->error
alter table new_info
drop column people

----> not error
alter table new_info
drop column if exists people

-------> CHECK
create table employees(
	emp_id serial  primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	birthdate date check(birthdate > '1900-01-01'),
	hire_date date check(hire_date > birthdate),
	salary integer check(salary > 0)
)

insert into employees(first_name ,last_name ,birthdate ,hire_date ,salary )
values ('Jose','Portilla','1990-01-03','2010-01-01',100)

------> CASE









	
	
	
	
	
	
	
	
	