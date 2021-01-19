from flask import Flask,render_template, request, redirect,url_for
from sqlalchemy import Table, Column, Integer, ForeignKey, String, DateTime
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////Users/yekta/Desktop/dataBase_Homework/database.db'
db = SQLAlchemy(app)

Base = declarative_base()


class Person(db.Model):
    __tablename__ = 'Person'
    id = Column(Integer, primary_key=True)
    Name = Column(String(80))
    Surname = Column(String(80))
    Hometown = Column(String(80))
    Date_of_Birth = Column(DateTime)
    Date_of_Death = Column(DateTime)
    img = Column(String(80))
    parties = relationship("Leader")


class Leader(db.Model):
    __tablename__ = 'Leader'
    id = Column(Integer, primary_key=True)
    Date_Started = Column(DateTime)
    Date_Ended = Column(DateTime)
    person_id = Column(Integer, ForeignKey('Person.id'))
    party_id = Column(Integer, ForeignKey('Party.id'))
    

class Party(db.Model):
    __tablename__ = 'Party'
    id = Column(Integer, primary_key=True)
    Name = Column(String(80))
    Foundation_Date = Column(DateTime)
    Dissolution_Date = Column(DateTime)
    img = Column(String(80))
    parties = relationship("Leader")


@app.route("/")
def index():
    persons = Person.query.all()
    party = Party.query.all()
    return render_template("index2.html", persons=persons, party=party)

if __name__ == "__main__":
    app.run(debug=True)