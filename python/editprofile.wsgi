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
    form = cgi.FieldStorage(fp=environ['wsgi.input'],environ=environ,keep_blank_values=True)

	#get user id
    user_id = form.getfirst('userid', 'empty')
    user_id = cgi.escape(user_id)
    user_id = user_id.lower()
    
	#get fields from form
    name = form.getfirst('name', 'empty')
    gender = form.getfirst('gender', 'empty')    
    seekGender = form.getfirst('seekGender', 'empty')
    seekingStart = form.getfirst('seekStart', 'empty')
    seekingEnd = form.getfirst('seekEnd', 'empty')
    rStatus = form.getfirst('rStatus', 'empty')
    ethnicity = form.getfirst('ethnicity', 'empty')
    bCountry = form.getfirst('bCountry', 'empty')
    faculty = form.getfirst('faculty', 'empty')
    deptmt = form.getfirst('deptmt', 'empty')
    interests = form.getfirst('interests', 'empty')
    print seekingStart
    print seekingEnd
    print interests
    
    #connect to the Database
    conn = MySQLdb.connect (host = "localhost", user = "root", passwd = "", db = "campus chemistry")
	
    cursor = conn.cursor()
    
    #separate execution for this since they are not string values (unlike the execution below)
    cursor.execute("UPDATE user_profile SET minagepref='"+seekingStart+"', maxagepref='"+seekingEnd+"' WHERE user_id='"+user_id+"'")
	
    try:
    #connect to the Database
     cursor.execute("UPDATE user_profile SET user_name=%s, sex=%s, orientation=%s, marital_status=%s, ethinicity=%s, birth_country=%s, faculty=%s, department=%s, about_me=%s WHERE User_ID=%s",(name, gender, seekGender, rStatus, ethnicity, bCountry, faculty, deptmt, interests, user_id))
     data = [{"status":"Success"}]
     output = json.dumps(data)
    except MySQLdb.Error, e:
     data = [{"status":"Update Failed"}]
     output = json.dumps(data)
    
    status = '200 OK'
    cursor.close()
    conn.commit()
    conn.close()

    response_headers = [('Content-Type', 'application/json'),('Content-Length', str(len(output)))]
    start_response(status, response_headers)
    return [output]