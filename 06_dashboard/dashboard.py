import streamlit as st
from utils.sql_utils import *

st.markdown("""
<style>
[data-testid="stMetric"] {
    background-color: #f6f7f9;
    border: 1px solid #e5e7eb;
    padding: 12px 16px;
    border-radius: 10px;
}

[data-testid="stMetricLabel"] {
    font-size: 14px;
}

[data-testid="stMetricValue"] {
    font-size: 18px;
}
</style>
""", unsafe_allow_html=True)

#   TODO:
# - Bewerbungs übersicht (check)
# - Leistungs übersicht (check)
# - Anerkennungs übersicht (check)

#get all student entries
result_all_students:list[tuple[str]] = execute_sql("SELECT * FROM student;")

students: list[str] = []

#make student selection for dropdown
for entry in result_all_students:
    students.append(f"{entry[Student.matrikelnummer]} {entry[Student.vorname]} {entry[Student.nachname]}")

st.title("Dashboard")

#select student
student_selection = st.selectbox("Student:", students)
entry_nr:int = students.index(student_selection)
selected_student = result_all_students[entry_nr]

#get bewerbungsübersicht view for selected student
result_view_1:list[tuple] = execute_sql(f"SELECT * FROM v_bewerbungsuebersicht WHERE matrikelnummer = {selected_student[Student.matrikelnummer]};")

#insert table header into table
result_view_1.insert(0, view_1_table_header)

# Kennzahlen
bewerbungsstatus = result_view_1[1][6]

anerkannte_ects = execute_sql(
    f"SELECT COALESCE(SUM(anerkannte_ects), 0) "
    f"FROM v_anerkennungsuebersicht "
    f"WHERE Matrikelnummer = {selected_student[Student.matrikelnummer]};"
)[0][0]

la_versionen = execute_sql(
    f"SELECT COUNT(DISTINCT LA_version) "
    f"FROM v_leistungsuebersicht "
    f"WHERE Matrikelnummer = {selected_student[Student.matrikelnummer]};"
)[0][0]

col1, col2, col3 = st.columns(3)

col1.metric("Bewerbungsstatus", bewerbungsstatus)
col2.metric("Anerkannte ECTS", anerkannte_ects)
col3.metric("LA-Versionen", la_versionen)




tab1, tab2, tab3 = st.tabs([
    "Bewerbung",
    "Learning Agreement",
    "Anerkennung"
])


#wirte out data
with tab1:
 st.header("Bewerbungsübersicht")

 st.table(result_view_1)


with tab2:
    st.header("Leistungsübersicht")

    #get leistungsuebersicht
    result_la_versions_raw:list[tuple[str]] = execute_sql(f"SELECT DISTINCT LA_version FROM v_leistungsuebersicht WHERE Matrikelnummer = {selected_student[Student.matrikelnummer]}")
    result_la_versions:list[str] = [x[0] for x in result_la_versions_raw]
    result_view_2:list[tuple] = []

    #get leistungsuebersicht
    result_la_versions_raw:list[tuple[str]] = execute_sql(f"SELECT DISTINCT LA_version FROM v_leistungsuebersicht WHERE Matrikelnummer = {selected_student[Student.matrikelnummer]}")

    #format results
    result_la_versions:list[str] = [x[0] for x in result_la_versions_raw]

    result_view_2:list[tuple] = []

    if result_la_versions != []:
        la_version_selection = st.selectbox("LA_Version: ", result_la_versions)

        result_view_2 = execute_sql(f"SELECT * FROM v_leistungsuebersicht WHERE Matrikelnummer = {selected_student[Student.matrikelnummer]} AND LA_version = {la_version_selection};")
        result_view_2.insert(0, view_2_table_header)


    #write out data
    st.table(result_view_2)

#get anerkennungsübersicht
with tab3:
    result_view_3:list[tuple] = execute_sql(f"SELECT * FROM v_anerkennungsuebersicht WHERE Matrikelnummer = {selected_student[Student.matrikelnummer]}")

    if result_view_3 != []:
        result_view_3.insert(0, view_3_table_header)

    #write out data
    st.header("Anerkennungsübersicht")

    st.table(result_view_3)
