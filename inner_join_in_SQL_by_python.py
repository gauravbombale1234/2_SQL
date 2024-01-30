# -*- coding: utf-8 -*-
"""
Created on Sat Sep  9 09:14:44 2023

@author: Admin
"""

import psycopg2 as pg2

# create a connection with postgreSQL
conn=pg2.connect(database='Testme',user='postgres',password='root')

# establish connection and start cursor to be ready to query
cur=conn.cursor()

##execute a command : create courses table
cur.execute("""create table courseadmin(
                course_id integer,
                course_duration varchar(50) ,
                course_fees decimal(4,0))""")
            
# make the chages to the database persistent
conn.commit()

#close cursor and communication with the database
cur.close()


########################## insert values
conn=pg2.connect(database='Testme',user='postgres',password='root')

# establish connection and start cursor to be ready to query
cur=conn.cursor()

cur.execute("insert into courseadmin(course_id,course_duration,course_fees) values(1,'20days',2000)");

cur.execute("insert into courseadmin(course_id,course_duration,course_fees) values(2,'30days',3000)");

cur.execute("insert into courseadmin(course_id,course_duration,course_fees) values(3,'40days',4000)");

cur.execute("insert into courseadmin(course_id,course_duration,course_fees) values(4,'50days',5000)");

cur.execute("insert into courseadmin(course_id,course_duration,course_fees) values(10,'60days',7000)");

conn.commit()
cur.close()
conn.close()


########################### inner join
conn=pg2.connect(database='Testme',user='postgres',password='root')

# establish connection and start cursor to be ready to query
cur=conn.cursor()

cur.execute("""select course_name,course_fees,course_duration
            from courses
            inner join courseadmin
            on courses.course_id = courseadmin.course_id""");
            
rows=cur.fetchall()
conn.commit()
conn.close()

for row in rows:
    print(row)







