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
    message_id = form.getfirst('id', 'empty')
    message_id = cgi.escape(message_id)
    
    try:
    #connect to the Database
     conn = MySQLdb.connect (host = "localhost",
                            user = "root",
                            passwd = "",
                            db = "campus chemistry")
     print "Success"
    except MySQLdb.Error, e:
     print "Error %d: %s" % (e.args[0], e.args[1])
     sys.exit (1)

    cursor = conn.cursor()      
    query = "delete from messages WHERE To_User_ID = '13' and Message_ID = " + message_id  
    print query

    try:
    #connect to the Database
     cursor.execute(query)
     data = [{"status":"Message Sent"}]
     output = json.dumps(data)
    except MySQLdb.Error, e:
     data = [{"status":"Message Failed"}]
     output = json.dumps(data)
    #for row in rows:
    # print "%s, %s, %s, %s" % (row[0], row[1], row[2], row[3])
    #print "Number of rows returned: %d" % cursor.rowcount

    status = '200 OK'
    
    cursor.close()
    conn.commit()
    conn.close()

    response_headers = [('Content-Type', 'application/json'),
                        ('Content-Length', str(len(output)))]
    start_response(status, response_headers)
    return [output]