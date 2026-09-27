# dbs-erasmus-projekt
DBS-Projekt zur Verwaltung von Erasmus-Outgoing-Prozessen an der HU/MNF

## Vorraussetzungen:

- Python 3
- PostgreSQL

## Verwendung

1. (optional aber empfohlen) Erstelle ein venv für das Projekt mit: `python -m venv dbs_erasmus_projekt_venv`
und aktiviere dieses.
2. Installiere die erforderlichen Packete mit: `pip install -r ./requirements.txt`
3. Kopiere "./.env.template" zu "./.env" und trage deine Daten ein.
3. Führe das CLI Tool aus mit: `python3 ./utils/main.py`