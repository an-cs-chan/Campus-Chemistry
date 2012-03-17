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
    
    messageID = form.getfirst('messageid', 'empty')

    #connect to the Database
    conn = MySQLdb.connect (host = "localhost",
                            user = "root",
                            passwd = "",
                            db = "campus chemistry")
    
    cursor = conn.cursor()
   
    cmd = "UPDATE messages SET Deleted = '1' WHERE Message_ID = '"+messageID+"'"

    try:
     cursor.execute(cmd)
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