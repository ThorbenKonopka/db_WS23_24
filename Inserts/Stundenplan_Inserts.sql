USE `Stundenplan`;
 INSERT INTO D_Typ (typ)
 VALUES ("Vorlesungen"),
        ("Praktika"),
        ("Übungen");

 INSERT  INTO D_Gruppe (gruppe)
 VALUES ("A-F"),
        ("G-L");

 INSERT INTO D_Fehlgrund (fehlgrund)
 VALUES ("unentschuldigt"),
        ("freigestellt"),
        ("Krank"),
        ("verspätet");

 INSERT INTO D_Aenderungsart (aenderungsart)
 VALUES ("Verschiebung"),
        ("Ausfall"),
        ("Vertretung");

INSERT INTO Dozent (name, vorname) 
VALUES ("Müller", "Anna"),
       ("Schmidt", "Johannes"),
       ("Fischer", "Laura"),
       ("Kamsties", "Erik");
       
INSERT INTO D_Semester (semester) 
VALUES ("WS2023/2024"),
       ("SS2024"),
       ("WS2024/2025");

INSERT INTO Modul (anwesenheitspflichtig, inSemester, name) 
VALUES (1, 1, "Datenbanken"),
       (0, 5, "Irgendwas im berufsbegleitenden Teil"),
       (1, 3, "Web-Engineering");
       
INSERT INTO D_Jahrgang (jahrgang) 
VALUES ("23"),
       ("24"),
       ("25"),
       ("22");

INSERT INTO Student (matrikelnummer, name, vorname, jahrgang, gruppe) 
VALUES (123456, "Blauschuh", "Bubi", "23", "A-F"),
       (234567, "Kleeblatt", "Katrin", "25", "G-L"),
       (345678, "Griesgram", "Grummel", "24", "G-L"),
       (456789, "Königsmann", "Thomas", "23", "A-F"),
       (314159, "Konopka", "Nils Thorben", "22", "G-L");

INSERT INTO Veranstaltung (dozentId, typ, semester, modulId, jahrgang) 
VALUES (1, "Vorlesungen", "WS2023/2024", 1, "23"),
       (2, "Praktika", "SS2024", 2, "24"),
       (3, "Übungen", "WS2024/2025", 3, "25");

INSERT INTO Termin (datum, beginn, ende, veranstaltungId) 
VALUES ("2023-10-01", "08:00:00", "10:00:00", 1),
       ("2024-04-02", "10:00:00", "12:00:00", 2),
       ("2024-10-03", "14:00:00", "16:00:00", 3);

INSERT INTO Anwesenheit (fehlgrund, matrikelnummer, terminId) 
VALUES ("Krank", 123456, 1),
       (NULL, 234567, 2),
       ("verspätet", 345678, 3),
       ("krank", 456789,1);
INSERT INTO BelegteVeranstaltung (veranstaltungId, matrikelnummer) 
VALUES (1, 123456),
       (2, 234567),
       (3, 345678),
       (1, 456789);
       
INSERT INTO Termin2Gruppe (terminId, gruppe) 
VALUES (1, "A-F"),
       (2, "G-L"),
       (3, "A-F");

INSERT INTO Historie (aenderungsart, aenderungsdatum, terminId, datum, beginn, ende, status, veranstaltungId) 
VALUES ("Verschiebung", "2023-09-30 12:00:00", 1, "2023-10-02", "08:00:00", "10:00:00", "Geplant", 1),
       ("Ausfall", "2024-04-01 12:00:00", 2, NULL, NULL, NULL, "Abgesagt", 2),
       ("Vertretung", "2024-10-02 12:00:00", 3, "2024-10-03", "14:00:00", "16:00:00", "Geändert", 3);
