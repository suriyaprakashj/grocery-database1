import mysql.connector  #  we are importing mysql connector to connect with database by using commmand  pip install mysql-connector-python
from mysql.connector import errorcode  # This module contains both MySQL server and client error codes to give errors if any mistakes 
def select(conn,query):   # the python that excutes a select query function 
    cursor = conn.cursor()# the cursor is nothing but a pointer point to the database.The function cretaes the cursor to execute the querya cursor is an object that enables to navigate through rows of result set
    cursor.execute(query) #the we have cursor then we can execute() a funtion for issue commands to database 
    results = []   # the list will store in empty list 
    for row in cursor.fetchall():# for loop is used go through the rows here for retriving rows  fetchall is command is uded to retrive a set of rows as result
        results.append(row)     # the result list append the ansers theresult list while we adding row upon row 
    cursor.close()           # if we are out of the rows we will use close the cursor and the pointer   function
    return results     # and returning the results list of retrived rows
def execute(conn,query):  #  execute is used for update, delete,and insert
    cursor = conn.cursor()
    cursor.execute(query)
    conn.commit()    # commit is used to finilize the action 
def show(rows):     # whatever the data retrived from grocerydatabasetable for printing them a function is used is called show() what ever the data we are inserting it will come in ,
    for row in rows:
        print(row) # what ever the data retrived we are printing

try: #try to connect with database here mysql connector library use a functoion connect which allows to connect with to mysql database 
    conn = mysql.connector.connect(    #  conn is a connection between my program and the database where we store connection in a variable called conn.
        user="root",  # credentials
        password="",   # no password
        host="localhost",  # running on localmachine
        database="grocerydatabase") 
except mysql.connector.Error as err: # like catch exception we use except 
    print("Cannot connect.")  # if it is not connect we will print not onnect 
    exit()

rows = select(conn,"select * from customer where Firstname = 'surya'") #we can run any select  query
show(rows)  # show is used to display the results 
print("Now insert a record")
execute(conn,"insert into customer values ('AA100','jaliparthi','suryaprakash','200Avenue','Bellevue','seatlle',60008,'suryaprakash@gmail.com',2066705704)") # here execute will go to main funtion conn cursor object execute the quesry
rows = select(conn,"select * from customer") # caling select function if the new aded person is there or not 
show(rows)  
