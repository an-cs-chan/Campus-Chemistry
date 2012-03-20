#!/usr/local/bin/python

import MySQLdb
import cgi
import json
import string

from wsgiref.simple_server import make_server
from cgi import parse_qs, escape

KEY_STR = 'umprojkey6853558'

def application(environ, start_response):
	
    #get proper fields
    form = cgi.FieldStorage(fp=environ['wsgi.input'], environ=environ, keep_blank_values=True)

    #get user id
    user_id = form.getfirst('userID', 'empty')
    user_id = cgi.escape(user_id)
    
    #connect to the Database
    conn = MySQLdb.connect (host = "localhost", user = "root", passwd = "", db = "campus chemistry")
    cursor = conn.cursor()
    
    #build the query (select all 50 question answers)
    query = "SELECT Ques_ID_1"
    
    for i in range(2,51):
        query += ", Ques_ID_%s" % (i)
    
    query += " FROM user_survey_answers WHERE user_id = '%s'" % (user_id)
    
    cursor.execute(query)
    row = cursor.fetchone()
    
    output = json.dumps(row)
    
    status = '200 OK'
    
    cursor.close()
    conn.commit()
    conn.close()
    
    response_headers = [('Content-Type', 'application/json'), ('Content-Length', str(len(output)))]
    
    start_response(status, response_headers)
    
    return [output]

        