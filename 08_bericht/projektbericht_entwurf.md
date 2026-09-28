# Projektbericht – DBS Erasmus-Projekt

## 1. Einleitung und Zielsetzung

Ziel unseres DBS-Projektes ist die Konzeption und Entwicklung eines Datenbank-Tools und -Modells zur Verwaltung und Darstellung der Erasmus-Outgoing-Prozesse an der Mathematisch-Naturwissenschaftlichen Fakultät der HU.
Dabei liegt unser Fokus vor allem auf der Bewerbung, der Kursplanung über das Learning-Agreement sowie der Anerkennung erbrachter Studienleistungen.


## 2. Quellen und fachliche Orientierung

## Quelle: MNF Erasmus-Seite
**Link:** 
https://fakultaeten.hu-berlin.de/de/mnf/lehre_studium/internationales/erasmus/erasmus

**Relevanz für Projekt:** 
Kernprozess (Bewerbung, Nominierung, Learning, Agreement, Auslandsaufenthalt Transcript of Records, Anerkennung) 

**Mögliche Entitäten:** 
- Student
- Bewerbung
- Partneruniversität
- Nominierung
- GrantAgreement
- Sprachtest
- LearningAgreement
- Auslandsaufenthalt
- ConfirmationOfRegistration
- ConfirmationOfStay
- TranscriptOfRecords
- Anerkennungsantrag
- Anerkennungsentscheidung 

## Quelle: Erasmus FAQ
**Link:**
https://fakultaeten.hu-berlin.de/de/mnf/lehre_studium/internationales/ins-ausland/faq

**Relevanz für Projekt:** 
Regeln, Bedingungen und Sonderfälle (vollständige Bewerbungsunterlagen, B2-Sprachniveau, 30 ECTS pro Semester, Sprachnachweise, Kursanrechnung, Partnerverträge, Restplätze, Verlängerung) 

**Mögliche Entitäten:** 
- Bewerbungsdokument
- Sprachnachweis
- Sprache
- Studienleistung
- LearningAgreement
- Gastkurs
- HU-Modul
- Kurszuordnung
- Prüfungsausschuss
- Partnervertrag
- Austauschplatz

## Quelle: Partneruniversitäten-PDF 2026/27 

**Link:** 
https://fakultaeten.hu-berlin.de/de/mnf/lehre_studium/internationales/erasmus/gesamtliste-mnf-erasmus-partneruniversitaeten_2026-27.pdf

**Relevanz für Projekt:** 
Stammdaten und Platzvergabe (Land, Stadt, Universität, Erasmus-Code, Studienphase, Plätze pro Institut: Chemie, Geo, Informatik, Mathe, Physik) 

**Mögliche Entitäten:** 
- Land
- PartnerUniversitaet
- Institut
- Studienphase
- ErasmusAbkommen
- Austauschplatz
- AkademischesJahr
- Platzkontingent  

## Quelle: Info-Präsentation Erasmus+ 

**Link:** 
https://fakultaeten.hu-berlin.de/de/mnf/lehre_studium/internationales/erasmus/prasentation_erasmus-2025.pdf

**Relevanz für Projekt:** 
Ablauf anschaulich und zeitlich strukturiert (Möglichkeiten, Motivation, Partneruniversitäten, Bewerbung, Unterlagen, Erasmusjahr, Zeitschiene, Learning Agreement, Finanzierung, Dokumente und Fristen) 

**Mögliche Entitäten:**  
- Bewerbung
- Bewerbungsdokument
- Dokumenttyp
- Nominierung
- Partneruniversität
- GrantAgreement
- LearningAgreement
- LearningAgreementVersion
- Genehmigung
- Gastkurs
- HU-Modul
- Kurszuordnung
- Anerkennungsantrag
- Dokumentfrist


## 3. Annahmen und Abgrenzungen

Finanzierung, Wohnung, Versicherung und ähnliche Themen existieren im realen Erasmus-Prozess, gehören aber nicht zu unserem Kern: Bewerbung, Kursplanung und Anerkennung.

## 4. Anforderungsanalyse

Für die Anforderungsanalyse wurden drei für das Thema relevante Use-Cases definiert.

