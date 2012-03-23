#!/usr/local/bin/python

import MySQLdb
import cgi
import json
import string
import random
import datetime
import Cookie

from wsgiref.simple_server import make_server
from cgi import parse_qs, escape

KEY_STR = 'umprojkey6853558'

#this wsgi is to get data for MY profile or another user's profile

def application(environ, start_response):

	#get proper fields
    form = cgi.FieldStorage(fp=environ['wsgi.input'],environ=environ,keep_blank_values=True)

    user_id = form.getfirst('userid', 'empty')
    user_id = cgi.escape(user_id)
    user_id = user_id.lower()
    print user_id

    #connect to the Database
    conn = MySQLdb.connect (host = "localhost", user = "root", passwd = "", db = "campus chemistry")

    cursor = conn.cursor()
	
    cursor.execute("""SELECT user_name, orientation, minagepref, maxagepref, dob, marital_status, ethinicity, birth_country, hair_colour, faculty, department, about_me FROM user_profile WHERE user_id = %s""",(user_id))
    row = cursor.fetchone()
    
    #finding the age of the user
    now = datetime.date.today()
    userAge = now.year - row[4].year
    
    results = []	
    results.append({"name":row[0], "seeking": row[1], "minagepref": row[2], "maxagepref": row[3], "age": userAge, "rtype": row[5], "ethnicity": row[6], "bCountry": row[7], "hairColor": row[8], "faculty": row[9], "department": row[10], "about_me":row[11] })
    
    output = json.dumps(results)
    status = '200 OK'
    
    cursor.close()
    conn.commit()
    conn.close()

    response_headers = [('Content-Type', 'application/json'),('Content-Length', str(len(output)))]
    start_response(status, response_headers)
    return [output]