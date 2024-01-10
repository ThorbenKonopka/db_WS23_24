USE `Stundenplan`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `getDozentTermine`(dozentId INT, semester VARCHAR(50)) RETURNS varchar(1024) CHARSET utf8mb4
    READS SQL DATA
BEGIN
	/* Deklaration der Ergebniszeichenfolge */
    DECLARE result VARCHAR(1024);
    
    /* Variable für das Abbruchkriterium */
    DECLARE done INT DEFAULT 0;
    
    /* Deklaration der Cursor-Variablen */
    DECLARE terminId INT;
    DECLARE datum DATE;
    DECLARE veranstaltungsName VARCHAR(255);
    
    /* Deklaration des Cursors */
	DECLARE termincursor CURSOR
     FOR SELECT Termin.terminId, Termin.datum, CONCAT(Modul.name, ' - ', D_Typ.typ) AS veranstaltungsName
        FROM Termin
        JOIN Veranstaltung ON Termin.veranstaltungId = Veranstaltung.veranstaltungId
        JOIN Modul ON Veranstaltung.modulId = Modul.modulId
        JOIN D_Typ ON Veranstaltung.typ = D_Typ.typ
        WHERE Veranstaltung.dozentId = dozentId AND Veranstaltung.semester = semester;
        
   /* Überprüfen, ob es keine weiteren Zeilen gibt */    
   DECLARE CONTINUE handler
	for SQLSTATE '02000' SET done = 1;
    
    /* Initialisierung der Ergebniszeichenfolge */
    SET result = '';
    
    /* Öffnen des Cursors */
    OPEN termincursor;
    
    /*	-Iterieren durch die Ergebnisse und Konkatenieren mit der Ergebniszeichenfolge */
    WHILE done = 0 DO
        FETCH termincursor INTO terminId, datum, veranstaltungsName;
        IF done = 0 THEN
		SET result = CONCAT(result, 'Termin ID: ', terminId, '; ', 'Datum: ', datum, '; ', 'Veranstaltung: ', veranstaltungsName, '; ','\n');	
        END IF;
    END WHILE;

    /* Schließen des Cursors */
    CLOSE termincursor;
    
    /* Rückgabe der Ergebniszeichenfolge */
    RETURN result;
    
END
$$

DELIMITER ;