1. Anmeldung - Bewerbung und Platzvergabe
2. Planung - Learning Agreement erstellen und Kurszuordnung planen
3. Kursanrechnung - Im Ausland erbrachte Leistungen anerkennen

## 5. Use Cases

### Use Case 1: Anmeldung - Bewerbung und Platzvergabe

**Ziel:**  
Ein Student reicht eine Bewerbung für einen Erasmus-Aufenthalt ein. Die Bewerbung wird geprüft. Bei erfolgreicher Auswahl wird ein Austauschplatz vergeben und eine Nominierung vorbereitet.

**Akteure:**  
- Student
- Erasmus-Koordination der Fakultät
- Erasmus-Koordinator des Instituts

**Vorbedingungen:**  
- Der Student ist an der HU immatrikuliert.
- Eine Bewerbungsrunde für ein akademisches Jahr ist geöffnet.
- Für das Institut und die gewünschte Studienphase gibt es passende Partneruniversitäten beziehungsweise Austauschplätze.

**Nachbedingungen:**  
- Die Bewerbung hat einen definierten Status.
- Mögliche Statuswerte sind angenommen, abgelehnt, Warteliste, unvollständig oder zurückgezogen.
- Bei Annahme ist die Bewerbung mit einem Austauschplatz und einer Nominierung verbunden.

**Hauptablauf:**  
1. Der Student nimmt an einer offenen Bewerbungsrunde teil.
2. Das System zeigt verfügbare Partneruniversitäten nach Institut, Studienphase und akademischem Jahr an.
3. Der Student wählt eine oder mehrere Partneruniversitäten als Präferenz aus.
4. Der Student lädt Bewerbungsunterlagen hoch, zum Beispiel Lebenslauf, Motivationsschreiben, Leistungsübersicht und Sprachnachweis.
5. Die Bewerbung wird eingereicht.
6. Das System speichert die Bewerbung mit dem Status „eingereicht“.
7. Die Erasmus-Koordination prüft die Bewerbung auf Vollständigkeit und Voraussetzungen.
8. Die Erasmus-Koordination trifft eine Auswahlentscheidung.
9. Bei erfolgreicher Auswahl wird ein Austauschplatz zugeordnet.
10. Eine Nominierung für die Partneruniversität wird vorbereitet.
11. Das System aktualisiert den Status der Bewerbung.

**Alternativabläufe:**  
- Die Bewerbung ist unvollständig. Das System markiert die Bewerbung als unvollständig.
- Der Student erfüllt formale Voraussetzungen nicht. Die Bewerbung wird abgelehnt.
- Es gibt mehr geeignete Bewerbungen als verfügbare Plätze. Die Bewerbung kann auf eine Warteliste gesetzt werden.
- Der Student zieht die Bewerbung zurück. Das System setzt den Status auf „zurückgezogen“.

**Funktionale Anforderungen:**  

| Nr. | Anforderung |
|---|---|
| 1 | Verwaltung von Bewerbungsrunden |
| 2 | Anzeige verfügbarer Partneruniversitäten beziehungsweise Austauschplätze |
| 3 | Auswahl von Partneruniversitäten als Bewerbungspräferenzen |
| 4 | Upload von Bewerbungsunterlagen |
| 5 | Speicherung von Bewerbungen mit Status |
| 6 | Prüfung der Bewerbung durch die Erasmus-Koordination |
| 7 | Speicherung von Auswahlentscheidungen |
| 8 | Zuordnung eines Austauschplatzes bei erfolgreicher Auswahl |
| 9 | Erstellung beziehungsweise Speicherung einer Nominierung |
| 10 | Statusverfolgung der Bewerbung |

---

### Use Case 2: Planung - Learning Agreement erstellen und Kurszuordnung planen

**Ziel:**  
Der Student plant sein Auslandsstudium, wählt Kurse an der Partneruniversität aus und erstellt ein Learning Agreement. Die geplanten Kurse werden HU-Modulen zugeordnet und anschließend genehmigt.

**Akteure:**  
- Student
- Erasmus-Koordinator
- Partneruniversität

**Vorbedingungen:**  
- Der Student wurde für einen Erasmus-Aufenthalt zugelassen beziehungsweise nominiert.
- Die Partneruniversität ist im System hinterlegt.
- Das Kursangebot der Partneruniversität ist verfügbar.
- Der Student besitzt ein Benutzerkonto.

