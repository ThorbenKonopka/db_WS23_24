USE `Stundenplan`;

DELIMITER $$

CREATE FUNCTION isUni(matrikelnummer int,  tag DATE) RETURNS BOOLEAN
READS SQL DATA

BEGIN
    DECLARE erg BOOLEAN
    DEFAULT 0;
    
    DECLARE anzahlVeranstaltungen int;

    SELECT COUNT(termin.datum) INTO anzahlVeranstaltungen
    FROM Student student 
    JOIN BelegteVeranstaltung bv ON bv.matrikelnummer = student.matrikelnummer
    JOIN Veranstaltung veranstaltung ON veranstaltung.veranstaltungId = bv.veranstaltungId
    JOIN Termin termin ON termin.veranstaltungId = veranstaltung.veranstaltungId
    WHERE student.matrikelnummer = matrikelnummer AND termin.datum LIKE tag;

    IF anzahlVeranstaltungen > 0 THEN
        SET erg = 1;
    END IF;

    RETURN erg;
END
$$

DELIMITER ;