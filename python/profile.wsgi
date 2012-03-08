#!/usr/local/bin/python

import MySQLdb
import cgi
import json
import datetime

from wsgiref.simple_server import make_server
from cgi import parse_qs, escape

KEY_STR = 'umprojkey6853558'

#this wsgi is to get data for MY profile or another user's profile

def application(environ, start_response):

	#get proper fields
    form = cgi.FieldStorage(fp=environ['wsgi.input'],
                            environ=environ,
                            keep_blank_values=True)

	#get user id
	user_id = form.getfirst('userID', 'empty')
    user_id = cgi.escape(user_id)

	#connect to the Database
    conn = MySQLdb.connect (host = "localhost",
                            user = "root",
                            passwd = "",
                            db = "campus chemistry")

	cursor = conn.cursor()
	
	cursor.execute("""SELECT * FROM user_profile WHERE User_ID = %s""", (user_id,))
	row = cursor.fetchone()
	
	output = json.dumps(data)
    status = '200 OK'
    
    cursor.close()
    conn.commit()
    conn.close()

    response_headers = [('Content-Type', 'application/json'),
                        ('Content-Length', str(len(output)))]
    start_response(status, response_headers)
    return [output]