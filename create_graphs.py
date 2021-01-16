#It is experimental solution for creating graphs
#Before updating it will create graphs by using data

import mysql.connector
import matplotlib.pyplot as plt 

db = mysql.connector.connect(
   host="localhost",
   user="root",
   passwd="12345678",
   database='databasehomework'
)



electionNumber = 1
while electionNumber<2:
    cur = db.cursor()
    cur.execute("SELECT result_percantage, name, surname FROM presidentialcand INNER JOIN persons ON (presidentialcand.personId = persons.idpersons) WHERE (election="+ str(electionNumber) +")")
    election = cur.fetchall()


    data = []
    personName = []
    explode=[]
    for x in election:
        personName.append(x[1] + " " + x[2])
        data.append(x[0])
        explode.append(0.05)
    # Creating plot 
    fig = plt.figure(figsize =(7, 7)) 
    plt.pie(data,explode=explode, labels = personName, autopct='%1.2f%%') 
    
    # show plot 
    adress = "static/" +str(electionNumber)+"_election.svg"
    plt.savefig(adress)
    electionNumber = electionNumber + 1