**Nachbedingungen:**  
- Ein Learning Agreement liegt vor.
- Geplante Gastkurse sind HU-Modulen oder Anerkennungsbereichen zugeordnet.
- Genehmigungen sind gespeichert.
- Änderungen werden als neue Version gespeichert.

**Hauptablauf:**  
1. Der Student meldet sich im System an.
2. Der Student wählt seine Partneruniversität aus.
3. Das System zeigt verfügbare Kurse der Partneruniversität an.
4. Der Student wählt geplante Gastkurse aus.
5. Der Student ordnet die Gastkurse passenden HU-Modulen oder Anerkennungsbereichen zu.
6. Das System prüft die Vollständigkeit der Angaben.
7. Das System berechnet die geplanten Leistungspunkte.
8. Der Student erstellt ein Learning Agreement.
9. Das System speichert eine Version des Learning Agreements.
10. Der Student reicht das Learning Agreement ein.
11. Der Erasmus-Koordinator prüft die Planung.
12. Der Erasmus-Koordinator genehmigt oder lehnt das Learning Agreement ab.
13. Nach Genehmigung wird das Learning Agreement an die Partneruniversität weitergeleitet.
14. Die Partneruniversität genehmigt oder lehnt das Learning Agreement ab.
15. Das System speichert den endgültigen Status.

**Alternativabläufe:**  
- Das Learning Agreement wird abgelehnt. Eine Begründung wird gespeichert und der Student überarbeitet die Planung.
- Während des Aufenthalts ändern sich Kurse. Das System erstellt eine neue Version des Learning Agreements.
- Frühere Versionen bleiben archiviert.
- Angaben zu Kursen oder Modulen sind unvollständig. Das System verhindert die Einreichung, bis die Angaben ergänzt wurden.

**Funktionale Anforderungen:**  

| Nr. | Anforderung |
|---|---|
| 1 | Verwaltung von Partneruniversitäten |
| 2 | Anzeige von Kursangeboten |
| 3 | Auswahl von Kursen durch Studenten |
| 4 | Zuordnung von Kursen zu Modulen |
| 5 | Digitaler Genehmigungsworkflow des Learning Agreements über Koordinator und Partneruniversität |
| 6 | Versionierung von Änderungen im Learning Agreement |

---

### Use Case 3: Kursanrechnung - Im Ausland erbrachte Leistungen anerkennen

**Ziel:**  
Die an der Partneruniversität erbrachten Leistungen werden nach Rückkehr des Studenten geprüft, anerkannt und dokumentiert.

**Akteure:**  
- Student
- Prüfungsausschuss
- Büro für Internationales Studieren

**Vorbedingungen:**  
- Der Auslandsaufenthalt wurde abgeschlossen.
- Ein Learning Agreement liegt vor.
- Das Transcript of Records wurde von der Partneruniversität ausgestellt.

**Nachbedingungen:**  
- Anerkannte Leistungen sind dokumentiert.
- Anerkennungsentscheidungen wurden gespeichert.
- Das Anerkennungsverfahren ist abgeschlossen.
- Der Status des Auslandsaufenthalts kann auf „abgeschlossen“ gesetzt werden.

**Hauptablauf:**  
1. Der Student erhält das Transcript of Records von der Partneruniversität.
2. Der Student lädt das Transcript of Records im System hoch.
3. Der Student erstellt einen Anerkennungsantrag.
4. Der Student fügt notwendige Dokumente hinzu, insbesondere Learning Agreement und Transcript of Records.
5. Der Student reicht den Anerkennungsantrag ein.
6. Der Prüfungsausschuss erhält den Antrag.
7. Der Prüfungsausschuss prüft die erbrachten Leistungen.
8. Der Prüfungsausschuss entscheidet für jede Leistung, ob sie anerkannt, teilweise anerkannt oder abgelehnt wird.
9. Die Anerkennungsentscheidungen werden im System gespeichert.
10. Das Büro für Internationales Studieren prüft die Vollständigkeit der Unterlagen.
11. Das Anerkennungsverfahren wird abgeschlossen.
12. Das System aktualisiert den Status des Auslandsaufenthalts.

