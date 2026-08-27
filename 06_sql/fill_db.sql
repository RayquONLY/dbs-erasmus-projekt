/*
INSERT INTO table_name ()
VALUES 
(),
(),
();
*/

INSERT INTO fakultaet (fakultaet_id, name)
VALUES 
(0, 'Mathematisch-Naturwissenschaftliche Fakultät'),
(1, 'Philosophische Fakultät'),
(2, 'Sprach- und literaturwissenschaftliche Fakultät');


INSERT INTO institut (institut_id, fakultaet_id, name)
VALUES 
(0, 0, 'Institut für Chemie'),
(1, 0, 'Institut für Informatik'),
(2, 1, 'Institut für Philosophie'),
(3, 1, 'Institut für Geschichtswissenschaften'),
(4, 2, 'Institut für deutsche Literatur'),
(5, 2, 'Institut für Romanistik');


INSERT INTO table_name (studiengang_id, institut_id, name, abschluss)
VALUES 
(0,0,'Monobachelor Chemie','Bachelor'),
(1,1,'Monomaster Informatik','Master'),
(2,2,'Monobachelor Philosophie','Bachelor'),
(3,3,'Joint M. A. European History','Master'),
(4,4,'Bachelor Deutsche Literatur','Bachelor'),
(5,5,'Bachelor Französisch','Bachelor');


INSERT INTO table_name ()
VALUES 
(),
(),
();