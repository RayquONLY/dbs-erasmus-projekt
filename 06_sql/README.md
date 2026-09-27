## Implementierung

Die Datenbank wurde mit PostgreSQL aufgesetzt. Wir haben uns für PostgreSQL entschieden, da es sich gut für komplexere Systeme eignet und eine große auswahl an Features anbietet.

Für das initiale aufsetzen der Datenbank wurde ein SQL Skript verwendet, welche die grundlegenden Tabellen und Relationen anlegen. Ein weiteres SQL Skript befüllt die Tabellen mit einigen Beispieldaten. Weiterhin wurde ein Python CLI Tool entwickelt, welches das aufsetzen und zurücksetzen der Datenbank in den Initialzustand automatisiert.

Zu finden ist das CLI Tool im Projektordner unter:


`./utils/main.py`

Das CLI Tool wurde in Python entwickelt. Das Tool umfasst das Aufsetzen der Datenbank und das starten der Streamlit-Dashboard-Übersicht.

Die benötigten Packete sind in der requirements.txt festgehalten. Verwendet wurden:

- psycopg2 (zum ausführen der SQL Befehle und Skripte)
- Streamlit (für das Erstellen der Dashboard-Übersicht)
- Jupyter (Für das Ausführen der Beispiel Queries)

Das CLI benötigt eine passende .env Datei, welche die Login-Daten der genutzten Datenbank enthält. Ein Template dieser .env Datei ist im Projektordner zu finden.
