#!/usr/local/bin/python

import MySQLdb
import cgi
import json
import string
import random
import Cookie
import datetime
import math

KEY_STR = 'umprojkey6853558'

#this wsgi is to get data for MY profile or another user's profile

def application(environ, start_response):

	#get proper fields
    form = cgi.FieldStorage(fp=environ['wsgi.input'],environ=environ,keep_blank_values=True)

	#get user_id
    user_id = form.getfirst('userid', 'empty')
    user_id = cgi.escape(user_id)
    user_id = user_id.lower()

    #connect to the Database
    conn = MySQLdb.connect (host = "localhost", user = "root", passwd = "", db = "campus chemistry")

    cursor = conn.cursor()
	
    cursor.execute("""SELECT user_name, sex, orientation, minagepref, maxagepref, dob, marital_status, ethinicity, birth_country, faculty, department, profile_picture, about_me FROM user_profile WHERE user_id = %s""",(user_id))
    row = cursor.fetchone()
    
    #finding the age of the user
    now = datetime.date.today()
    userAge = now - row[5]
    userAge = math.floor(userAge.days/365)
    print row[5].year 
    print row[5].month
    print row[5].day
    
    results = []	
    results.append({"name":row[0], "gender": row[1], "seeking": row[2], "minagepref": row[3], "maxagepref": row[4], "bYear": row[5].year, "bMonth": row[5].month, "bDay": row[5].day, "age": userAge, "rtype": row[6], "ethnicity": row[7], "bCountry": row[8], "faculty": row[9], "department": row[10], "photo": row[11], "about_me": row[12] })

    output = json.dumps(results)
    status = '200 OK'
    
    cursor.close()
    conn.commit()
    conn.close()

    response_headers = [('Content-Type', 'application/json'),('Content-Length', str(len(output)))]
    start_response(status, response_headers)
    return [output]