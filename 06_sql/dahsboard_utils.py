from enum import IntEnum

#def build_table(*args:list[str]) -> dict[str, list[str]]:
#    if args == None:
#        return {}
#
#    for first_row in args:
#        dict[]

dashboard_table_header = (
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

class Student(IntEnum):
    matrikelnummer = 0
    studiengang_id = 1
    vorname = 2
    nachname = 3
    email = 4