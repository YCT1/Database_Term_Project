#It is experimental solution for creating graphs
#Before updating it will create graphs by using data
import matplotlib.pyplot as plt; plt.rcdefaults()
import mysql.connector
import matplotlib.pyplot as plt 

db = mysql.connector.connect(
   host="localhost",
   user="root",
   passwd="12345678",
   database='databasehomework'
)



electionNumber = 1
while electionNumber<3:
    cur = db.cursor()
    cur.execute("SELECT result_percantage, name, surname FROM presidentialcand INNER JOIN persons ON (presidentialcand.personId = persons.idpersons) WHERE (election="+ str(electionNumber) +") ORDER BY result_percantage")
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


cur = db.cursor()
cur.execute("SELECT DISTINCT personId FROM presidentialcand")
candicates = cur.fetchall()
i = 0
while i<len(candicates):
    cur = db.cursor()
    cur.execute("SELECT result_percantage, date FROM presidentialcand INNER JOIN presidentialelect ON (presidentialcand.election=presidentialelect.id) WHERE (personId = "+str(candicates[i][0])+") ORDER by date")
    electionResult = cur.fetchall()

    year = []
    y = []
    labels = []
    for x in electionResult:
        year.append(str(x[1].year))
        y.append(x[0])

    fig2 = plt.figure() 

    ax = fig2.add_axes([0.1,0.1,0.8,0.8])
    ax.bar(year,y,align='center', alpha=0.5)

    plt.ylabel('Percantage of Votes')
    plt.title('Presidential Elections')
    rects = ax.patches


    for rect, y in zip(rects, y):
        height = rect.get_height()
        ax.text(rect.get_x() + rect.get_width() / 2, height , y,
                ha='center', va='bottom')
    
    adress = "static/" + str(candicates[i][0]) + "_presidential_graph.svg"
    plt.savefig(adress)
    i = i + 1

i = 1
cur = db.cursor()
cur.execute("SELECT id FROM generalelections")
electionData = cur.fetchall()
while i < 9:
    cur = db.cursor()
    cur.execute("SELECT seat, shortname, election FROM ge_result INNER JOIN parties ON (ge_result.partyid=parties.idParties) WHERE (election="+ str(i)+")")
    results = cur.fetchall()

    data = []
    partName = []
    explode=[]
    for x in results:
        data.append(x[0])
        partName.append(x[1] + " : " + str(x[0]))
        explode.append(0.05)

    fig = plt.figure(figsize =(7, 7))
    plt.title('TBMM Seat') 
    plt.pie(data,explode=explode, labels = partName, autopct='%1.2f%%')
    adress = "static/" + str(i) + "_general_election_graph.svg"
    plt.savefig(adress)
    i = i + 1


cur = db.cursor()
cur.execute("SELECT DISTINCT partyid FROM ge_result")
parties = cur.fetchall()
i = 0
while i < len(parties):
    cur = db.cursor()
    cur.execute("SELECT percantage, seat, date, partyid FROM ge_result INNER JOIN generalelections ON (ge_result.election=generalelections.id) WHERE(partyid="+str(parties[i][0]) +") ORDER BY date DESC")
    result = cur.fetchall()

    year = []
    seat = []
    percantage = []
    labels = []
    for x in result:
        year.append(str(x[2].year) +"-"+ str(x[2].month))
        seat.append(x[1])
        percantage.append(x[0])

    #Seat graph
    fig2 = plt.figure() 

    ax = fig2.add_axes([0.1,0.1,0.8,0.8])
    ax.bar(year,seat,align='center', alpha=0.5)

    plt.ylabel('Seat in TBMM')
    plt.title('General Elections')
    rects = ax.patches


    for rect, seat in zip(rects, seat):
        height = rect.get_height()
        ax.text(rect.get_x() + rect.get_width() / 2, height , seat,
                ha='center', va='bottom')

    adress = "static/" + str(parties[i][0]) + "_party_graph.svg"
    plt.savefig(adress)

    #Percantage Graph
    fig2 = plt.figure() 

    ax = fig2.add_axes([0.1,0.1,0.8,0.8])
    ax.bar(year,percantage,align='center', alpha=0.5)

    plt.ylabel('Pertange of Votes')
    plt.title('General Elections')
    rects = ax.patches


    for rect, percantage in zip(rects, percantage):
        height = rect.get_height()
        ax.text(rect.get_x() + rect.get_width() / 2, height , str(percantage) + "%",
                ha='center', va='bottom')

    adress = "static/" + str(parties[i][0]) + "_party_p_graph.svg"
    plt.savefig(adress)


    i = i + 1


i = 0
cur = db.cursor()
cur.execute("SELECT idpersons FROM persons")
persons = cur.fetchall()
while i < len(persons):
    cur = db.cursor()
    cur.execute("SELECT percantage, date, shortname FROM ge_result JOIN generalelections ON (ge_result.election = generalelections.id) JOIN parties ON (ge_result.partyid = parties.idParties) WHERE(personid="+ str(persons[i][0])+")")
    results = cur.fetchall()

    year = []
    percantage = []
    for x in results:
        year.append(str(x[1].year) +"-"+ str(x[1].month) +"-" + str(x[2]) )
        percantage.append(x[0])

    fig2 = plt.figure()
    ax = fig2.add_axes([0.1,0.1,0.8,0.8])
    ax.bar(year,percantage,align='center', alpha=0.5)
    plt.ylabel('General Election Performance')
    plt.title('General Elections')
    rects = ax.patches
    for rect, percantage in zip(rects, percantage):
        height = rect.get_height()
        ax.text(rect.get_x() + rect.get_width() / 2, height , str(percantage) + "%",ha='center', va='bottom')

    adress = "static/" + str(persons[i][0]) + "_person_party_graph.svg"
    plt.savefig(adress)
    i = i + 1