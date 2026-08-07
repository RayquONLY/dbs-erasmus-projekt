CREATE DATABASE [IF NOT EXISTS] erasmus_db;

CREATE TABLE student (
matrikelnummer INTEGER PRIMARY, 
studiengang_id INTEGER NOT NULL, 
vorname VARCHAR(255) NOT NULL  , 
nachname VARCHAR(255) NOT NULL , 
email VARCHAR(255) 

FOREIGN KEY (studiengang_id)
REFERENCES studiengang(studiengang_id)
);
