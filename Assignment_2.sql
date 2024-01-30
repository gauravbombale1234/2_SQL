select * from cd.bookings 

-->Q1
select * from cd.facilities 

---->Q2
select name,membercost from cd.facilities 

--->Q3
select * from cd.facilities 
where membercost > 0

---->Q4
select facid,name,membercost,monthlymaintenance from cd.facilities 
where membercost > 0 and membercost < ( monthlymaintenance / 50.0)

---->Q5
select * from cd.facilities
where name like '%Tennis%'

--->Q6
select * from cd.facilities
where facid in (1,5)

---->Q7
select memid, surname, firstname, joindate from cd.members
where joindate between '2012-09-01' and '2012-09-30'

---->Q8
select distinct(surname) from cd.members
order by surname
limit 10

---->Q9
select joindate from cd.members
order by joindate desc
limit 1

---->Q10
select * from cd.facilities

select count(facid) from cd.facilities
where guestcost >= 10

---->Q11
select * from cd.bookings

select facid,sum(slots)  from cd.bookings
where starttime >= '2012-09-01' 
group by facid
order by sum(slots)

--->Q12
select facid ,sum(slots) as Total  from cd.bookings
group by facid
having sum(slots) > 1000
order by facid

---->Q13
select cd.facilities.name,cd.bookings.starttime from cd.facilities
inner join cd.bookings
on cd.facilities.facid = cd.bookings.facid
where cd.facilities.facid in (0,1)
and cd.bookings.starttime >= '2012-09-21'
and cd.bookings.starttime < '2012-09-22'
order by cd.bookings.starttime

---Q14
select * from cd.bookings
inner join cd.members
on cd.members.memid = cd.bookings.memid
where cd.members.firstname = 'David'
and cd.members.surname  = 'Farrell'






























