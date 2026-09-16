CREATE TABLE fakultaet (
fakultaet_id INTEGER PRIMARY KEY,
name VARCHAR(255) NOT NULL
);


CREATE TABLE institut (
institut_id INTEGER PRIMARY KEY,
fakultaet_id INTEGER NOT NULL,
name VARCHAR(255) NOT NULL,


FOREIGN KEY (fakultaet_id)
REFERENCES fakultaet(fakultaet_id)
);


CREATE TABLE studiengang (
studiengang_id INTEGER PRIMARY KEY,
institut_id INTEGER NOT NULL,
name VARCHAR(255) NOT NULL,
abschluss VARCHAR(255),


FOREIGN KEY (institut_id)
REFERENCES institut(institut_id)
);


CREATE TABLE student (
matrikelnummer INTEGER PRIMARY KEY,
studiengang_id INTEGER NOT NULL,
vorname VARCHAR(255) NOT NULL ,
nachname VARCHAR(255) NOT NULL,
email VARCHAR(255),


FOREIGN KEY (studiengang_id)
REFERENCES studiengang(studiengang_id)
);


CREATE TABLE land (
land_id INTEGER PRIMARY KEY ,
name VARCHAR(255) NOT NULL,
laendercode VARCHAR(255)
);




CREATE TABLE partneruniversitaet (
partneruniversitaet_erasmus_code VARCHAR(255) PRIMARY KEY ,
land_id INTEGER NOT NULL ,
name VARCHAR(255) NOT NULL ,
stadt VARCHAR(255),


FOREIGN KEY (land_id)
REFERENCES land(land_id)
);




CREATE TABLE koordinator (
koordinator_id INTEGER PRIMARY KEY,
institut_id INTEGER NOT NULL,
email VARCHAR(255),  
name VARCHAR(255),


FOREIGN KEY (institut_id)
REFERENCES institut(institut_id)
);


CREATE TABLE pruefungsausschuss (
pruefungsausschuss_id INTEGER PRIMARY KEY,
institut_id INTEGER NOT NULL UNIQUE,


FOREIGN KEY (institut_id)
REFERENCES institut(institut_id)
);


CREATE TABLE austauschkontingent(
austauschkontingent_id INTEGER PRIMARY KEY,
partneruniversitaet_erasmus_code VARCHAR(255) NOT NULL,
institut_id INTEGER NOT NULL,
platzanzahl INTEGER NOT NULL,
studienphase VARCHAR(255),
akademisches_jahr VARCHAR(255),


FOREIGN KEY (partneruniversitaet_erasmus_code)
REFERENCES partneruniversitaet(partneruniversitaet_erasmus_code),  


FOREIGN KEY (institut_id)
REFERENCES institut(institut_id),


UNIQUE(partneruniversitaet_erasmus_code, institut_id, studienphase, akademisches_jahr)
);


CREATE TABLE bewerbungsrunde (
bewerbungsrunde_id INTEGER PRIMARY KEY,
semester VARCHAR(255),
anfangsfrist DATE,
endfrist DATE,
status VARCHAR(255) CHECK (status IN (
    'offen',
    'geschlossen',
    'archiviert'
))
);


CREATE TABLE bewerbung (
bewerbung_id INTEGER PRIMARY KEY,
bewerbungsrunde_id INTEGER NOT NULL ,
matrikelnummer INTEGER NOT NULL ,
status VARCHAR(255) CHECK (status IN (
    'eingereicht',
    'unvollstaendig',
    'angenommen',
    'abgelehnt',
    'warteliste',
    'zurueckgezogen'
)),


FOREIGN KEY (bewerbungsrunde_id)
REFERENCES bewerbungsrunde(bewerbungsrunde_id),


FOREIGN KEY (matrikelnummer)
REFERENCES student(matrikelnummer)
);


CREATE TABLE bewerbungsdokument (
bewerbungsdokument_id INTEGER PRIMARY KEY,
bewerbung_id INTEGER NOT NULL,
dokumenttyp VARCHAR(255) NOT NULL CHECK (dokumenttyp IN (
    'leistungsspiegel',
    'lebenslauf',
    'motivationsschreiben'
)),
dateiname VARCHAR(255),
einreichungsdatum DATE,
status VARCHAR(255) CHECK (status IN (
    'fehlt',
    'eingereicht',
    'unvollstaendig',
    'geprueft',
    'abgelehnt'
)),


FOREIGN KEY (bewerbung_id)
REFERENCES bewerbung(bewerbung_id)
ON DELETE CASCADE
);


