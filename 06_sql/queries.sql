-- Query 1: Gesamte Bewerbungsübersicht
-- Welche Studenten haben sich in welcher Bewerbungsrunde beworben, mit welchem Status, welcher Wunschuniversität,
-- welcher Priorität, welcher Auswahlentscheidung und welchem Nominierungsstatus?
create view query_1 as
select
    *
from
    public.v_bewerbungsuebersicht vb;




-- Query 2: Angenommene Bewerbungen
-- Welche Bewerbungen wurden angenommen und für welche Partneruniversitäten waren sie vorgesehen?
create view query_2 as
select
    vb.bewerbungsstatus,
    vb.bewerbung_id,
    vb.vorname,
    vb.nachname,
    vb.bewerbungsrunde,
    vb.partneruniversitaet,
    vb.nominierungsstatus,
    vb.auswahlstatus,
    vb.prioritaet
from
    public.v_bewerbungsuebersicht vb
where
    vb.bewerbungsstatus = 'angenommen';




-- Query 3: Bewerbungen nach Status zählen
-- Wie viele Bewerbungen gibt es pro Status?
create view query_3 as
select
    b.status,
    COUNT(b.bewerbung_id)
from
    public.bewerbung b
group by
    b.status;




-- Query 4: Nachfrage pro Partneruniversität
-- Wie viele Bewerbungspräferenzen gibt es pro Partneruniversität?
create view query_4 as
select
    COUNT(*) AS nachfrage,
    vb.partneruniversitaet
from
    public.v_bewerbungsuebersicht vb
group by
    vb.partneruniversitaet;




-- Query 5: Sprachnachweise pro Bewerbung
-- Welche Bewerbung verwendet welche Sprachnachweise?
create view query_5 as
select
    b.bewerbung_id,
    b.matrikelnummer,
    s.vorname,
    s.nachname,
    s2.sprachnachweis_id,
    s2.sprache,
    s2.niveau,
    s2.nachweistyp
from
    public.bewerbung b
inner join public.student s on
    b.matrikelnummer = s.matrikelnummer
inner join public.bewerbung_sprachnachweis bs on
    b.bewerbung_id = bs.bewerbung_id
inner join public.sprachnachweis s2 on
    s.matrikelnummer = s2.matrikelnummer
where
    bs.sprachnachweis_id = s2.sprachnachweis_id;




-- Query 6: Auslandsaufenthalt mit Nominierung und Partneruniversität
-- Welcher nominierte Student hat welchen Auslandsaufenthalt an welcher Partneruniversität?
create view query_6 as
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
create view query_7 as
select
    lav.versionsnummer,
    la.learning_agreement_id,
    lav.grund,
    la.erstellungsdatum AS la_erstellungsdatum,
    lav.status AS versionsstatus,
    lav.erstellungsdatum AS versions_erstellungsdatum,
    a.auslandsaufenthalt_id,
    a.semester,
    a.status AS aufenthalt_status
from
    public.learning_agreement la
inner join public.learning_agreement_version lav on
    la.learning_agreement_id = lav.learning_agreement_id
inner join public.auslandsaufenthalt a on
    la.auslandsaufenthalt_id = a.auslandsaufenthalt_id;




-- Query 8: Kurszuordnungen im Learning Agreement
-- Welche Gastkurse wurden welchen HU-Modulen zugeordnet und welchen Status haben diese Zuordnungen?
create view query_8 as
select
    g."name" AS gastkurs,
    hm."name" AS hu_modul,
    hm.fach,
    hm.ects,
    g.fach,
    g.ects,
    g.partneruniversitaet_erasmus_code,
    lav.learning_agreement_id,
    k.learning_agreement_version_id,
    k.status AS zuordnungsstatus
from
    public.kurszuordnung k
inner join public.learning_agreement_version lav on
    k.learning_agreement_version_id = lav.learning_agreement_version_id
inner join public.gastkurs g on
    k.gastkurs_id = g.gastkurs_id
inner join public.hu_modul hm on
    k.hu_modul_id = hm.hu_modul_id;




-- Query 9: Summe anerkannter ECTS pro Aufenthalt
-- Wie viele ECTS wurden für einen Auslandsaufenthalt insgesamt anerkannt?
create view query_9 as
select
    a.auslandsaufenthalt_id,
    COUNT(a2.anerkannte_ects) AS anerkannte_ects
from
    public.anerkennungsantrag a
inner join public.anerkennungsentscheidung a2 on
    a.anerkennungsantrag_id = a2.anerkennungsantrag_id
inner join public.auslandsaufenthalt a3 on
    a.auslandsaufenthalt_id = a3.auslandsaufenthalt_id
group by
    a.auslandsaufenthalt_id;




-- Query 10: Teilweise oder nicht anerkannte Leistungen
-- Welche erbrachten Leistungen wurden nur teilweise anerkannt oder abgelehnt?
create view query_10 as
select
    hm.ects,
    hm."name",
    a.hu_modul_id,
    a.anerkannte_ects,
    a.entscheidung,
    el.gastkurs_id,
    el.ects,
    el.note,
    el.bestanden
from
    public.erbrachte_leistung el
inner join public.anerkennungsentscheidung a on
    el.erbrachteleistungs_id = a.erbrachteleistungs_id
inner join public.hu_modul hm on
    a.hu_modul_id = hm.hu_modul_id
WHERE a.entscheidung IN ('teilweise_anerkannt', 'abgelehnt');
