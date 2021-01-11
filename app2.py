from flask import Flask, render_template, request, redirect
from flask_mysqldb import MySQL
import mysql.connector
import yaml

app = Flask(__name__)

db = mysql.connector.connect(
   host="localhost",
   user="root",
   passwd="12345678",
   database='databasehomework'
)
mysql = MySQL(app)


@app.route('/persons')
def users():
    cur = db.cursor()
    cur.execute("SELECT * FROM persons")
    persons = cur.fetchall()
    cur.execute("SELECT * FROM members")
    members = cur.fetchall()
    cur.execute("SELECT * FROM parties")
    parties = cur.fetchall()
    return render_template('persons.html', persons=persons, members=members, parties=parties)

@app.route('/parties')
def parties():
    cur = db.cursor()
    cur.execute("SELECT * FROM parties")
    persons = cur.fetchall()
    return render_template('parties.html', persons=persons)

@app.route("/parties/<string:id>")
def individual_parties(id):
    cur = db.cursor()
    cur.execute("SELECT * FROM parties")
    parties = cur.fetchall()
    for x in parties:
        if(x[2] == id):
            return "<h1>"+str(x[1])+ "</h1>"
    return "Not found"

@app.route("/persons/<string:id>")
def individual_persons(id):
    cur = db.cursor()
    cur.execute("SELECT * FROM persons")
    persons = cur.fetchall()
    for x in persons:
        if(int(x[0]) == int(id)):
            return "<h1>"+str(x[1])+" "+str(x[2])+ "</h1>"
    return "Not found"

if __name__ == '__main__':
    app.run(debug=True)


