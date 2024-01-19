USE Stundenplan;

SELECT * FROM Veranstaltung;
SELECT * FROM Veranstaltung 
JOIN Termin USING (veranstaltungId)
WHERE veranstaltungId = 2;

DELETE FROM Veranstaltung WHERE veranstaltungId = 2;

UPDATE Termin SET datum = NULL, beginn = NULL, ende = NULL
WHERE terminId = 2;

DELETE FROM Veranstaltung WHERE veranstaltungId = 2;

SELECT * FROM Veranstaltung;
SELECT * FROM Veranstaltung 
JOIN Termin USING (veranstaltungId)
WHERE veranstaltungId = 2;

