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
