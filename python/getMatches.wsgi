#!/usr/local/bin/python

import MySQLdb
import cgi
import json
import datetime
import re

from cgi import parse_qs, escape

def application(environ, start_response):
    
    #get proper fields
    form = cgi.FieldStorage(fp=environ['wsgi.input'],
                            environ=environ,
                            keep_blank_values=True)
    
    sort = form.getfirst('sort', 'empty')
    sort = cgi.escape(sort)
    sortOrder = form.getfirst('sortOrder', 'empty')
    sortOrder = cgi.escape(sortOrder)

    #Awful code that converts what we get into SQL parameters. Very dangerous for SQL injection
    sort_later = 'false'
    
    if sort == "Name":
    	sort = 'User_Name'
    
    if sort == "Age":
    	sort = 'DOB'
    	
    if sort == "Compatibility"
    	sort_later = 'true'
    	sort = 'User_Name'
    
    if gender == "Men":
    	gender = "SEX = 'M'"
    
    if gender == "Women":
    	gender = "SEX = 'F'"
    
    if gender == "Men/Women":
    	gender = "(SEX = 'F' OR SEX = 'M')"
    
    if pref == "Men":
    	pref = "orientation = 'M'"
    
    if pref == "Women":
    	pref = "orientation = 'F'"
   
    if pref == "Men/Women":
    	pref = "(orientation = 'F' OR orientation = 'M')"
    	
    #What we want to do: Take NOW and minus minBirthDate years and save it
    #then take NOW and minus maxBirthDate years and save it
    now = datetime.date.today()
       
    minAge = int(minAge)
    maxAge = int(maxAge)
    
    #Takes todays date and minuses the years (365 * year) and spits out in proper format - yyyy-mm-dd
    minBirthDate = (now - datetime.timedelta(maxAge*365)).isoformat()
    maxBirthDate = (now - datetime.timedelta(minAge*365)).isoformat()
    
    #connect to the Database
    conn = MySQLdb.connect (host = "localhost",
                            user = "root",
                            passwd = "",
                            db = "campus chemistry")

    cursor = conn.cursor()
    
    user_string = "SELECT User_Name, Department, User_ID, Body_type, About_Me, Profile_Picture, Email_ID FROM user_profile WHERE " + ethnicityCmd + " AND " + nationalityCmd + " AND " + cityCmd + " AND " + gender + " AND " + pref + " AND DOB BETWEEN '" + minBirthDate + "' AND '" + maxBirthDate + "' ORDER BY " + sort + " " + sortOrder 
  	
    filterPref = "SELECT User_Name, Department, User_ID, Body_type, About_Me, Profile_Picture, Email_ID FROM user_profile WHERE " + ethnicityCmd + " AND " + nationalityCmd + " AND " + cityCmd + " AND " + gender + " AND " + pref + " AND DOB BETWEEN '" + minBirthDate + "' AND '" + maxBirthDate + "' ORDER BY " + sort + " " + sortOrder 
  	
    if ethnicity == "Any" and nationality == "Any" and city == "Any":
        filterPref = "SELECT User_Name, Department, User_ID, Body_type, About_Me, Profile_Picture, Email_ID FROM user_profile WHERE " + gender + " AND " + pref + " AND DOB BETWEEN '" + minBirthDate + "' AND '" + maxBirthDate + "' ORDER BY " + sort + " " + sortOrder                
    elif ethnicity == "Any" and nationality != "Any" and city == "Any":
        filterPref = "SELECT User_Name, Department, User_ID, Body_type, About_Me, Profile_Picture, Email_ID FROM user_profile WHERE " + nationalityCmd + " AND " + gender + " AND " + pref + " AND DOB BETWEEN '" + minBirthDate + "' AND '" + maxBirthDate + "' ORDER BY " + sort + " " + sortOrder
    elif ethnicity != "Any" and nationality == "Any" and city == "Any":
        filterPref = "SELECT User_Name, Department, User_ID, Body_type, About_Me, Profile_Picture, Email_ID FROM user_profile WHERE " + ethnicityCmd + " AND " + gender + " AND " + pref + " AND DOB BETWEEN '" + minBirthDate + "' AND '" + maxBirthDate + "' ORDER BY " + sort + " " + sortOrder
    elif ethnicity == "Any" and nationality == "Any" and city != "Any":
        filterPref = "SELECT User_Name, Department, User_ID, Body_type, About_Me, Profile_Picture, Email_ID FROM user_profile WHERE " + cityCmd + " AND " + gender + " AND " + pref + " AND DOB BETWEEN '" + minBirthDate + "' AND '" + maxBirthDate + "' ORDER BY " + sort + " " + sortOrder    
    elif ethnicity != "Any" and nationality != "Any" and city == "Any":
        filterPref = "SELECT User_Name, Department, User_ID, Body_type, About_Me, Profile_Picture, Email_ID FROM user_profile WHERE " + ethnicityCmd + " AND " + nationalityCmd + " AND " + gender + " AND " + pref + " AND DOB BETWEEN '" + minBirthDate + "' AND '" + maxBirthDate + "' ORDER BY " + sort + " " + sortOrder
    elif ethnicity != "Any" and nationality == "Any" and city != "Any":
        filterPref = "SELECT User_Name, Department, User_ID, Body_type, About_Me, Profile_Picture, Email_ID FROM user_profile WHERE " + ethnicityCmd + " AND " + cityCmd + " AND " + gender + " AND " + pref + " AND DOB BETWEEN '" + minBirthDate + "' AND '" + maxBirthDate + "' ORDER BY " + sort + " " + sortOrder    
    elif ethnicity == "Any" and nationality != "Any" and city != "Any":
        filterPref = "SELECT User_Name, Department, User_ID, Body_type, About_Me, Profile_Picture, Email_ID FROM user_profile WHERE " + nationalityCmd + " AND " + cityCmd + " AND " + gender + " AND " + pref + " AND DOB BETWEEN '" + minBirthDate + "' AND '" + maxBirthDate + "' ORDER BY " + sort + " " + sortOrder                
        
    cursor.execute(filterPref)
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