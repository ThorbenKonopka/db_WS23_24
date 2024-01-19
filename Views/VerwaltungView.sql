USE `Stundenplan`;
CREATE VIEW verwaltungView AS
SELECT student.name, student.vorname, student.matrikelnummer, student.jahrgang, student.gruppe, modul.name AS Modul, veranstaltung.typ FROM Student student
LEFT JOIN BelegteVeranstaltung bv ON bv.matrikelnummer = student.matrikelnummer
LEFT JOIN Veranstaltung veranstaltung ON veranstaltung.veranstaltungId = bv.veranstaltungId
LEFT JOIN Modul modul ON modul.modulId = veranstaltung.modulId;