**Alternativabläufe:**  
- Unterlagen fehlen. Das System markiert den Antrag als unvollständig.
- Eine Leistung stimmt nicht mit dem Learning Agreement überein. Der Prüfungsausschuss fordert zusätzliche Informationen an.
- Eine Leistung wird nicht anerkannt. Die Ablehnung wird mit Begründung gespeichert.
- Der Student ergänzt fehlende Informationen. Der Antrag wird anschließend erneut geprüft.

**Funktionale Anforderungen:**  

| Nr. | Anforderung |
|---|---|
| 1 | Upload von Dokumenten |
| 2 | Verwaltung von Anerkennungsanträgen |
| 3 | Speicherung des Transcript of Records |
| 4 | Speicherung erbrachter Leistungen |
| 5 | Digitale Prüfung durch den Prüfungsausschuss |
| 6 | Speicherung von Anerkennungsentscheidungen pro Leistung |
| 7 | Statusverfolgung des Anerkennungsverfahrens |

## 6. Konzeptueller Entwurf

Für den Konzeptionellen Entwurf wurde ein ER-Diagram in Chen notation erstellt. 

Siehe Bild "ER-dia-Erasmus.drawio.png"

### Relationen

Fakultät 1:n Institut  
Institut 1:n Studiengang  
Studiengang 1:n Student  
Land 1:n Partneruniversität  
Partneruniversität 1:n Austauschkontingent  
Institut 1:n Austauschkontingent  

Student 1:n Bewerbung  
Bewerbungsrunde 1:n Bewerbung  
Bewerbung 1:n Bewerbungspräferenz  
Austauschkontingent 1:n Bewerbungspräferenz  
Bewerbung 1:n Bewerbungsdokument  
Bewerbung n:m Sprachnachweis  
Bewerbung 1:0..1 Auswahlentscheidung  
Bewerbung 1:0..1 Nominierung  
Austauschkontingent 1:n Nominierung  
Koordinator 1:n Auswahlentscheidung  
Koordinator 1:n Nominierung  

Nominierung 1:0..1 Auslandsaufenthalt  
Auslandsaufenthalt 1:0..1 LearningAgreement  
LearningAgreement 1:n LearningAgreementVersion  
LearningAgreementVersion 1:n Kurszuordnung  
Gastkurs 1:n Kurszuordnung  
HU-Modul 1:n Kurszuordnung  
Partneruniversität 1:n Gastkurs  
Studiengang 1:n HU-Modul  
LearningAgreementVersion 1:n Genehmigung  
Koordinator 1:n Genehmigung  
Auslandsaufenthalt 1:n Confirmation  

Auslandsaufenthalt 1:0..1 TranscriptOfRecords  
TranscriptOfRecords 1:n ErbrachteLeistung  
Gastkurs 1:n ErbrachteLeistung  
Auslandsaufenthalt 1:0..1 Anerkennungsantrag  
Prüfungsausschuss 1:n Anerkennungsantrag  
Anerkennungsantrag 1:n Anerkennungsentscheidung  
ErbrachteLeistung 1:0..1 Anerkennungsentscheidung  
HU-Modul 1:n Anerkennungsentscheidung  
Institut 1:n Koordinator  
Institut 1:1 Prüfungsausschuss


## 7. Logischer Entwurf

Für den logischen Entwurf des Datenbankmodells wurde das ER-Diagramm in ein Relationenmodell überführt.


### Grund-Entitäten

Student (<ins>matrikelnummer</ins>, *studiengang_id*, vorname, nachname, email)

Studiengang (<ins>studiengang_id</ins>, *institut_id*, name, abschluss)

Institut (<ins>institut_id</ins>, *fakultät_id*, name)

Fakultät (<ins>fakultät_id</ins>, name)

Partneruniversität (<ins>partneruniversität_erasmus_code</ins>, *land_id*, name, stadt)

Land (<ins>land_id</ins>, name, ländercode)

Koordinator (<ins>koordinator_id</ins>, *institut_id*, email, name)

Prüfungsausschuss (<ins>prüfungsausschuss_id</ins>, *institut_id*)


### Bewerbung und Platzvergabe

