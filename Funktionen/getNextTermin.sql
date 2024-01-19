USE Stundenplan;
DROP function IF EXISTS `getNextTermin`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `getNextTermin`(studentId INT, modulName VARCHAR(255)) RETURNS varchar(255) CHARSET utf8mb4
    READS SQL DATA
BEGIN
    DECLARE nextTermin VARCHAR(255);

    IF modulName = 'Alle' THEN
        SELECT CONCAT(Termin.`datum`, ';', Termin.`beginn`, ';', Modul.name) INTO nextTermin
        FROM BelegteVeranstaltung
        LEFT JOIN Veranstaltung ON BelegteVeranstaltung.`veranstaltungId` = Veranstaltung.`veranstaltungId`
        LEFT JOIN Modul ON Veranstaltung.`modulId` = Modul.`modulId`
        LEFT JOIN Termin ON Veranstaltung.`veranstaltungId` = Termin.`veranstaltungId`
        WHERE (BelegteVeranstaltung.`matrikelnummer` = studentId)
            AND Termin.`datum` >= CURRENT_DATE
        ORDER BY Termin.`datum`, Termin.`beginn`
        LIMIT 1;
    ELSE
        SELECT CONCAT(Termin.`datum`, ';', Termin.`beginn`, ';', Modul.name) INTO nextTermin
        FROM BelegteVeranstaltung
        JOIN Veranstaltung ON BelegteVeranstaltung.`veranstaltungId` = Veranstaltung.`veranstaltungId`
        JOIN Modul ON Veranstaltung.`modulId` = Modul.`modulId`
        JOIN Termin ON Veranstaltung.`veranstaltungId` = Termin.`veranstaltungId`
        WHERE BelegteVeranstaltung.`matrikelnummer` = studentId
            AND Modul.name = modulName 
            AND Termin.`datum` >= CURRENT_DATE
        ORDER BY Termin.`datum`, Termin.`beginn`
        LIMIT 1;
    END IF;

    RETURN nextTermin;
END
$$

DELIMITER ;
