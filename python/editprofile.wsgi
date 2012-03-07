#!/usr/local/bin/python

import MySQLdb
import cgi
import json
import datetime

from wsgiref.simple_server import make_server
from cgi import parse_qs, escape

KEY_STR = 'umprojkey6853558'

def application(environ, start_response):
	
	#get proper fields
    form = cgi.FieldStorage(fp=environ['wsgi.input'],
                            environ=environ,
                            keep_blank_values=True)

	#get user id
	
	#get fields from form

	#connect to the Database
    conn = MySQLdb.connect (host = "localhost",
                            user = "root",
                            passwd = "",
                            db = "campus chemistry")
	
	cursor = conn.cursor()
	query = "UPDATE user_profile SET Email_ID=eid,.... WHERE User_ID=uid" 
    print query

	try:
    #connect to the Database
     cursor.execute(query)
     data = [{"status":"Message Sent"}]
     output = json.dumps(data)
    except MySQLdb.Error, e:
     data = [{"status":"Message Failed"}]
     output = json.dumps(data)

    status = '200 OK'
    
    cursor.close()
    conn.commit()
    conn.close()

    response_headers = [('Content-Type', 'application/json'),
                        ('Content-Length', str(len(output)))]
    start_response(status, response_headers)
    return [output]