Austauschkontingent (<ins>austauschkontingent_id</ins>, *partneruniversität_erasmus_code*, *institut_id*, platzanzahl, studienphase, akademisches_jahr)

Bewerbungsrunde (<ins>bewerbungsrunde_id</ins>, semester, anfangsfrist, endfrist, status)

Bewerbung (<ins>bewerbung_id</ins>, *bewerbungsrunde_id*, *matrikelnummer*, status)

Bewerbungsdokument (<ins>bewerbungsdokument_id</ins>, *bewerbung_id*, dokumenttyp =[leistungsspiegel, lebenslauf, motivationsschreiben], dateiname, einreichungsdatum, status)

Sprachnachweis (<ins>sprachnachweis_id</ins>, *matrikelnummer*, sprache, niveau, nachweistyp, status)

Bewerbung_Sprachnachweis (*bewerbung_id*, *sprachnachweis_id*)

Nominierung (<ins>nominierung_id</ins>, *austauschkontingent_id*, *bewerbung_id*, *koordinator_id*, status, nominierungsdatum)

Auswahlentscheidung (<ins>auswahlentscheidung_id</ins>, *bewerbung_id*, *koordinator_id*, entscheidungsdatum, status, entscheidungsgeber)

Bewerbungspräferenz (<ins>bewerbungspräferenz_id</ins>, *bewerbung_id*, *austauschkontingent_id*, priorität)


### Aufenthalt und Planung

Auslandsaufenthalt (<ins>auslandsaufenthalt_id</ins>, *nominierung_id*, semester, status, startdatum, enddatum)

Gastkurs (<ins>gastkurs_id</ins>, *partneruniversität_erasmus_code*, name, fach, ects)

HU-Modul (<ins>hu_modul_id</ins>, *studiengang_id*, name, fach, ects)

Kurszuordnung (<ins>kurszuordnung_id</ins>, *learning_agreement_version_id*, *gastkurs_id*, *hu_modul_id*, status)

LearningAgreement (<ins>learning_agreement_id</ins>, *auslandsaufenthalt_id*, status, erstellungsdatum)

LearningAgreementVersion (<ins>learning_agreement_version_id</ins>, *learning_agreement_id*, versionsnummer, grund, status, erstellungsdatum)

Genehmigung (<ins>genehmigungs_id</ins>, *learning_agreement_version_id*, *koordinator_id*, status, genehmigungsinstanz, genehmigungsdatum)

Confirmation (<ins>confirmation_id</ins>, *auslandsaufenthalt_id*, typ, status, ausstellungsdatum, einreichungsdatum)


### Rückkehr und Anerkennung

TranscriptOfRecords (<ins>transcriptofrecords_id</ins>, *auslandsaufenthalt_id*, status, ausstellungsdatum, einreichungsdatum)

ErbrachteLeistung (<ins>erbrachteleistungs_id</ins>, *transcriptofrecords_id*, *gastkurs_id*, kursname, ects, note, bestanden)

Anerkennungsantrag (<ins>anerkennungsantrag_id</ins>, *auslandsaufenthalt_id*, *prüfungsausschuss_id*, status, einreichungsdatum)

Anerkennungsentscheidung (<ins>anerkennungsentscheidung_id</ins>, *anerkennungsantrag_id*, *erbrachteleistungs_id*, *hu_modul_id*, entscheidung, anerkannte_ects, entscheidungsdatum)


### Normalform:

Das Modell befindet sich in der 3. Normalform.
1. Normalform ist gegeben, da alle Attribute atomar sind.
2. Normalform ist gegeben, da die 1. Normalform gilt und jedes Nichtschlüsselattribut von jedem Schlüsselkandidaten voll funktional abhängig ist.
3. Normalform ist gegeben, da die 2. Normalform gilt und kein Nichtschlüsselattribut transitiv von einem Schlüsselkandidaten abhängig ist.

## 8. Datendefinition

Für die Datendefinition wurde der Logische Entwurf in eine .sql Skript-Datei überführt, welche alle erforderlichen Tabellen mit SQL Befehlen erstellt. Diese ist zu finden unter `./utils/create_db.sql`

Dabei wurden für die Tabelleneinträge passende Datentypen gewählt und die Primär und Fremdschlüssel angegeben.

## 9. Physischer Entwurf

