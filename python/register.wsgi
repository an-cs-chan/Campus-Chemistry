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
    
    userId = form.getfirst('emailInput', 'empty')
    userId = cgi.escape(userId)
    userName = userId[:userId.index('@')]
    userId = userId.lower()
    password = form.getfirst('passwordInput', 'empty')
    password = cgi.escape(password)

    #connect to the Database
    conn = MySQLdb.connect (host = "localhost",
                            user = "root",
                            passwd = "",
                            db = "campus chemistry")
    
    cursor = conn.cursor()
    cursor.execute("""SELECT * FROM user_login WHERE User_ID = %s""", (userId,))
    row = cursor.fetchone()
    
    sess_cookie = Cookie.SimpleCookie()
    user_cookie = Cookie.SimpleCookie()
    
    if row == None:
    	rand_digs = string.ascii_uppercase + string.ascii_lowercase + string.digits
        session_id = ''.join(random.sample(rand_digs,24))
        cursor.execute("""INSERT INTO user_login (User_ID, User_Name, Password, Email_ID, User_Created, Last_Login, Session_ID) VALUES (%s, %s, AES_ENCRYPT(%s,%s), %s, CURRENT_TIMESTAMP, NOW(), %s)""", (userId, userName, password, KEY_STR, userId, session_id))
        cursor.execute("""INSERT INTO user_profile (User_ID, User_Name, Email_ID, User_Created) VALUES (%s, %s, %s, CURRENT_TIMESTAMP)""", (userId, userName, userId,))
        
        sess_cookie['sessionid'] = session_id
        sess_cookie['sessionid']['path'] = '/'
        user_cookie['userid'] = userId
        user_cookie['userid']['path'] = '/'
        
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
                        ('Content-Length', str(len(output))),
                        ('Set-Cookie', sess_cookie.output().replace('Set-Cookie: ', '', 1)),
                        ('Set-Cookie', user_cookie.output().replace('Set-Cookie: ', '', 1))]
    start_response(status, response_headers)
    return [output]