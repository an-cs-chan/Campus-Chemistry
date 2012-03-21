#!/usr/local/bin/python

import MySQLdb
import json
import cgi
import string

from wsgiref.simple_server import make_server
from cgi import parse_qs, escape

KEY_STR = 'umprojkey6853558'

def application(environ, start_response):

    #connect to the Database
    conn = MySQLdb.connect (host = "localhost", user = "root", passwd = "", db = "campus chemistry")

    cursor = conn.cursor()
    cursor.execute("SELECT Question, Subject FROM survey_questions")

    rows = cursor.fetchall()
    questions = []
    subjects = []
    for row in rows:
        questions.append(row[0])
        subjects.append(row[1])
    
    cursor = conn.cursor()
    cursor.execute("SELECT answer FROM survey_answer")
    
    rows = cursor.fetchall()
    answers = []
    for row in rows:
        answers.append(row[0])
    
    quiz = []
    for i in range(0,len(questions)):
        quiz.append({"text":string.replace(questions[i], "\x92", "'"),"subject":subjects[i],"answers":answers})

    output = json.dumps(quiz)

    status = '200 OK'

    cursor.close()
    conn.commit()
    conn.close()

    response_headers = [('Content-Type', 'application/json'), ('Content-Length', str(len(output)))]
                        
    start_response(status, response_headers)

    return [output]