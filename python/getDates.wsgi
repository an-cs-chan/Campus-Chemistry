#!/usr/local/bin/python

import MySQLdb
import cgi
import json
import datetime
import re
import random

from cgi import parse_qs, escape
import math

def application(environ, start_response):
    
    #get proper fields
    form = cgi.FieldStorage(fp=environ['wsgi.input'],
                            environ=environ,
                            keep_blank_values=True)

    #Fetch the userID
    user_id = form.getfirst('userID', 'empty')
    user_id = cgi.escape(user_id)
    
    #Set up the date/time handler
    dthandler = lambda obj: obj.isoformat() if isinstance(obj, datetime.datetime) else None
    
    #connect to the Database
    conn = MySQLdb.connect (host = "localhost",
                            user = "root",
                            passwd = "",
                            db = "campus chemistry")

    cursor = conn.cursor()
    
    cursor.execute("""UPDATE blinddates SET To_User_New = 'FALSE' WHERE To_User_ID = %s""", (user_id))
    cursor.execute("""SELECT date_id, To_User_ID, From_User_ID, State, Date, Time, Message FROM blinddates WHERE (To_User_ID = %s OR From_User_ID = %s) AND State != 'Closed'""", (user_id, user_id))
    rows = cursor.fetchall()
    rows = list(rows)
    
    for index, row in enumerate(rows):
    	rows[index] = list(rows[index])
    	rows[index][4] = rows[index][4].strftime('%Y-%m-%d')
    	cursor.execute("""SELECT User_Name, Profile_Picture FROM user_profile WHERE User_ID = %s""", (row[2]))
    	from_name = cursor.fetchone()
    	rows[index].insert(0,from_name[1])
    	rows[index].insert(0,from_name[0])
    	cursor.execute("""SELECT User_Name, Profile_Picture FROM user_profile WHERE User_ID = %s""", (row[1]))
    	to_name = cursor.fetchone()
    	rows[index].insert(0,to_name[1])
    	rows[index].insert(0,to_name[0])
    
    output = json.dumps(rows, default=dthandler)

    status = '200 OK'

    cursor.close()
    conn.commit()
    conn.close()

    response_headers = [('Content-Type', 'application/json'),
                        ('Content-Length', str(len(output)))]
    start_response(status, response_headers)
    return [output]