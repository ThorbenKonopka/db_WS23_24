 CREATE VIEW dozentView AS
 SELECT * FROM Termin termin
 /*JOIN Veranstaltung veranstaltung ON veranstaltung.veranstaltungId = termin.veranstaltungId
 LEFT JOIN vertretenderDozent vd ON vd.terminId = termin.terminId
 LEFT JOIN Historie historie ON historie.terminId = termin.terminId
 JOIN Dozent dozent ON dozent.dozentId = veranstaltung.dozentId
 JOIN Dozent dozent2 ON dozent2.dozentId = vd.dozentId*/;
