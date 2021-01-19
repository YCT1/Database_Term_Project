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




cur = db.cursor()
cur.execute("SELECT percantage, date, shortname FROM ge_result JOIN generalelections ON (ge_result.election = generalelections.id) JOIN parties ON (ge_result.partyid = parties.idParties) WHERE(personid=11)")
results = cur.fetchall()

year = []
percantage = []
for x in results:
    year.append(str(x[1].year) +"-"+ str(x[1].month) +": " + str(x[2]) )
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

plt.show()