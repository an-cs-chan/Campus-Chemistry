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
    
    fromuserid = form.getfirst('userid', 'empty')

    #connect to the Database
    conn = MySQLdb.connect (host = "localhost",
                            user = "root",
                            passwd = "",
                            db = "campus chemistry")
    
    cursor = conn.cursor()
   
    cmd = "SELECT Message_ID, To_User_ID, Message, DATE_FORMAT(Time_Stamp, '%b %e, %l:%i %p'), Read_Status FROM messages WHERE From_User_ID = '"+fromuserid+"' AND Deleted = '0' ORDER BY Read_Status DESC, to_user_id ASC"

    cursor.execute(cmd)
    rows = cursor.fetchall()

    output = json.dumps(rows)        
    status = '200 OK'
    
    cursor.close()
    conn.commit()
    conn.close()

    response_headers = [('Content-Type', 'application/json'),
                        ('Content-Length', str(len(output)))]
    start_response(status, response_headers)
    return [output]