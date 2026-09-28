## Dashboard

Das Dashboard wurde mit Streamlit in Python entwickelt.

Es enthält für einen auswählbaren Studenten eine Übersicht der wichtigsten Daten des Systems. Alle Daten werden per SQL Anfrage gesammelt und mit Pyhton für das Dashboard darstellbar gemacht.

Zuerst werden die drei wichtigsten Kennwerte "Bewerbungsstatus", "Anerkannte ECTS" und "Learning-Agreement-Version" angezeigt. Die Restlichen übersichten sind in Tabs direkt unter den Kennwerten aufgeteilt.

- Bewerbung: 
Bewerbungsstatus, Priorität, Partneruniversität, ...
- Learning Agreement: Gastkurs und HU-Kurs zuordnung, Status, Note, ...
- Anerkennung: Gastkurs und HU-Kurs zuordnung, Entscheidungsstatus, ...