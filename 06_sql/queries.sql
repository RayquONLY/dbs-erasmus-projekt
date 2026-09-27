-- Query 1: Gesamte Bewerbungsübersicht
-- Welche Studenten haben sich in welcher Bewerbungsrunde beworben, mit welchem Status, welcher Wunschuniversität,
-- welcher Priorität, welcher Auswahlentscheidung und welchem Nominierungsstatus?
SELECT
    *
FROM
    public.v_bewerbungsuebersicht vb;




-- Query 2: Parametrisierte Query - Bewerbungen nach Status
-- Welche Bewerbungen besitzen einen ausgewählten Status?
-- Beispiel: 'angenommen'
SELECT
    vb.bewerbungsstatus,
    vb.bewerbung_id,
    vb.vorname,
    vb.nachname,
    vb.bewerbungsrunde,
    vb.partneruniversitaet,
    vb.nominierungsstatus,
    vb.auswahlstatus,
    vb.prioritaet
FROM
    public.v_bewerbungsuebersicht vb
WHERE
    vb.bewerbungsstatus = :bewerbungsstatus;




-- Query 3: Bewerbungen nach Status zählen
-- Wie viele Bewerbungen gibt es pro Status?
SELECT
    b.status,
    COUNT(b.bewerbung_id)
FROM
    public.bewerbung b
GROUP BY
    b.status;




-- Query 4: Nachfrage pro Partneruniversität
-- Wie viele Bewerbungspräferenzen gibt es pro Partneruniversität?
SELECT
    COUNT(*) AS nachfrage,
    vb.partneruniversitaet
FROM
    public.v_bewerbungsuebersicht vb
GROUP BY
    vb.partneruniversitaet;




-- Query 5: Sprachnachweise pro Bewerbung
-- Welche Bewerbung verwendet welche Sprachnachweise?
SELECT
    b.bewerbung_id,
    b.matrikelnummer,
    s.vorname,
    s.nachname,
    s2.sprachnachweis_id,
    s2.sprache,
    s2.niveau,
    s2.nachweistyp
FROM
    public.bewerbung b
INNER JOIN public.student s on
    b.matrikelnummer = s.matrikelnummer
INNER JOIN public.bewerbung_sprachnachweis bs on
    b.bewerbung_id = bs.bewerbung_id
INNER JOIN public.sprachnachweis s2 on
    s.matrikelnummer = s2.matrikelnummer
WHERE
    bs.sprachnachweis_id = s2.sprachnachweis_id;




-- Query 6: Auslandsaufenthalt mit Nominierung und Partneruniversität
-- Welcher nominierte Student hat welchen Auslandsaufenthalt an welcher Partneruniversität?
SELECT
    p.name AS partneruniversitaet,
    p.partneruniversitaet_erasmus_code,
    p.stadt,
    a.semester,
    a.status AS aufenthalt_status,
    a.startdatum,
    a.enddatum,
    n.status AS nominierung_status,
    ak.studienphase,
    s.vorname,
    s.nachname
FROM public.auslandsaufenthalt a
INNER JOIN public.nominierung n
    ON a.nominierung_id = n.nominierung_id
INNER JOIN public.bewerbung b
    ON n.bewerbung_id = b.bewerbung_id
INNER JOIN public.student s
    ON b.matrikelnummer = s.matrikelnummer
INNER JOIN public.austauschkontingent ak
    ON n.austauschkontingent_id = ak.austauschkontingent_id
INNER JOIN public.partneruniversitaet p
    ON ak.partneruniversitaet_erasmus_code = p.partneruniversitaet_erasmus_code
WHERE n.status = 'nominiert';




-- Query 7: Learning Agreement mit Versionen
-- Welche Versionen gibt es zu einem Learning Agreement und warum wurden sie erstellt?
SELECT
    lav.versionsnummer,
    la.learning_agreement_id,
    lav.grund,
    la.erstellungsdatum AS la_erstellungsdatum,
    lav.status AS versionsstatus,
    lav.erstellungsdatum AS versions_erstellungsdatum,
    a.auslandsaufenthalt_id,
    a.semester,
    a.status AS aufenthalt_status
FROM
    public.learning_agreement la
INNER JOIN public.learning_agreement_version lav on
    la.learning_agreement_id = lav.learning_agreement_id
INNER JOIN public.auslandsaufenthalt a on
    la.auslandsaufenthalt_id = a.auslandsaufenthalt_id;




-- Query 8:  Kurszuordnungen der neuesten Learning-Agreement-Version
-- Welche Gastkurse wurden welchen HU-Modulen zugeordnet und welchen Status haben diese Zuordnungen in der neusten Version?
SELECT
    g.name AS gastkurs,
    hm.name AS hu_modul,
    hm.fach AS hu_modul_fach,
    hm.ects AS hu_modul_ects,
    g.fach AS gastkurs_fach,
    g.ects AS gastkurs_ects,
    g.partneruniversitaet_erasmus_code,
    lav.learning_agreement_id,
    lav.versionsnummer,
    k.status AS zuordnungsstatus
FROM
    public.kurszuordnung k
INNER JOIN public.learning_agreement_version lav on
    k.learning_agreement_version_id = lav.learning_agreement_version_id
INNER JOIN public.gastkurs g on
    k.gastkurs_id = g.gastkurs_id
INNER JOIN public.hu_modul hm on
    k.hu_modul_id = hm.hu_modul_id
WHERE lav.versionsnummer = (
    SELECT MAX(lav2.versionsnummer)
    FROM public.learning_agreement_version lav2
    WHERE lav2.learning_agreement_id = lav.learning_agreement_id
);




-- Query 9: Summe anerkannter ECTS pro Aufenthalt
-- Wie viele ECTS wurden für einen Auslandsaufenthalt insgesamt anerkannt?
SELECT
    a.auslandsaufenthalt_id,
    SUM(a2.anerkannte_ects) AS anerkannte_ects
FROM
    public.anerkennungsantrag a
INNER JOIN public.anerkennungsentscheidung a2 on
    a.anerkennungsantrag_id = a2.anerkennungsantrag_id
INNER JOIN public.auslandsaufenthalt a3 on
    a.auslandsaufenthalt_id = a3.auslandsaufenthalt_id
GROUP BY
    a.auslandsaufenthalt_id;




-- Query 10: Teilweise oder nicht anerkannte Leistungen
-- Welche erbrachten Leistungen wurden nur teilweise anerkannt oder abgelehnt?
SELECT
    hm.ects,
    hm."name",
    a.hu_modul_id,
    a.anerkannte_ects,
    a.entscheidung,
    el.gastkurs_id,
    el.ects,
    el.note,
    el.bestanden
FROM
    public.erbrachte_leistung el
INNER JOIN public.anerkennungsentscheidung a on
    el.erbrachteleistungs_id = a.erbrachteleistungs_id
INNER JOIN public.hu_modul hm on
    a.hu_modul_id = hm.hu_modul_id
WHERE a.entscheidung IN ('teilweise_anerkannt', 'abgelehnt');
