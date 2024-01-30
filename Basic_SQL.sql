select distinct first_name from customer

----->
select count(*) from film 
where rental_rate > 4 AND replacement_cost >= 19.99
AND rating='R';

----->
select count(*) from film 
where rating='R' or rating='PG-13'

----->
select * from film 
where rating != 'R'

----->
select email from customer
where first_name='Nancy' AND last_name='Thomas'

----->
select description from film 
where title='Outlaw Hanky';

----->
select phone from address
where address='259 Ipoh Drive'
--------------------------------------------------
----->   Ordered By
select * from customer
order by first_name

----->
select * from customer
order by first_name ASC 

----->
select * from customer
order by first_name DESC

------>
select * from customer 
order by store_id,first_name

----->
select store_id,first_name,last_name from customer
order by store_id DESC ,first_name ASC

----->LIMIT
select * from payment
order by payment_date DESC
LIMIT 5; 

------>
select * from payment
where amount !=0.00
order by payment_date DESC
LIMIT 5; 

------>
select customer_id from payment
order by payment_date ASC
limit 10;

------.
select title,length from film 
order by length ASC
limit 5;

---->
select count(title) from film
where length <= 50

--------> between operator
select * from payment 
where amount between 8 AND 9;

----->
select count(*) from payment
where amount between 8 and 9;

----->
select count(*) from payment
where amount NOT between 8 and 9;

----->
select * from payment
where payment_date between '2007-02-01' and '2007-02-15'

------> IN operator
select distinct(amount) from payment
order by amount

---->
select * from payment
where amount in (0.99,1.98,1.99)

--->
select count(*) from payment
where amount in (0.99,1.98,1.99)

----->
select count(*) from payment
where amount not in (0.99,1.98,1.99)

----->
select * from customer
where first_name in ('John','Jake','Julie')

----->
select * from customer
where first_name not in ('John','Jake','Julie')

----->LIKE operator
select * from customer
where first_name like 'J%'

----->
select count(*) from customer
where first_name like 'J%'

---------->
select * from customer
where first_name like 'J%' AND  last_name like 'S%'

---->case sensitive (no output)
select * from customer
where first_name like 'j%' AND  last_name like 's%'

----> for case insensitive we use ilike
select * from customer
where first_name ilike 'j%' AND  last_name ilike 'j%'

----->
select * from customer
where first_name ilike 'j%' AND  last_name ilike 's%'

----->
select * from customer 
where first_name like '%er%'

------>
select * from customer 
where first_name like '%her%'

----->
select * from customer 
where first_name like '_her%'

----->
select * from customer 
where first_name like 'A%'

---->
select * from customer 
where first_name like 'A%'
order by last_name

----->
select * from customer 
where first_name like 'A%' AND last_name NOT like 'B%'
order by last_name

----->
select count(amount) from payment
where amount >= 5.00

---->
select count(first_name) from actor
where first_name like 'P%'

----->
select count(distinct district) from address

---->
select distinct district from address

----->
select count(*) from film
where rating='R' AND replacement_cost between 5 and 15;

----->
select count(title) from film
where title like '%Truman%'

------>
select min(replacement_cost) from film

----->
select max(replacement_cost) from film

----->
select avg(replacement_cost) from film

----->
select min(replacement_cost) , max(replacement_cost) from film

----->
select round (avg(replacement_cost),2) from film

---->
select round (avg(replacement_cost),4) from film

----->
select sum(replacement_cost) from film

------>  Group by
select customer_id from payment
group by customer_id
order by customer_id

----
select customer_id,sum(amount) from payment
group by customer_id

----->
select customer_id,sum(amount) from payment
group by customer_id
order by sum(amount)

---->
select customer_id,sum(amount) from payment
group by customer_id
order by sum(amount) desc

----->
select customer_id ,staff_id,sum(amount) from payment
group by staff_id,customer_id

---->
select customer_id ,staff_id,sum(amount) from payment
group by staff_id,customer_id
order by customer_id

----->
select date(payment_date) , sum(amount) from payment
group by date(payment_date)

------>
select date(payment_date) , sum(amount) from payment
group by date(payment_date)
order by sum(amount) desc

--->
select staff_id,count(amount) from payment
group by staff_id

---->
select rating,avg(replacement_cost) from film
group by rating

--->
select customer_id,sum(amount) from payment
group by customer_id
order by sum(amount) desc
limit 5;

----> Having clause
select customer_id,sum(amount) from payment
where customer_id not in (184,87,477)
group by customer_id

--->
select customer_id,sum(amount) from payment
group by customer_id
having sum(amount) > 100

--->
select store_id,count(*) from customer
group by store_id
having count(*) > 300

--->
select store_id,count(*) from customer
group by store_id
having count(customer_id) > 300