CREATE TABLE sprachnachweis (
sprachnachweis_id INTEGER PRIMARY KEY,
matrikelnummer INTEGER NOT NULL,
sprache VARCHAR(255),
niveau VARCHAR(255) CHECK (niveau IN (
    'A1',
    'A2',
    'B1',
    'B2',
    'C1',
    'C2'
)),
nachweistyp VARCHAR(255),
status VARCHAR(255) CHECK (status IN (
    'eingereicht',
    'unvollstaendig',
    'geprueft',
    'abgelehnt'
)),


FOREIGN KEY (matrikelnummer)
REFERENCES student(matrikelnummer)
ON DELETE CASCADE
);



CREATE TABLE bewerbung_sprachnachweis (
bewerbung_id INTEGER NOT NULL,
sprachnachweis_id INTEGER NOT NULL,


FOREIGN KEY (bewerbung_id)
REFERENCES bewerbung(bewerbung_id),


FOREIGN KEY (sprachnachweis_id)
REFERENCES sprachnachweis(sprachnachweis_id)
);


CREATE TABLE nominierung (
nominierung_id INTEGER PRIMARY KEY,
austauschkontingent_id INTEGER NOT NULL,
bewerbung_id INTEGER NOT NULL,
koordinator_id INTEGER NOT NULL,
status VARCHAR(255) CHECK (status IN (
    'vorbereitet',
    'nominiert',
    'storniert'
)),
nominierungsdatum DATE,


FOREIGN KEY (austauschkontingent_id)
REFERENCES austauschkontingent(austauschkontingent_id),


FOREIGN KEY (bewerbung_id)
REFERENCES bewerbung(bewerbung_id)
ON DELETE CASCADE,


FOREIGN KEY (koordinator_id )
REFERENCES koordinator(koordinator_id )
);


CREATE TABLE auswahlentscheidung (
auswahlentscheidung_id INTEGER PRIMARY KEY,
bewerbung_id INTEGER NOT NULL UNIQUE,
koordinator_id INTEGER NOT NULL,
entscheidungsdatum DATE,
status VARCHAR(255) CHECK (status IN (
    'angenommen',
    'abgelehnt',
    'warteliste'
)),
 entscheidungsgeber VARCHAR(255) ,


FOREIGN KEY (koordinator_id)
REFERENCES koordinator(koordinator_id ),


FOREIGN KEY (bewerbung_id)
REFERENCES bewerbung(bewerbung_id)
ON DELETE CASCADE
);


CREATE TABLE bewerbungspraeferenz (
bewerbungspraeferenz_id INTEGER PRIMARY KEY,
bewerbung_id INTEGER NOT NULL,
austauschkontingent_id INTEGER NOT NULL,
prioritaet INTEGER NOT NULL CHECK (prioritaet > 0),


FOREIGN KEY (bewerbung_id)
REFERENCES bewerbung(bewerbung_id)
ON DELETE CASCADE,


FOREIGN KEY (austauschkontingent_id)
REFERENCES austauschkontingent(austauschkontingent_id),


UNIQUE (bewerbung_id, prioritaet),
UNIQUE (bewerbung_id, austauschkontingent_id)
 );


CREATE TABLE auslandsaufenthalt (
auslandsaufenthalt_id INTEGER PRIMARY KEY,
nominierung_id INTEGER NOT NULL,
semester CHAR(4) NOT NULL,
status VARCHAR(255) CHECK (status IN (
    'geplant',
    'laufend',
    'abgeschlossen',
    'abgebrochen'
)),
startdatum DATE,
enddatum DATE,


FOREIGN KEY (nominierung_id) REFERENCES nominierung(nominierung_id)
ON DELETE CASCADE
);




CREATE TABLE gastkurs (
gastkurs_id INTEGER PRIMARY KEY,
partneruniversitaet_erasmus_code VARCHAR(255) NOT NULL,
name VARCHAR(255) NOT NULL,
fach VARCHAR(255) NOT NULL,
ects INTEGER CHECK (ects >= 0) ,


FOREIGN KEY (partneruniversitaet_erasmus_code) REFERENCES partneruniversitaet(partneruniversitaet_erasmus_code)
);




CREATE TABLE hu_modul (
hu_modul_id INTEGER PRIMARY KEY,
studiengang_id INTEGER NOT NULL,
name VARCHAR(255) NOT NULL,
fach VARCHAR(255) NOT NULL,
ects INTEGER CHECK (ects >= 0) ,


FOREIGN KEY (studiengang_id) REFERENCES studiengang(studiengang_id)
);


CREATE TABLE learning_agreement (
learning_agreement_id INTEGER PRIMARY KEY,
auslandsaufenthalt_id INTEGER NOT NULL,
status VARCHAR(255) CHECK (status IN (
    'entwurf',
    'eingereicht',
    'genehmigt',
    'abgelehnt',
    'ueberarbeitet'
)),
erstellungsdatum DATE,


FOREIGN KEY (auslandsaufenthalt_id) REFERENCES auslandsaufenthalt(auslandsaufenthalt_id)
ON DELETE CASCADE
);



