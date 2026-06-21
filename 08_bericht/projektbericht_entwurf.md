# Projektbericht – DBS Erasmus-Projekt

## 1. Einleitung

## 2. Szenario und Zielsetzung

## 3. Quellen und fachliche Orientierung

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


## 4. Annahmen und Abgrenzungen

## 5. Anforderungsanalyse

## 6. Use Cases

## Use Case 1: Anmeldung - Bewerbung und Platzvergabe

### Ziel

Ein Student reicht eine Bewerbung für eine Erasmus-Aufenthalt ein.
Die Bewerbung wird samt Partneruni berücksichtigt und geprüft.
Bei einer erfolgreichen Auswahl wird ein Platz vergeben bzw. eine Nominierung erteilt.

### Akteure

Student, Erasmus-Koordination der Fakultät bzw. Erasmus-Koordinator des Instituts

### Vorbedingungen

Der Student ist an der HU immatrikuliert.
Eine Bewerbungsrunde ist für ein akademisches Jahr eröffnet.
Für das Institut sowie der gewünschten Studienphase bestehen passende Partnerunis bzw. Austauschplätze.

### Nachbedingungen

Bewerbung bekommt definierten Status wie z.B. angenommen, abgelehnt, Warteliste, unvollständig oder zurückgezogen.
Bei Annahme ist ein Erasmus-Platz bzw. eine Nominierung mit einer Partneruni verknüpft.

### Hauptablauf

Student nimmt an einer offenen Bewerbungsrunde teil.
System (Erasmus-Verwaltungsanwendung) zeigt verfügbare Partnerunis bezüglich Institut, Studienphase und akademisches Jahr an.
Student wählt eine oder mehrere Partnerunis als Präferenz aus.
Student lädt erforderliche Bewerbungsunterlagen hoch, wie z.B. Lebenslauf, Motivationsschreiben, Leistungsübersicht und Sprachnachweis.
Bewerbung wird eingereicht.
System speichert die Bewerbung mit einem Status, in dem Fall: eingereicht.
Erasmus-Koordination überprüft hinsichtlich Vollständigkeit & Voraussetzungen.
Erasmus-Koordination trifft Auswahlentscheidung.
Bei erfolgreicher Auswahl wird ein Austauschplatz zugeteilt und eine Nominierung für die Partneruni vorbereitet.
System updated den Status der Bewerbung.

### Alternativabläufe

### Funktionale Anforderungen

## Use Case 2: Kursplanung und Erstellung des Learning Agreements

### Ziel

Der Student plant sein Auslandsstudium, wählt Kurse an der Partneruniversität aus und erstellt ein Learning Agreement, das von den zuständigen Stellen genehmigt wird.

### Akteure

Primärer Akteur: Student

Sekundäre Akteure:
Erasmus-Koordinator
Partneruniversität

### Vorbedingungen

Student wurde für ein Erasmus-Programm zugelassen.
Partneruniversität ist im System hinterlegt.
Kursangebot der Partneruniversität ist verfügbar.
Student besitzt ein Benutzerkonto.

### Nachbedingungen

Genehmigtes Learning Agreement liegt vor.
Geplante Kurse sind den Modulen der Heimathochschule zugeordnet.
Änderungen werden versioniert gespeichert.

### Hauptablauf

1. Kursplanung

Student meldet sich im System an.
Student wählt seine Partneruniversität aus.
System zeigt verfügbare Kurse der Partneruniversität an.
Student wählt geplante Kurse aus.

2. Zuordnung der Kurse

Student ordnet die ausgewählten Kurse entsprechenden Modulen seines Studiengangs zu.
System prüft die Vollständigkeit der Angaben.
System berechnet die geplanten Leistungspunkte (ECTS).

3. Erstellung des Learning Agreements

Student erzeugt ein Learning Agreement.
System erstellt automatisch das Dokument mit allen Kurs- und Modulzuordnung.
Student reicht das Learning Agreement ein.

4. Genehmigungsprozess

Erasmus-Koordinator erhält eine Benachrichtigung.
Koordinator prüft die Planung.
Koordinator genehmigt oder lehnt das Learning Agreement ab.
Nach Genehmigung wird das Dokument an die Partneruniversität weitergeleitet.
Partneruniversität prüft die Angaben.
Partneruniversität genehmigt oder lehnt das Learning Agreement ab.

