from flask import Flask, render_template, request, redirect,flash
from flask_mysqldb import MySQL
import mysql.connector
import yaml
from datetime import datetime
app = Flask(__name__)

db = mysql.connector.connect(
   host="localhost",
   user="root",
   passwd="12345678",
   database='databasehomework'
)
mysql = MySQL(app)
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'

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
    cur.execute("SELECT * FROM parties ORDER BY name")
    persons = cur.fetchall()
    return render_template('parties.html', persons=persons)


@app.route("/parties/<string:id>",methods=['GET', 'POST'])
def d_individual_parties(id):
    if request.method == 'POST':
        userDetails = request.form
        name = userDetails['name']
        comment = userDetails['comment']

        if name == "" or comment == "":
            flash("Please fill your name or comment","error")
        else:
            today = datetime.now()
            cur = db.cursor()
            cur.execute("INSERT INTO comments(name, comment,datetime, categoryid, category) VALUES(%s, %s,%s,%s,%s)",(name, comment,today,2,id))
            db.commit()
            cur.close()
    cur = db.cursor()
    cur.execute("SELECT * FROM parties WHERE idParties ="+str(id))
    party = cur.fetchone()

    cur.execute("SELECT * FROM members INNER JOIN persons ON members.person = persons.idpersons WHERE party ="+str(id))
    members = cur.fetchall()

    cur.execute("SELECT percantage, seat, date, generalelections.id FROM ge_result INNER JOIN generalelections ON (ge_result.election=generalelections.id) WHERE(partyid="+str(id)+") ORDER BY date DESC")
    elections = cur.fetchall()

    cur.execute("SELECT name,comment,datetime FROM comments WHERE(categoryid=2 AND category="+str(id)+")")
    comments = cur.fetchall()
    return render_template("ind_party.html", party = party, members = members, elections=elections, comments=comments)


@app.route("/persons/<string:id>")
def d_individual_persons(id):
    cur = db.cursor()
    cur.execute("SELECT * FROM persons WHERE (idpersons = " + str(id) + ")")
    person = cur.fetchone()

    cur.execute("SELECT * FROM members INNER JOIN parties ON members.party = parties.idParties WHERE (person = " + str(id) + ") ORDER BY started")
    members = cur.fetchall()

    cur.execute("SELECT result_percantage, date,presidentialelect.id FROM presidentialcand INNER JOIN presidentialelect ON (presidentialcand.election=presidentialelect.id) WHERE (personId = " + str(id) + ")")
    elections = cur.fetchall()

    cur.execute("SELECT * FROM ge_result WHERE(personid=" + str(id) + ")")
    isJoinedGeneralElection = cur.fetchall()
    generalElection = False
    if isJoinedGeneralElection:
        generalElection = True
    return render_template("ind_person.html", person = person, members = members, elections=elections, generalElection=generalElection)

@app.route("/elections")
def elections():
    cur = db.cursor()
    cur.execute("SELECT * FROM presidentialelect")
    elections = cur.fetchall()

    cur.execute("SELECT * FROM generalelections ORDER BY date DESC")
    generalElections = cur.fetchall()
    return render_template("elections.html", elections = elections, generalElections=generalElections)

@app.route("/elections/<string:id>")
def ind_elections(id):
    cur = db.cursor() 
    cur.execute("SELECT * FROM presidentialcand INNER JOIN persons ON (presidentialcand.personId=persons.idpersons) WHERE (election = " + str(id) + ") ORDER BY result_percantage DESC")
    candicates = cur.fetchall()
    cur.execute("SELECT * FROM presidentialelect WHERE (id="+str(id)+") ")
    election = cur.fetchone()
    return render_template("ind_presidential_election.html",candicates=candicates, election=election )

@app.route("/elections/general/<string:id>", methods=['GET', 'POST'])
def ind_general_elections(id):
    if request.method == 'POST':
        userDetails = request.form
        name = userDetails['name']
        comment = userDetails['comment']

        if name == "" or comment == "":
            flash("Please fill your name or comment","error")
        else:
            today = datetime.now()
            cur = db.cursor()
            cur.execute("INSERT INTO comments(name, comment,datetime, categoryid, category) VALUES(%s, %s,%s,%s,%s)",(name, comment,today,1,id))
            db.commit()
            cur.close()
    cur = db.cursor()
    Command = "SELECT percantage,vote,seat,parties.name,shortname, parties.img,parties.idParties, persons.name, persons.surname, persons.img,persons.idpersons FROM ge_result INNER JOIN parties ON (ge_result.partyid=parties.idParties) INNER JOIN persons ON (ge_result.personid = persons.idpersons) WHERE(election="+str(id)+")"
    cur.execute(Command)
    results = cur.fetchall()
    cur.execute("SELECT * FROM generalelections WHERE (id ="+ str(id)+" )")
    election = cur.fetchone()

    cur.execute("SELECT name,comment,datetime FROM comments WHERE(categoryid=1 AND category="+str(id)+")")
    comments = cur.fetchall()
    return render_template("ind_general_election.html", results = results,election=election,comments=comments)

@app.route("/graphs")
def graphs():
    
    cur = db.cursor()
    cur.execute("SELECT id, date FROM generalelections")
    elections = cur.fetchall()
    return render_template("graphs.html", elections=elections)

@app.route("/debug", methods=['GET', 'POST'])
def d_comment():
    if request.method == 'POST':
        userDetails = request.form
        name = userDetails['name']
        comment = userDetails['comment']
        today = datetime.now()
        cur = db.cursor()
        cur.execute("INSERT INTO comments(name, comment,datetime) VALUES(%s, %s,%s)",(name, comment,today))
        db.commit()
        cur.close()
    return render_template("index4.html")

@app.route("/")
def mainpage():
    cur = db.cursor()
    cur.execute("SELECT img,idParties FROM parties ORDER BY name")
    parties = cur.fetchall()

    table = []
    
    i = 0
    while i < len(parties):
        k = 0
        row = []
        row.clear()
        while k < 5:
            if i+k<len(parties):
                row.append(parties[i+k])
            k = k + 1
        table.append(row)
        i = i + k
    

    cur.execute("SELECT img,idpersons FROM persons ORDER BY name")
    persons = cur.fetchall()

    persontable = []
    
    i = 0
    while i < len(persons):
        k = 0
        row = []
        row.clear()
        while k < 5:
            if i+k<len(persons):
                row.append(persons[i+k])
            k = k + 1
        persontable.append(row)
        i = i + k
    
    return render_template("main.html" ,table=table,persontable=persontable)
if __name__ == '__main__':
    app.run(debug=True)