Für häufig verwendete Suchanfragen wurden zusätzlich eigene Indizes angelegt.

Darunter wurde ein Index für die Matrikelnummer hinsichtlich der Bewerbungen und ein weiterer Index für den Status eines Auslandsaufenthalts erstellt, die wie folgt aussehen:

`CREATE INDEX idx_bewerbung_matrikelnummer
ON bewerbung(matrikelnummer);`

`CREATE INDEX idx_auslandsaufenthalt_status
ON auslandsaufenthalt(status);`

Der Index idx_bewerbung_matrikelnummer unterstützt Abfragen, bei denen die Bewerbungen eines Studenten gesucht, und idx_auslandsaufenthalt_status, bei denen Auslandsaufenthalte nach ihrem Status gefiltert werden.

## 10. Implementierung

### Datenbank
Die Datenbank wurde mit PostgreSQL aufgesetzt. Wir haben uns für PostgreSQL entschieden, da es sich gut für komplexere Systeme eignet und eine große Auswahl an Features anbietet.

Für das initiale Aufsetzen der Datenbank wurde ein SQL Skript verwendet, welche die grundlegenden Tabellen und Relationen anlegen. Ein weiteres SQL Skript befüllt die Tabellen mit einigen Beispieldaten. Weiterhin wurde ein Python CLI Tool entwickelt, welches das aufsetzen und zurücksetzen der Datenbank in den Initialzustand automatisiert.

Zu finden ist das CLI Tool im Projektordner unter:


`./utils/main.py`

### CLI-Tool

Das CLI Tool wurde in Python entwickelt. Das Tool umfasst das Aufsetzen der Datenbank und das Starten der Streamlit-Dashboard-Übersicht.

Die benötigten Pakete sind in der requirements.txt festgehalten. Verwendet wurden:

- psycopg2 (zum ausführen der SQL Befehle und Skripte)
- Streamlit (für das Erstellen der Dashboard-Übersicht)
- Jupyter (Für das Ausführen der Beispiel Queries)

Das CLI benötigt eine passende .env Datei, welche die Login-Daten der genutzten Datenbank enthält. Ein Template dieser .env Datei ist im Projektordner zu finden.

### Dashboard

Das Dashboard wurde mit Streamlit in Python entwickelt.

Es enthält für einen auswählbaren Studenten eine Übersicht der wichtigsten Daten des Systems. Alle Daten werden per SQL Anfrage gesammelt und mit Pyhton für das Dashboard darstellbar gemacht.

Zuerst werden die drei wichtigsten Kennwerte "Bewerbungsstatus", "Anerkannte ECTS" und "Learning-Agreement-Version" angezeigt. Die restlichen Übersichten sind in Tabs direkt unter den Kennwerten aufgeteilt.

- Bewerbung: 
Bewerbungsstatus, Priorität, Partneruniversität, ...
- Learning Agreement: Gastkurs und HU-Kurs Zuordnung, Status, Note, ...
- Anerkennung: Gastkurs und HU-Kurs Zuordnung, Entscheidungsstatus, ...

## 11. SQL-Anfragen

In `06_sql/queries.sql` werden die zehn SQL-Anfragen der Aufgabenstellung umgesetzt. Sie orientieren sich an den drei modellierten Use-Cases: Bewerbung und Platzvergabe, Aufenthalt und Planung sowie Rückkehr und Anerkennung.

Die Anfragen umfassen unter anderem die gesamte Bewerbungsübersicht, Bewerbungen nach einem ausgewählten Status, das Zählen von Bewerbungen nach Status, die Nachfrage pro Partneruniversität, Sprachnachweise pro Bewerbung, den Auslandsaufenthalt mit Nominierung und Partneruniversität, das Learning Agreement mit Versionen, Kurszuordnungen der neuesten Learning-Agreement-Version, die Summe anerkannter ECTS pro Aufenthalt und teilweise oder nicht anerkannte Leistungen.

Dabei werden verschiedene SQL-Konzepte umgesetzt, die sich an der Anforderungsanalyse orientieren, insbesondere Joins über mehrere Tabellen, Aggregationen wie COUNT und SUM, Views, eine Sub-Anfrage sowie eine parametrisierte Query.


## 12. Fazit
