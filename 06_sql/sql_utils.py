from enum import IntEnum
from psycopg2.errors import ProgrammingError
from psycopg2 import connect
from dotenv import load_dotenv
from os import getenv

load_dotenv()

def execute_sql(command: str) -> list:
    db_user = getenv("DB_USER")
    db_password = getenv("DB_PASSWORD")
    db_name = getenv("DB_NAME")
  
    connector = connect(
        dbname=db_name,
        user=db_user,
        password=db_password,
        host="localhost",
    )

    connector.autocommit = True
    cursor = connector.cursor()


    cursor.execute(command)
    try:
      result = cursor.fetchall()
    except ProgrammingError as e:
      cursor.close()
      connector.close()
      return []

    cursor.close()
    connector.close()

    if result == None:
       return []

    return result

view_1_table_header = (
    "bewerbung_id",
    "bewerbungsrunde",
    "matrikelnummer",
    "vorname",
    "nachname",
    "studiengang",
    "bewerbungsstatus",
    "prioritaet",
    "partneruniversitaet",
    "stadt",
    "land",
    "studienphase",
    "akademisches_jahr",
    "auswahlstatus",
    "nominierungsstatus"
)

view_2_table_header = (
   "LA_version",
   "Gastkurs_name",
   "ECTS",
   "HU_Kurs",
   "Status",
   "Matrikelnummer",
   "Note",
   "Bestanden"
)

view_3_table_header = (
    "HU_Modul_ECTS",
    "HU-Modul_Name",
    "hu_modul_id",
    "anerkannte_ects",
    "entscheidung",
    "gastkurs_id",
    "Gastkurs_ECTS",
    "Note",
    "bestanden",
    "matrikelnummer",
)

class Student(IntEnum):
    matrikelnummer = 0
    studiengang_id = 1
    vorname = 2
    nachname = 3
    email = 4