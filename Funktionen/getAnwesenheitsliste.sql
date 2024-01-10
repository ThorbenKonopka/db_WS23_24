USE `Stundenplan`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `getAnwesenheitsliste`(pTerminId INT) RETURNS text CHARSET utf8mb4
    READS SQL DATA
BEGIN
	DECLARE liste TEXT DEFAULT '';
    DECLARE done INT DEFAULT 0;
    DECLARE tempStudentName VARCHAR(255);
    
    DECLARE studentCursor CURSOR FOR
    SELECT CONCAT(s.name, ', ', s.vorname)
    FROM Student s
    JOIN BelegteVeranstaltung bv ON s.matrikelnummer = bv.matrikelnummer
    JOIN Veranstaltung v ON bv.veranstaltungId = v.veranstaltungId
    JOIN Termin t ON v.veranstaltungId = t.veranstaltungId
    JOIN Modul m ON v.modulId = m.modulId
    WHERE t.terminId = pTerminId AND m.anwesenheitspflichtig = 1;
    
    DECLARE CONTINUE HANDLER 
		FOR SQLSTATE '02000' SET done =1;
        
	OPEN studentCursor;
    WHILE done = 0 DO
    FETCH studentCursor INTO tempStudentName;
    IF done = 0 THEN
		SET liste = CONCAT_WS('\n', liste, tempStudentName);
	END IF;
	END WHILE;
    
    CLOSE studentCursor;
	RETURN liste;
END
$$

DELIMITER ;