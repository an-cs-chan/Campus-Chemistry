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
    
    userId = form.getfirst('loginEmail', 'empty')
    userId = cgi.escape(userId)
    userId = userId.lower()
    password = form.getfirst('loginPassword', 'empty')
    password = cgi.escape(password)

    #connect to the Database
    conn = MySQLdb.connect (host = "localhost",
                            user = "root",
                            passwd = "",
                            db = "campus chemistry")
    
    cursor = conn.cursor()
    cursor.execute("""SELECT User_ID, AES_DECRYPT(Password,%s) FROM user_login WHERE User_ID = %s""", (KEY_STR, userId,))
    row = cursor.fetchone()
    
    sess_cookie = Cookie.SimpleCookie()
    user_cookie = Cookie.SimpleCookie()
    
    if row == None:
        data = [{"status":"Incorrect credentials"}]
        output = json.dumps(data)
    else:
    	if row[1] == password:
        	data = [{"status":"User found"}]
        	rand_digs = string.ascii_uppercase + string.ascii_lowercase + string.digits
        	session_id = ''.join(random.sample(rand_digs,24))
        	cursor.execute("""UPDATE user_login SET Session_ID = %s WHERE User_ID = %s""", (session_id, userId,))
        	sess_cookie['sessionid'] = session_id
        	sess_cookie['sessionid']['path'] = '/'
        	user_cookie['userid'] = userId
        	user_cookie['userid']['path'] = '/'
        else:
        	#data = [{"status":"Incorrect credentials"}]
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