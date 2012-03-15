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
    
    #get answers
    user_answers = form.getfirst('userAnswers', 'empty')
    user_answers = cgi.escape(user_answers)
    
    #connect to the Database
    conn = MySQLdb.connect (host = "localhost", user = "root", passwd = "", db = "campus chemistry")
    cursor = conn.cursor()
    
    cursor.execute("SELECT DISTINCT user_id FROM user_survey_answers")
    
    row = cursor.fetchone()
    
    if row != None:
        cursor.execute("DELETE FROM user_survey_answers WHERE user_id='%s'" % (user_id))
    
    cursor.execute("INSERT INTO user_survey_answers VALUES ('%s',%s)" % (user_id, string.join(user_answers, ",")))
    data = [{"status":"Answers saved"}]
    
    output = json.dumps(data)
    
    status = '200 OK'

    cursor.close()
    conn.commit()
    conn.close()
    
    response_headers = [('Content-Type', 'application/json'), ('Content-Length', str(len(output)))]
    
    start_response(status, response_headers)
    
    return [output]
