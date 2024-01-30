create table student(
	student_id integer primary key, 
	first_name varchar(50) not null,
	last_name varchar(50) not null, 
	homeroom_number integer , 
	phone varchar(20) not null ,
	email varchar(50) not null, 
	graduation_year integer not null)
	
create table teachers(
	teacher_id integer primary key,
	first_name varchar(50) not null , 
	last_name varchar(50) not null,
	homeroom_number integer unique, 
	department varchar(50) not null, 
	email varchar(50) not null,  
	phone varchar(20) not null
)	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	