---->
select customer_id,count(*) from payment 
group by customer_id 
having count(*) >=40

---->>
select customer_id,sum(amount) from payment 
where staff_id = 2
group by customer_id 
having sum(amount) >= 100

---->Q1
select customer_id , sum(amount) from payment
where staff_id = 2
group by customer_id 
having sum(amount) >= 110

--->Q2
select count(title) from film
where title like 'J%'

--->Q3
select first_name,last_name from customer
where first_name like 'E%' AND address_id < 500
order by customer_id desc
limit 1

---> AS clause
select count(amount) as num_transactions
from payment

---->
select customer_id,sum(amount)  
from payment
group by customer_id

---->
select customer_id,sum(amount) as total_spent 
from payment
group by customer_id

--->
select customer_id,sum(amount)  
from payment
group by customer_id
having sum(amount) > 100

--->
select customer_id,sum(amount) as total_spent 
from payment
group by customer_id
having sum(amount) > 100

-----> we get error due to 3rd line
select customer_id,sum(amount) as total_spent 
from payment
group by customer_id
having total_spent > 100

--->
select customer_id,amount as new_name
from payment
where amount > 2

--->.get error
select customer_id,amount as new_name
from payment
where new_name > 2

----->JOINS
---> inner join 
select * from payment
inner join customer
on payment.customer_id = customer.customer_id

---->
select payment.payment_id,payment.customer_id,customer.first_name 
from payment
inner join customer
on payment.customer_id = customer.customer_id

--->full outer join
select * from customer 
full outer join payment
on customer.customer_id = payment.customer_id
where customer.customer_id is null
or payment.payment_id is null

--->
select film.film_id,title,inventory_id,store_id
from film 
left join inventory 
on inventory.film_id = film.film_id

---->
select film.film_id,title,inventory_id,store_id
from film 
left join inventory 
on inventory.film_id = film.film_id
where inventory .film_id is null

---->
select district,email from address
inner join customer
on address.address_id = customer.address_id
where district = 'California'

---->
select title,first_name,last_name from film_actor
inner join actor
on film.actor_id = film_actor.actor_id
inner join film
on film_actor.film_id = film._film_id
where first_name = 'Nick' and last_name='Wahlberg'

----> Advanced SQL
show all

show  timezone

select now()

select TIMEOFDAY()

select CURRENT_DATE

select extract(year from payment_date) as myyear
from payment

select extract(month from payment_date) as payment_month
from payment

select extract(QUARTER  from payment_date)
as pay_month
from payment

select age(payment_date) from payment

select to_char(payment_date,'')
from payment

select to_char(payment_date,'MM/dd/YYYY')
from payment

select to_char(payment_date,'dd-mm-yyyy')
from payment

----->
select distinct(to_char(payment_date,'MONTH'))
from payment

------>
select count(*) from payment
where extract(dow from payment_date)=1

----> Mathematical Functions
select * from film

select rental_rate/replacement_cost from film

select rental_rate + replacement_cost from film

select rental_rate - replacement_cost from film

select rental_rate *replacement_cost from film

select rental_rate % replacement_cost from film

select rental_rate ^ replacement_cost from film

select |/ rental_rate  from film

select ||/ rental_rate  from film

----->
select round(rental_rate/replacement_cost,2) from film

--->
select round(rental_rate/replacement_cost,4)*100 from film

---->
select round(rental_rate/replacement_cost,4)*100 as percent_cost from film

--->
select 0.1 * replacement_cost as deposit
from film

----string functions															>
select * from customer

---->
select length(first_name) from customer

--->
select first_name || last_name from customer

---->
select first_name ||' ' || last_name from customer

--->
select first_name ||' ' || last_name as full_name
from customer

--->
select upper(first_name) ||' ' || upper(last_name) as full_name
from customer

---->
select left(first_name,1) ||last_name || '@gmail.com' from customer

---->
select right(first_name,1) ||last_name || '@gmail.com' from customer

--->
select lower(left(first_name,1)) ||lower(last_name) || '@gmail.com' from customer

--->
select lower(left(first_name,1)) ||lower(last_name) || '@gmail.com' as custom_email
from customer

---->subquery
select * from film

select avg(rental_rate) from film
--->
select title,rental_rate from film
where rental_rate > (select avg(rental_rate) from film)

---->
select * from rental

select * from inventory

select * from rental
where return_date between '2005-05-29' and '2005-05-30'

(select inventory.film_id
from rental
inner join inventory 
on inventory.inventory_id = rental.inventory_id
where return_date between '2005-05-29' and '2005-05-30'
)

---->
select film_id,title
from film
where film_id in 
(select inventory.film_id
from rental
inner join inventory 
on inventory.inventory_id = rental.inventory_id
where return_date between '2005-05-29' and '2005-05-30')

--->


















































