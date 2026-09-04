INSERT INTO fakultaet
VALUES
(0, 'Mathematisch-Naturwissenschaftliche Fakultät'),
(1, 'Philosophische Fakultät'),
(2, 'Sprach- und literaturwissenschaftliche Fakultät');




INSERT INTO institut
VALUES
(0, 0, 'Institut für Chemie'),
(1, 0, 'Institut für Informatik'),
(2, 1, 'Institut für Philosophie'),
(3, 1, 'Institut für Geschichtswissenschaften'),
(4, 2, 'Institut für deutsche Literatur'),
(5, 2, 'Institut für Romanistik');




INSERT INTO studiengang
VALUES
(0,0,'Monobachelor Chemie','Bachelor'),
(1,1,'Monomaster Informatik','Master'),
(2,2,'Monobachelor Philosophie','Bachelor'),
(3,3,'Joint M. A. European History','Master'),
(4,4,'Bachelor Deutsche Literatur','Bachelor'),
(5,5,'Bachelor Französisch','Bachelor');




INSERT INTO student
VALUES
(618492, 0, 'Marie', 'Johanna', 'marie.johanna@student.hu-berlin.de'),
(629048, 1, 'Niko',  'Thin', 'niko.thin@student.hu-berlin.de'),
(658392, 3, 'Max', 'Mustermensch', 'max.mustermensch@student.hu-berlin.de');




INSERT INTO land
VALUES
(0, 'Frankreich', 'FR'),
(1, 'Spanien', 'ES'),
(2, 'Italien', 'IT'),
(3, 'Niederlande', 'NL'),
(4, 'Schweden', 'SE');




INSERT INTO partneruniversitaet
VALUES
('F PARIS001', 0, 'Université Paris Cité', 'Paris'),
('F LYON002', 0, 'Université Jean Moulin Lyon 3', 'Lyon'),
('E MADRID01', 1, 'Universidad Complutense de Madrid', 'Madrid'),
('I ROMA001', 2, 'Sapienza Università di Roma', 'Rom'),
('NL AMSTER01', 3, 'Universiteit van Amsterdam', 'Amsterdam'),
('S STOCKHO01', 4, 'Stockholms universitet', 'Stockholm');




INSERT INTO koordinator
VALUES
(0, 0, 'koord-chemie@hu-berlin.de', 'Dr. Clara Fischer'),
(1, 1, 'koord-informatik@hu-berlin.de', 'Prof. Daniel Hoffmann'),
(2, 2, 'koord-philosophie@hu-berlin.de', 'Dr. Eva Neumann'),
(3, 3, 'koord-geschichte@hu-berlin.de', 'Prof. Felix Wagner'),
(4, 4, 'koord-literatur@hu-berlin.de', 'Dr. Greta Keller'),
(5, 5, 'koord-romanistik@hu-berlin.de', 'Prof. Henri Dubois');




INSERT INTO pruefungsausschuss
VALUES
(0, 0),
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


INSERT INTO austauschkontingent
VALUES
(0, 'F PARIS001', 0, 2, 'Bachelor', '2026/27'),
(1, 'NL AMSTER01', 1, 3, 'Master', '2026/27'),
(2, 'F PARIS001', 2, 2, 'Bachelor', '2026/27'),
(3, 'E MADRID01', 3, 2, 'Master', '2026/27'),
(4, 'I ROMA001', 4, 2, 'Bachelor', '2026/27'),
(5, 'F LYON002', 5, 2, 'Bachelor', '2026/27'),
(6, 'S STOCKHO01', 1, 2, 'Master', '2027/28');




INSERT INTO bewerbungsrunde
VALUES
(0, 'SoSe 2026', '2025-11-01', '2026-01-15', 'geschlossen'),
(1, 'WiSe 2026', '2026-04-01', '2026-06-15', 'geschlossen'),
(2, 'SoSe 2027', '2026-11-01', '2027-01-15', 'offen');






INSERT INTO bewerbung
VALUES
(0, 1, 618492, 'angenommen'),
(1, 1, 629048, 'abgelehnt'),
(2, 2, 658392, 'eingereicht');




INSERT INTO bewerbungsdokument
VALUES
(0, 0, 'leistungsspiegel',      'leistungsspiegel_marie.pdf',   '2026-05-02',   'geprueft'),
(1, 0, 'lebenslauf',            'lebenslauf_marie.pdf',         '2026-05-02',   'geprueft'),
(2, 0, 'motivationsschreiben',  'motivation_marie.pdf',         '2026-05-03',   'geprueft'),
(3, 1, 'leistungsspiegel',      'leistungsspiegel_niko.pdf',    '2026-05-10',   'eingereicht'),
(4, 1, 'lebenslauf',            'lebenslauf_niko.pdf',          '2026-05-10',   'eingereicht'),
(5, 1, 'motivationsschreiben',  'motivation_niko.pdf',          '2026-05-11',   'eingereicht'),
(6, 2, 'leistungsspiegel',      'leistungsspiegel_max.pdf',     '2026-05-08',   'geprueft'),
(7, 2, 'lebenslauf',            'lebenslauf_max.pdf',           '2026-05-08',   'geprueft'),
(8, 2, 'motivationsschreiben',  'motivation_max.pdf',           '2026-05-09',   'geprueft');




