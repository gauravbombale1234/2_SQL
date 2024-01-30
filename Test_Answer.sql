create table Loans(
Deal_id int,
Merchant_Id int not null, 
Funded_date date,
Industry varchar(20),
type varchar(20)
)

create table Submissions(
Deal_id int, 
Loan_Amount int, 
interest_rate int,
rate_type varchar(20)
)
	
insert into Loans(Deal_id , Merchant_Id , Funded_date,Industry, type)	
values(1, 1, '01/01/2016' ,'Retail', 'New');	
	
insert into Loans(Deal_id , Merchant_Id , Funded_date,Industry, type)	
values(100 ,80, '04/01/2016' ,'Construction', 'New');

insert into Loans(Deal_id , Merchant_Id , Funded_date,Industry, type)	
values(130, 100 ,'04/15/2016', 'Trucking' ,'New');
	
insert into Loans(Deal_id , Merchant_Id , Funded_date,Industry, type)	
values(1010, 1 ,'6/23/2017' ,'Retail' ,'Renewal');

insert into Loans(Deal_id , Merchant_Id , Funded_date,Industry, type)	
values(1051 ,100 ,'7/01/2017' ,'Trucking' ,'Renewal');
	
insert into Loans(Deal_id , Merchant_Id , Funded_date,Industry, type)	
values(1251, 1 ,'10/01/2017' ,'Retail' ,'Renewal');	
	
select * from Loans	
	

insert into Submissions values(1, 10000, 8.75, 'variable')

insert into Submissions values(100, 10000, 11.37, 'fixed')

insert into Submissions values(1010 ,15000, 8.25, 'fixed')

insert into Submissions values(1051, 20000, 4.75, 'variable')

insert into Submissions values(1251, 40000, 4.75, 'variable')

insert into Submissions values(130, 10000, 3 ,'variable')

select * from Submissions
select * from Loans	

select * from Loans 
inner join Submissions on 
Submissions.deal_id=Loans.deal_id
where Loans.type='Renewal' 
order by funded_date limit 2






	
	
	
	
	
	
	
	
	
)