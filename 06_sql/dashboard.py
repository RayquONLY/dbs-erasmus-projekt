import streamlit as st
from create_db import execute_sql
from dahsboard_utils import *

#View übersicht
#Leistungs übersicht

#Koordinator Übersicht

st.title("Dashboard")

#Get all student entries
result1:list[tuple[str]] = execute_sql("SELECT * FROM student;")

students: list[str] = []

for entry in result1:
    students.append(f"{entry[Student.matrikelnummer]} {entry[Student.vorname]} {entry[Student.nachname]}")

student_selection = st.selectbox("Student:", students)
entry_nr:int = students.index(student_selection)
selected_student = result1[entry_nr]

result2:list[tuple] = execute_sql(f"SELECT * FROM v_bewerbungsuebersicht WHERE matrikelnummer = {selected_student[Student.matrikelnummer]};")

result2.insert(0, dashboard_table_header)

st.header("Bewerbungsübersicht")

st.table(result2)