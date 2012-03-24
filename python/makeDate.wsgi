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

    #Fetch the userIDs
    from_id = form.getfirst('userID', 'empty')
    from_id = cgi.escape(from_id)
    to_id = form.getfirst('toID', 'empty')
    to_id = cgi.escape(to_id)
    
    #Fetch the time, date, message
    time = form.getfirst('dateTime', 'empty')
    time = cgi.escape(time)
    date = form.getfirst('dateDate', 'empty')
    date = cgi.escape(date)
    mess = form.getfirst('dateMessage', 'empty')
    mess = cgi.escape(mess)
    
    #Set up the date/time handler
    dthandler = lambda obj: obj.isoformat() if isinstance(obj, datetime.datetime) else None
    
    #connect to the Database
    conn = MySQLdb.connect (host = "localhost",
                            user = "root",
                            passwd = "",
                            db = "campus chemistry")

    cursor = conn.cursor()
    
    cursor.execute("""INSERT INTO blinddates (To_User_ID, From_User_ID, Date, Time, Message) VALUES (%s, %s, %s, %s, %s)""", (to_id, from_id, time, date, mess))
    
    data = [{"Status":"Success"}]
    output = json.dumps(data, default=dthandler)

    status = '200 OK'

    cursor.close()
    conn.commit()
    conn.close()

    response_headers = [('Content-Type', 'application/json'),
                        ('Content-Length', str(len(output)))]
    start_response(status, response_headers)
    return [output]