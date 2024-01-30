# -*- coding: utf-8 -*-
"""
Created on Sat Sep  9 08:09:53 2023

@author: Gaurav
"""
import psycopg2 as pg2

# create a connection with postgreSQL
conn=pg2.connect(database='Testme',user='postgres',password='root')

# establish connection and start cursor to be ready to query
cur=conn.cursor()

cur.execute("insert into courses(course_name,course_instructor ,topic) values('Introduction to SQL','Ram','Julia')");

cur.execute("insert into courses(course_name,course_instructor ,topic) values('Analyzing Survey Data in Python','Sham','Python')");

cur.execute("insert into courses(course_name,course_instructor ,topic) values('Introduction to ChatGPT','Ganesh','Theory')");

cur.execute("insert into courses(course_name,course_instructor ,topic) values('Introduction to Statistics in R','Ramesh','R')");

cur.execute("insert into courses(course_name,course_instructor ,topic) values('Hypothesis Testing in Python','Jayesh','Python')");

conn.commit()
cur.close()
conn.close()
