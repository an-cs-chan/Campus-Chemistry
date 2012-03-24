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

    #Fetch the userID
    user_id = form.getfirst('userID', 'empty')
    user_id = cgi.escape(user_id)
    
    #Set up the date/time handler
    dthandler = lambda obj: obj.isoformat() if isinstance(obj, datetime.datetime) else None
    
    #connect to the Database
    conn = MySQLdb.connect (host = "localhost",
                            user = "root",
                            passwd = "",
                            db = "campus chemistry")

    cursor = conn.cursor()
    
    cursor.execute("""SELECT * FROM user_profile up WHERE up.User_ID = %s""", (user_id))
    row = cursor.fetchone()
    
    user_data = row
    now = datetime.date.today()
    minBirthDate = (now - datetime.timedelta(user_data[28]*365)).isoformat()
    maxBirthDate = (now - datetime.timedelta(user_data[27]*365)).isoformat()
    user_gender = user_data[4]
    user_pref = user_data[25]
    #Gets all matches not currently in a date that fit preferences
    cursor.execute("""SELECT User_Name, Department, User_ID, Body_type, About_Me, Profile_Picture, Email_ID FROM user_profile up WHERE up.DOB BETWEEN %s AND %s AND up.Orientation = %s AND up.Sex = %s AND NOT EXISTS (SELECT * FROM blinddates bd WHERE ((bd.From_User_ID = up.User_ID AND bd.To_User_ID = %s) OR (bd.To_User_ID = up.User_ID AND bd.From_User_ID = %s)) AND bd.State = 'Open')""", (minBirthDate, maxBirthDate, user_gender, user_pref, user_id, user_id))
    matches = cursor.fetchall()
    matches = list(matches)
    
    cursor.execute("""SELECT * FROM user_survey_answers usa WHERE usa.user_id = %s""", (user_id))
    user_answers = cursor.fetchone()
    compat_matches = []
    	
    for place, match in enumerate(matches):
    	matches[place] = list(match)
    	cursor.execute("""SELECT * FROM user_survey_answers usa WHERE usa.user_id = %s""", (matches[place][2]))
    	match_answers = cursor.fetchone()
    	compat = -1
    	if match_answers != None:
    		if user_answers != None:
    			compat = 0
    			for index, answer in enumerate(user_answers):
    				compat = compat + math.fabs(answer-match_answers[index])
    	matches[place].append(compat)
    	if compat >= 0:
    		compat_matches.append(matches.pop(place))
    
    random.shuffle(compat_matches)
    data = compat_matches[:3]
    if len(data) < 3:
    	random.shuffle(matches)
    	data.extend(matches[len(data):3])
    output = json.dumps(data, default=dthandler)

    status = '200 OK'

    cursor.close()
    conn.commit()
    conn.close()

    response_headers = [('Content-Type', 'application/json'),
                        ('Content-Length', str(len(output)))]
    start_response(status, response_headers)
    return [output]