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
    return render_template('persons.html', persons=persons)
if __name__ == '__main__':
    app.run(debug=True)


