#!/usr/local/bin/python

import MySQLdb
import cgi
import json
import datetime
import re
import random

from cgi import parse_qs, escape

def application(environ, start_response):
    
    #get proper fields
    form = cgi.FieldStorage(fp=environ['wsgi.input'],
                            environ=environ,
                            keep_blank_values=True)

    #Fetch the date info
    date_id = form.getfirst('dateID', 'empty')
    date_id = cgi.escape(date_id)
    status = form.getfirst('State', 'empty')
    status = cgi.escape(status)
    
    #connect to the Database
    conn = MySQLdb.connect (host = "localhost",
                            user = "root",
                            passwd = "",
                            db = "campus chemistry")

    cursor = conn.cursor()
    
    cursor.execute("""UPDATE blinddates SET State=%s WHERE date_id=%s""", (status,date_id))
    
    data = [{"Status":"Success"}]
    output = json.dumps(data)

    status = '200 OK'

    cursor.close()
    conn.commit()
    conn.close()

    response_headers = [('Content-Type', 'application/json'),
                        ('Content-Length', str(len(output)))]
    start_response(status, response_headers)
    return [output]