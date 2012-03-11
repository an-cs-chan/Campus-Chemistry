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
    
    to_name = form.getfirst('name', 'empty')
    to_name = cgi.escape(to_name)

    message = form.getfirst('message', 'empty')
    message = cgi.escape(message)
    
    print message
      
    #connect to the Database
    conn = MySQLdb.connect (host = "localhost",
                            user = "root",
                            passwd = "",
                            db = "campus chemistry")
    
    cursor = conn.cursor()
       
    #What we want to do: Take NOW and minus minBirthDate years and save it
    #then take NOW and minus maxBirthDate years and save it
    #now = datetime.date.today()
   
    query = "INSERT INTO messages (To_User_ID, From_User_ID, Message, Read_Status, Time_Stamp, deleted) VALUES ((select User_ID from user_profile where User_Name='"+to_name+"'), '1', '" + message + "', '1', NOW(), '0')" 
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