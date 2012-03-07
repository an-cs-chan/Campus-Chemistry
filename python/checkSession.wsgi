#!/usr/local/bin/python

import MySQLdb
import cgi
import json
import string
import random
import Cookie

KEY_STR = 'umprojkey6853558'

def application(environ, start_response):
    
    #get proper fields
    form = cgi.FieldStorage(fp=environ['wsgi.input'],
                            environ=environ,
                            keep_blank_values=True)
    
    sessionID = form.getfirst('session', 'empty')
    sessionID = cgi.escape(sessionID)

    #connect to the Database
    conn = MySQLdb.connect (host = "localhost",
                            user = "root",
                            passwd = "",
                            db = "campus chemistry")
    
    cursor = conn.cursor()
    
    cmd = "SELECT Last_Login FROM user_login WHERE Session_ID = '"+sessionID+"'"
    cursor.execute(cmd)
    row = cursor.fetchone()
    
    if row == None:
        data = [{"status":"Invalid SessionID"}]
    else:
        data = [{"status":"Valid SessionID"}]

    output = json.dumps(data)        
    status = '200 OK'
    
    cursor.close()
    conn.commit()
    conn.close()

    response_headers = [('Content-Type', 'application/json'),
                        ('Content-Length', str(len(output)))]
    start_response(status, response_headers)
    return [output]