5. Abschluss

System speichert die endgültige Version.
Student erhält die Bestätigung.

### Alternativabläufe

Learning Agreement wird abgelehnt.
Koordinator oder Partneruniversität lehnen das Dokument ab.
Begründung wird hinterlegt.
Student überarbeitet die Planung.
Genehmigungsprozess startet erneut.

Änderungen während des Aufenthalts.
Student beantragt Änderungen zum Learning Agreement.
Neue Kurse werden hinzugefügt oder bestehende entfernt.
Geänderte Version wird erneut genehmigt.
Frühere Versionen bleiben archiviert.

### Funktionale Anforderungen

| Nr. | Anforderung |
|---|---|
| 1 | Verwaltung von Partneruniversitäten |
| 2 | Anzeige von Kursangeboten |
| 3 | Auswahl von Kursen durch Studenten |
| 4 | Zuordnung von Kursen zu Modulen |
| 5 | Automatische Erstellung des Learning Agreements |
| 6 | Digitale Genehmigungsworkflow des Learning Agreements über Koordinator und Partneruniversität |
| 7 | Versionierung von Änderungen |

## Use Case 3: Anerkennung von im Ausland erbrachten Studienleistungen

### Ziel

Die an der Partnerhochschule erbrachten Leistungen werden nach Rückkehr des Studenten offiziell anerkannt und im Studium verbucht.

### Akteure

Primärer Akteur: Student

Sekundäre Akteure:
Prüfungsausschuss
Büro für Internationales Studieren

### Vorbedingungen

Auslandsaufenthalt wurde abgeschlossen.
Learning Agreement liegt vor.
Transcript of Records wurde von der Partnerhochschule ausgestellt.

### Nachbedingungen

Anerkannte Leistungen sind dokumentiert.
Anerkennungsverfahren ist abgeschlossen.
Erfahrungsbericht wurde eingereicht.

### Hauptablauf

1. Erhalt der Leistungsübersicht

Student erhält das Transcript of Records von der Partnerhochschule.
Student lädt das Dokument im System hoch.

2. Antrag auf Anerkennung

Student erstellt einen Anerkennungsantrag.
Folgende Dokumente werden hochgeladen:
Learning Agreement
Transcript of Records
Student reicht den Antrag ein.

3. Prüfung durch den Prüfungsausschuss

Prüfungsausschuss erhält den Antrag.
Ausschuss prüft die erbrachten Leistungen.
Ausschuss bestätigt oder korrigiert die Anerkennung.
Antrag wird digital unterschrieben.

4. Prüfung durch das Büro für Internationales Studieren

Büro für Internationales Studieren prüft den unterschriebenen Antrag.
Vollständigkeit und Korrektheit werden kontrolliert.
Antrag wird freigegeben.

5. Abschluss

Anerkennungsverfahren wird abgeschlossen.
Status des Erasmus-Aufenthalts wird auf „abgeschlossen“ gesetzt.

### Alternativabläufe

Fehlende Dokumente.
System erkennt fehlende Unterlagen.
Antrag kann nicht eingereicht werden.
Student erhält eine Fehlermeldung.

Leistungen stimmen nicht mit Learning Agreement überein.
Prüfungsausschuss fordert Nachweise oder Erläuterungen an.
Student ergänzt Informationen.
Antrag wird erneut geprüft.

### Funktionale Anforderungen

| Nr. | Anforderung |
|---|---|
| 8 | Upload von Dokumenten |
| 9 | Verwaltung von Anerkennungsanträgen |
| 10 | Digitale Prüfung durch den Prüfungsausschuss |
| 11 | Digitale Signatur des Anerkennungsnachweises |
| 12 | Prüfung durch das Büro für Internationales Studieren |
| 13 | Upload und Archivierung von Erfahrungsberichten |
| 14 | Statusverfolgung des Anerkennungsverfahrens |
| 15 | Automatische Erinnerungen bei fehlenden Unterlagen |


## 7. Konzeptueller Entwurf

## 8. Logischer Entwurf

## 9. Datendefinition

## 10. Physischer Entwurf

## 11. Implementierung

## 12. SQL-Anfragen

## 13. Fazit
