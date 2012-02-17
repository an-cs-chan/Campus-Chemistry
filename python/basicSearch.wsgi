#!C:/Python27/python.exe

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
    
    gender = form.getfirst('gender', 'empty')
    gender = cgi.escape(gender)
    pref = form.getfirst('pref', 'empty')
    pref = cgi.escape(pref)
    minAge = form.getfirst('minAge', 'empty')
    minAge = cgi.escape(minAge)
    maxAge = form.getfirst('maxAge', 'empty')
    maxAge = cgi.escape(maxAge)
        
    #connect to the Database
    conn = MySQLdb.connect (host = "localhost",
                            user = "root",
                            passwd = "",
                            db = "campus chemistry")
    
    cursor = conn.cursor()
    
    #What we want to do: Take NOW and minus minBirthDate years and save it
    #then take NOW and minus maxBirthDate years and save it
    now = datetime.date.today()
       
    minAge = int(minAge)
    maxAge = int(maxAge)
    
    #Takes todays date and minuses the years (365 * year) and spits out in proper format - yyyy-mm-dd
    minBirthDate = (now - datetime.timedelta(minAge*365)).isoformat()
    maxBirthDate = (now - datetime.timedelta(maxAge*365)).isoformat()
    
    #Select the user_name, relationship type and martial status
    cursor.execute("""SELECT User_Name, Department, Relationship_Type FROM user_profile WHERE SEX = %s AND DOB BETWEEN %s AND %s""", (gender,maxBirthDate,minBirthDate,))
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