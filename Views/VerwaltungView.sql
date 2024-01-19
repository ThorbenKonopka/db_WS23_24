USE `Stundenplan`;
CREATE VIEW verwaltungView AS
SELECT student.name, student.vorname, student.matrikelnummer, student.jahrgang, student.gruppe, modul.name AS Modul, veranstaltung.typ FROM Student student
JOIN BelegteVeranstaltung bv ON bv.matrikelnummer = student.matrikelnummer
JOIN Veranstaltung veranstaltung ON veranstaltung.veranstaltungId = bv.veranstaltungId
JOIN Modul modul ON modul.modulId = veranstaltung.modulId;
