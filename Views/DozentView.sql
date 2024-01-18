 USE `Stundenplan`;
 CREATE VIEW dozentView AS
 SELECT modul.name AS Modul, veranstaltung.veranstaltungid, veranstaltung.typ, dozent.name AS Dozent, termin.datum, termin.beginn AS Start, termin.ende AS Ende FROM Termin termin
 JOIN Veranstaltung veranstaltung ON veranstaltung.veranstaltungId = termin.veranstaltungId
 JOIN Dozent dozent ON dozent.dozentId = veranstaltung.dozentId
 JOIN Modul modul ON modul.modulId = veranstaltung.modulId;