CREATE TABLE learning_agreement_version (
learning_agreement_version_id INTEGER PRIMARY KEY,
learning_agreement_id INTEGER NOT NULL,
versionsnummer INT NOT NULL,
grund VARCHAR(1024),
status VARCHAR(255) CHECK (status IN (
    'entwurf',
    'eingereicht',
    'genehmigt',
    'abgelehnt',
    'ueberarbeitet'
)),
erstellungsdatum DATE,


FOREIGN KEY (learning_agreement_id) REFERENCES learning_agreement(learning_agreement_id)
ON DELETE CASCADE,


UNIQUE (learning_agreement_id, versionsnummer)
);


CREATE TABLE kurszuordnung (
kurszuordnung_id INTEGER PRIMARY KEY,
learning_agreement_version_id INTEGER NOT NULL,
gastkurs_id INTEGER NOT NULL,
hu_modul_id INTEGER NOT NULL,
status VARCHAR(255) CHECK (status IN (
    'geplant',
    'genehmigt',
    'abgelehnt',
    'geaendert'
)),


FOREIGN KEY (learning_agreement_version_id) REFERENCES learning_agreement_version(learning_agreement_version_id)
ON DELETE CASCADE,
FOREIGN KEY (gastkurs_id) REFERENCES gastkurs(gastkurs_id),
FOREIGN KEY (hu_modul_id) REFERENCES hu_modul(hu_modul_id)
);



CREATE TABLE genehmigung (
genehmigungs_id INTEGER PRIMARY KEY,
learning_agreement_version_id INTEGER NOT NULL,
koordinator_id INTEGER NOT NULL,
status VARCHAR(255) CHECK (status IN (
    'ausstehend',
    'genehmigt',
    'abgelehnt'
)),
genehmigungsinstanz VARCHAR(255),
genehmigungsdatum DATE,


FOREIGN KEY (learning_agreement_version_id) REFERENCES learning_agreement_version(learning_agreement_version_id)
ON DELETE CASCADE,
FOREIGN KEY (koordinator_id) REFERENCES koordinator(koordinator_id)
);



CREATE TABLE confirmation (
confirmation_id INTEGER PRIMARY KEY,
auslandsaufenthalt_id INTEGER NOT NULL,
typ VARCHAR(255),
status VARCHAR(255) CHECK (status IN (
    'angefordert',
    'eingereicht',
    'geprueft',
    'abgelehnt'
)),
ausstellungsdatum DATE,
einreichungsdatum DATE,


FOREIGN KEY (auslandsaufenthalt_id) REFERENCES auslandsaufenthalt(auslandsaufenthalt_id)
ON DELETE CASCADE
);



CREATE TABLE transcript_of_records (
transcriptofrecords_id INTEGER PRIMARY KEY,
auslandsaufenthalt_id INTEGER NOT NULL,
status VARCHAR(255) CHECK (status IN (
    'ausstehend',
    'eingereicht',
    'geprueft'
)),
ausstellungsdatum DATE,
einreichungsdatum DATE,


FOREIGN KEY (auslandsaufenthalt_id) REFERENCES auslandsaufenthalt(auslandsaufenthalt_id)
ON DELETE CASCADE
);


CREATE TABLE erbrachte_leistung (
erbrachteleistungs_id INTEGER PRIMARY KEY,
transcriptofrecords_id INTEGER NOT NULL,
gastkurs_id INTEGER NOT NULL,
kursname VARCHAR(255) NOT NULL,
ects INTEGER CHECK (ects >= 0) ,
note DECIMAL(2,1) CHECK (note >= 1.0 AND note <= 5.0),
bestanden BOOLEAN,


FOREIGN KEY (transcriptofrecords_id)  REFERENCES transcript_of_records(transcriptofrecords_id)
ON DELETE CASCADE,


FOREIGN KEY (gastkurs_id)  REFERENCES gastkurs(gastkurs_id)
);


CREATE TABLE anerkennungsantrag (
anerkennungsantrag_id INTEGER PRIMARY KEY,
auslandsaufenthalt_id INTEGER NOT NULL UNIQUE,
pruefungsausschuss_id INTEGER NOT NULL,
status VARCHAR(255) CHECK (status IN (
    'eingereicht',
    'unvollstaendig',
    'in_pruefung',
    'abgeschlossen',
    'abgelehnt'
)),
einreichungsdatum DATE,


FOREIGN KEY (auslandsaufenthalt_id) REFERENCES auslandsaufenthalt(auslandsaufenthalt_id)
ON DELETE CASCADE,
FOREIGN KEY (pruefungsausschuss_id) REFERENCES pruefungsausschuss(pruefungsausschuss_id)
);


