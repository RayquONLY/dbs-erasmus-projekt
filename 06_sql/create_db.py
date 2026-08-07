import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="yourusername",
  password="yourpassword"
)

mycursor = mydb.cursor()

mycursor.execute("CREATE DATABASE erasmus_db")

mycursor.execute("""
CREATE TABLE student (
matrikelnummer INTEGER PRIMARY, 
studiengang_id INTEGER NOT NULL, 
vorname VARCHAR(255) NOT NULL, 
nachname VARCHAR(255) NOT NULL, 
email VARCHAR(255) 

FOREIGN KEY (studiengang_id)
REFERENCES studiengang(studiengang_id)
)
""")
