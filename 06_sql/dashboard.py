import streamlit as st
from sql_utils import execute_sql
from sql_utils import *

#   TODO:
# - Bewerbungs übersicht (check)
# - Leistungs übersicht
# - Koordinator Übersicht

st.title("Dashboard")

#get all student entries
result_all_students:list[tuple[str]] = execute_sql("SELECT * FROM student;")

students: list[str] = []

#make student selection for dropdown
for entry in result_all_students:
    students.append(f"{entry[Student.matrikelnummer]} {entry[Student.vorname]} {entry[Student.nachname]}")

#select student
student_selection = st.selectbox("Student:", students)
entry_nr:int = students.index(student_selection)
selected_student = result_all_students[entry_nr]

#get bewerbungsübersicht view for selected student
result_view_1:list[tuple] = execute_sql(f"SELECT * FROM v_bewerbungsuebersicht WHERE matrikelnummer = {selected_student[Student.matrikelnummer]};")

#insert table header into table
result_view_1.insert(0, dashboard_table_header)


#wirte out data
st.header("Bewerbungsübersicht")

st.table(result_view_1)


