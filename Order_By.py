# -*- coding: utf-8 -*-
"""
Created on Sat Sep  9 09:10:35 2023

@author: Admin
"""

import psycopg2 as pg2

# create a connection with postgreSQL
conn=pg2.connect(database='Testme',user='postgres',password='root')

# establish connection and start cursor to be ready to query
cur=conn.cursor()

cur.execute('select * from courses order by course_instructor;')

conn.commit()

rows=cur.fetchall()
conn.close()

for row in rows:
    print(row)