#!/usr/local/bin/python

import MySQLdb
import cgi
import json

KEY_STR = 'umprojkey6853558'

def application(environ, start_response):
    
    #get proper fields
    form = cgi.FieldStorage(fp=environ['wsgi.input'],
                            environ=environ,
                            keep_blank_values=True)
    
    userName = form.getfirst('emailInput', 'empty')
    userName = cgi.escape(userName)
    password = form.getfirst('passwordInput', 'empty')
    password = cgi.escape(password)
    
    #connect to the Database
    conn = MySQLdb.connect (host = "localhost",
                            user = "root",
                            passwd = "",
                            db = "campus chemistry")
    
    cursor = conn.cursor()
    cursor.execute("""SELECT * FROM user_login WHERE User_Name = %s""", (userName,))
    row = cursor.fetchone()
    
    if row == None:
        cursor.execute("""INSERT INTO user_login (User_ID, User_Name, Password, User_Created, Last_Login, Session_ID) VALUES (679, %s, AES_ENCRYPT(%s,%s), CURRENT_TIMESTAMP, NOW(), 55)""", (userName, password, KEY_STR,))
        data = [{"status":"Inserted user"}]
        output = json.dumps(data)
    else:
        data = [{"status":"User already exists"}]
        output = json.dumps(data)
    
    status = '200 OK'
    
    cursor.close()
    conn.commit()
    conn.close()

    response_headers = [('Content-Type', 'application/json'),
                        ('Content-Length', str(len(output)))]
    start_response(status, response_headers)
    return [output]