CREATE TABLE anerkennungsentscheidung (
anerkennungsentscheidung_id INTEGER PRIMARY KEY,
anerkennungsantrag_id INTEGER NOT NULL,
erbrachteleistungs_id INTEGER NOT NULL UNIQUE,
hu_modul_id INTEGER NOT NULL,
entscheidung VARCHAR(255) CHECK (entscheidung IN (
    'anerkannt',
    'teilweise_anerkannt',
    'abgelehnt'
)),
anerkannte_ects INTEGER CHECK (anerkannte_ects >= 0),
entscheidungsdatum DATE,


FOREIGN KEY (anerkennungsantrag_id) REFERENCES anerkennungsantrag(anerkennungsantrag_id)
ON DELETE CASCADE,
FOREIGN KEY (erbrachteleistungs_id) REFERENCES erbrachte_leistung(erbrachteleistungs_id),
FOREIGN KEY (hu_modul_id) REFERENCES hu_modul(hu_modul_id)
);



CREATE VIEW v_bewerbungsuebersicht AS
SELECT
    b.bewerbung_id,
    br.semester AS bewerbungsrunde,
    s.matrikelnummer,
    s.vorname,
    s.nachname,
    sg.name AS studiengang,
    b.status AS bewerbungsstatus,
    bp.prioritaet,
    pu.name AS partneruniversitaet,
    pu.stadt,
    l.name AS land,
    ak.studienphase,
    ak.akademisches_jahr,
    ae.status AS auswahlstatus,
    n.status AS nominierungsstatus
FROM bewerbung b
JOIN student s
    ON b.matrikelnummer = s.matrikelnummer
JOIN studiengang sg
    ON s.studiengang_id = sg.studiengang_id
JOIN bewerbungsrunde br
    ON b.bewerbungsrunde_id = br.bewerbungsrunde_id
LEFT JOIN bewerbungspraeferenz bp
    ON b.bewerbung_id = bp.bewerbung_id
LEFT JOIN austauschkontingent ak
    ON bp.austauschkontingent_id = ak.austauschkontingent_id
LEFT JOIN partneruniversitaet pu
    ON ak.partneruniversitaet_erasmus_code = pu.partneruniversitaet_erasmus_code
LEFT JOIN land l
    ON pu.land_id = l.land_id
LEFT JOIN auswahlentscheidung ae
    ON b.bewerbung_id = ae.bewerbung_id
LEFT JOIN nominierung n
    ON b.bewerbung_id = n.bewerbung_id;


CREATE VIEW v_leistungsuebersicht AS
SELECT
    k.learning_agreement_version_id AS LA_version,
    g.name AS Gastkurs_name,
    g.ects AS Gastkurs_ECTS,
    h.name AS HU_Kurs,
    k.status AS Status,
    bew.matrikelnummer AS Matrikelnummer,
    el.note AS Note,
    el.bestanden AS Bestanden
FROM kurszuordnung AS k
JOIN gastkurs AS g
    ON k.gastkurs_id = g.gastkurs_id
JOIN hu_modul AS h
    ON k.hu_modul_id = h.hu_modul_id
JOIN learning_agreement_version AS lav
    ON k.learning_agreement_version_id = lav.learning_agreement_version_id
JOIN learning_agreement AS la
    ON lav.learning_agreement_id = la.learning_agreement_id
JOIN auslandsaufenthalt AS au
    ON la.auslandsaufenthalt_id = au.auslandsaufenthalt_id
JOIN nominierung AS nom
    ON au.nominierung_id = nom.nominierung_id
JOIN bewerbung AS bew
    ON nom.bewerbung_id = bew.bewerbung_id
JOIN erbrachte_leistung AS el
    ON el.gastkurs_id = g.gastkurs_id;


CREATE VIEW v_anerkennungsuebersicht AS 
select
    hm.ects AS HU_Modul_ECTS,
    hm."name",
    a.hu_modul_id,
    a.anerkannte_ects,
    a.entscheidung,
    el.gastkurs_id,
    el.ects AS Gastkurs_ECTS,
    el.note,
    el.bestanden,
    bew.matrikelnummer
from
    erbrachte_leistung as el
join anerkennungsentscheidung as a 
    on el.erbrachteleistungs_id = a.erbrachteleistungs_id
join hu_modul as hm 
    on a.hu_modul_id = hm.hu_modul_id
join transcript_of_records as tr
    on el.transcriptofrecords_id = tr.transcriptofrecords_id
join auslandsaufenthalt as aus
    on tr.auslandsaufenthalt_id = aus.auslandsaufenthalt_id
join nominierung as nom
    on aus.nominierung_id = nom.nominierung_id
join bewerbung as bew
    on nom.bewerbung_id = bew.bewerbung_id;



CREATE INDEX idx_bewerbung_matrikelnummer
ON bewerbung(matrikelnummer);


CREATE INDEX idx_auslandsaufenthalt_status
ON auslandsaufenthalt(status);
