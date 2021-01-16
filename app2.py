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
    cur.execute("SELECT * FROM persons ORDER BY name")
    persons = cur.fetchall()
    cur.execute("SELECT * FROM members")
    members = cur.fetchall()
    cur.execute("SELECT * FROM parties")
    parties = cur.fetchall()
    return render_template('persons.html', persons=persons, members=members, parties=parties)

@app.route('/parties')
def parties():
    cur = db.cursor()
    cur.execute("SELECT * FROM parties ORDER BY foundation DESC")
    persons = cur.fetchall()
    return render_template('parties.html', persons=persons)


@app.route("/parties/<string:id>")
def d_individual_parties(id):
    cur = db.cursor()
    cur.execute("SELECT * FROM parties WHERE idParties ="+str(id))
    party = cur.fetchone()

    cur.execute("SELECT * FROM members INNER JOIN persons ON members.person = persons.idpersons WHERE party ="+str(id))
    members = cur.fetchall()
    return render_template("ind_party.html", party = party, members = members)


@app.route("/persons/<string:id>")
def d_individual_persons(id):
    cur = db.cursor()
    cur.execute("SELECT * FROM persons WHERE (idpersons = " + str(id) + ")")
    person = cur.fetchone()

    cur.execute("SELECT * FROM members INNER JOIN parties ON members.party = parties.idParties WHERE (person = " + str(id) + ")")
    members = cur.fetchall()

    
    
    return render_template("ind_person.html", person = person, members = members)

@app.route("/elections")
def elections():
    cur = db.cursor()
    cur.execute("SELECT * FROM presidentialelect")
    elections = cur.fetchall()
    return render_template("elections.html", elections = elections)

@app.route("/elections/<string:id>")
def ind_elections(id):
    cur = db.cursor() 
    cur.execute("SELECT * FROM presidentialcand INNER JOIN persons ON (presidentialcand.personId=persons.idpersons) WHERE (election = " + str(id) + ")")
    candicates = cur.fetchall()
    cur.execute("SELECT * FROM presidentialelect WHERE (id=1) ")
    election = cur.fetchone()
    return render_template("ind_presidential_election.html",candicates=candicates, election=election )

if __name__ == '__main__':
    app.run(debug=True)


