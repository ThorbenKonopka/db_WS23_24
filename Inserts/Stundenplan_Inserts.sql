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

INSERT INTO Modul (anwesenheitspflichtig, pflichtveranstaltung, inSemester, name) 
VALUES 
				-- Semester 1--
	(1, 1, 1, "Internetbasierte Anwendungen"),
        (1, 1, 1, "Grundlagen OO-Programmiersprachen"),
        (1, 1, 1, "Datenbankgrundlagen"),
        (1, 1, 1, "Mathematik für Informatiker 1"),
        (1, 1, 1, "Grundlagen betriebswirtschaftlicher Entscheidungstatbestände"),
        (1, 1, 1, "Arbeits-, Lern- und Präsentationstechnik 1"),
        (1, 1, 1, "Englisch 1"),
        
        		-- Semester 2--
	(1, 1, 2, "Algorithmen und Datenstrukturen"),
        (1, 1, 2, "Fortgeschrittene Konzepte Java"),
        (1, 1, 2, "Rechnerstrukturen"),
        (1, 1, 2, "Mathematik für Informatiker 2"),
        (1, 1, 2, "Grundlagen der Unternehmensführung"),
        (1, 0, 2, "Arbeits-, Lern- und Präsentationstechnik 2"),
        (1, 0, 2, "Englisch 2"),
        
				-- Semester 3--
	(1, 1, 3, "Web-Engineering"),
        (1, 1, 3, "OO-Software-Modellierung"),
        (1, 1, 3, "Rechnernetze"),
        (1, 1, 3, "Betriebssysteme"),
        (1, 0, 3, "Entwicklung verteilter Anwendungen"),
        (1, 0, 3, "Datenbankmodelle und Datenbankentwurf"),
        
				-- Semester 4--
	(1, 0, 4, "Componentware"),
        (1, 1, 4, "Software-Architektur und -Design"),
        (1, 0, 4, "Standardsoftware"),
        (1, 0, 4, "Mobile Systeme"),
        (1, 0, 4, "Vernetzung eingebetteter Systeme"),
        (1, 0, 4, "Datenbankintegrität & aktive DB-Systeme"),
        (1, 0, 4, "Einsatz von In-Memory Datenbanken"),
        
				-- Semester 5--
	(0, 1, 5, "IT-Sicherheit"),
        (0, 0, 5, "Mensch-Computer-Interaktion"),
        (0, 0, 5, "Software-Management und Prozesse"),
        (0, 1, 5, "IT-Kostenplanung"),
        (0, 0, 5, "Aspekte des DV-Rechts"),
        (0, 0, 5, "Neue Arbeits- und Organisationsformen"),
        (0, 0, 5, "Projektmanagement"),
        
				-- Semester 6--
	(0, 0, 6, "Ausgewählte Aspekte der Programmiertechnik"),
        (0, 0, 6, "Moderne Programmierkonzepte"),
        (0, 1, 6, "Automaten und formale Sprachen"),
        (0, 1, 6, "Statistik, Stochastik"),
        (0, 0, 6, "Interaktive Medien"),
        (0, 0, 6, "Software-Integration, -Test und -Wartung");
               
INSERT INTO D_Jahrgang (jahrgang) 
VALUES ("23"),
       ("24"),
       ("25"),
       ("22");

INSERT INTO Student (matrikelnummer, name, vorname, jahrgang, gruppe) 
VALUES (1, "Blauschuh", "Bubi", "23", "A-F"),
       (2, "Kleeblatt", "Katrin", "25", "G-L"),
       (3, "Griesgram", "Grummel", "24", "G-L"),
       (4, "Königsmann", "Thomas", "23", "A-F"),
       (5, "Konopka", "Nils Thorben", "22", "G-L");

INSERT INTO Veranstaltung (dozentId, typ, semester, modulId, jahrgang) 
VALUES (1, "Vorlesungen", "WS2023/2024", 1, "23"),
       (2, "Praktika", "SS2024", 2, "24"),
       (3, "Übungen", "WS2024/2025", 3, "25"),
       (1, "Übungen", "WS2023/2024", 1, "23");

INSERT INTO Termin (datum, beginn, ende, veranstaltungId) 
VALUES ("2023-10-01", "08:00:00", "10:00:00", 1),
       ("2024-04-02", "10:00:00", "12:00:00", 2),
       ("2024-10-03", "14:00:00", "16:00:00", 3),
       ("2025-10-01", "08:00:00", "10:00:00", 1);

INSERT INTO Anwesenheit (fehlgrund, matrikelnummer, terminId) 
VALUES ("Krank", 123456, 1),
       (NULL, 234567, 2),
       ("verspätet", 345678, 3),
       ("krank", 456789,1);
INSERT INTO BelegteVeranstaltung (veranstaltungId, matrikelnummer) 
VALUES (1, 123456),
       (2, 234567),
       (3, 345678),
       (1, 456789),
       (4, 456789);
       
INSERT INTO Termin2Gruppe (terminId, gruppe) 
VALUES (1, "A-F"),
       (2, "G-L"),
       (3, "A-F");

INSERT INTO Historie (aenderungsart, aenderungsdatum, terminId, datum, beginn, ende) 
VALUES ("Verschiebung", "2023-09-30 12:00:00", 1, "2023-10-02", "08:00:00", "10:00:00"),
       ("Ausfall", "2024-04-01 12:00:00", 2, NULL, NULL, NULL),
       ("Vertretung", "2024-10-02 12:00:00", 3, "2024-10-03", "14:00:00", "16:00:00");