INSERT INTO sprachnachweis
VALUES
(0, 618492, 'Französisch', 'B2', 'DELF', 'geprueft'),
(1, 618492, 'Englisch', 'C1', 'Cambridge Certificate', 'geprueft'),
(2, 629048, 'Englisch', 'C1', 'TOEFL', 'geprueft'),
(3, 658392, 'Englisch', 'B2', 'IELTS', 'eingereicht');




INSERT INTO bewerbung_sprachnachweis
VALUES
(0, 0),
(0, 1),
(1, 2),
(2, 3);




INSERT INTO nominierung
VALUES
(0, 0, 0, 0, 'nominiert', '2026-06-25'),
(2, 3, 2, 3, 'vorbereitet', '2026-07-02');




INSERT INTO auswahlentscheidung
VALUES
(0, 0, 0, '2026-06-24', 'angenommen', 'Prüfungsausschuss Chemie'),
(1, 1, 1, '2026-06-30', 'abgelehnt', 'Koordination Informatik'),
(2, 2, 3, '2026-07-01', 'warteliste', 'Prüfungsausschuss Geschichte');




INSERT INTO bewerbungspraeferenz
VALUES
(0, 0, 0, 1),
(1, 0, 5, 2),
(2, 1, 1, 1),
(3, 1, 6, 2),
(4, 2, 3, 1),
(5, 2, 1, 2);












-- =========================
-- Aufenthalt und Planung
-- =========================


INSERT INTO auslandsaufenthalt
VALUES
(0, 0, 'WiSe', 'abgeschlossen', '2026-09-15', '2027-02-28');




INSERT INTO gastkurs
VALUES
(0, 'F PARIS001', 'General Chemistry', 'Chemie', 6),
(1, 'F PARIS001', 'Organic Chemistry', 'Chemie', 6),
(2, 'F PARIS001', 'French Language Course', 'Sprache', 3),
(3, 'F PARIS001', 'Laboratory Methods in Chemistry', 'Chemie', 6);




INSERT INTO hu_modul
VALUES
(0, 0, 'Allgemeine Chemie', 'Chemie', 6),
(1, 0, 'Organische Chemie', 'Chemie', 6),
(2, 0, 'Ueberfachlicher Wahlpflichtbereich', 'UeWP', 5),
(3, 0, 'Chemisches Praktikum', 'Chemie', 6);




INSERT INTO learning_agreement
VALUES
(0, 0, 'genehmigt', '2026-07-05');




INSERT INTO learning_agreement_version
VALUES
(0, 0, 1, 'Erste Kursplanung vor Beginn des Auslandsaufenthalts', 'genehmigt', '2026-07-05'),
(1, 0, 2, 'Aenderung nach Kursueberschneidung an der Partneruniversitaet', 'genehmigt', '2026-10-20');




INSERT INTO kurszuordnung
VALUES
(0, 0, 0, 0, 'genehmigt'),
(1, 0, 1, 1, 'genehmigt'),
(2, 0, 2, 2, 'genehmigt'),
(3, 1, 0, 0, 'genehmigt'),
(4, 1, 1, 1, 'genehmigt'),
(5, 1, 3, 3, 'genehmigt'),
(6, 1, 2, 2, 'geaendert');




INSERT INTO genehmigung
VALUES
(0, 0, 0, 'genehmigt', 'HU-Koordinator', '2026-07-10'),
(1, 0, 0, 'genehmigt', 'Partneruniversitaet', '2026-07-15'),
(2, 1, 0, 'genehmigt', 'HU-Koordinator', '2026-10-25');




INSERT INTO confirmation
VALUES
(0, 0, 'Confirmation of Registration', 'geprueft', '2026-09-16', '2026-09-20'),
(1, 0, 'Confirmation of Stay', 'geprueft', '2027-02-28', '2027-03-05');




-- =========================
-- Rueckkehr und Anerkennung
-- =========================


INSERT INTO transcript_of_records
VALUES
(0, 0, 'geprueft', '2027-03-20', '2027-03-25');




INSERT INTO erbrachte_leistung
VALUES
(0, 0, 0, 'General Chemistry', 6, 1.7, TRUE),
(1, 0, 1, 'Organic Chemistry', 6, 2.0, TRUE),
(2, 0, 2, 'French Language Course', 3, 1.3, TRUE),
(3, 0, 3, 'Laboratory Methods in Chemistry', 6, 2.3, TRUE);




INSERT INTO anerkennungsantrag
VALUES
(0, 0, 0, 'abgeschlossen', '2027-04-01');




INSERT INTO anerkennungsentscheidung
VALUES
(0, 0, 0, 0, 'anerkannt', 6, '2027-04-15'),
(1, 0, 1, 1, 'anerkannt', 6, '2027-04-15'),
(2, 0, 2, 2, 'teilweise_anerkannt', 3, '2027-04-15'),
(3, 0, 3, 3, 'anerkannt', 6, '2027-04-15');
