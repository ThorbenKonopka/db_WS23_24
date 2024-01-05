CREATE DEFINER=`root`@`localhost` FUNCTION `getFehltage`(pMatrikelnummer INT) RETURNS text CHARSET utf8mb4
    READS SQL DATA
BEGIN
	DECLARE done INT DEFAULT 0;
    DECLARE fehltage VARCHAR(1000) DEFAULT '';
    DECLARE datum DATE;
    DECLARE beginn TIME;
    DECLARE fehlgrund VARCHAR(50);
    DECLARE fehlCursor CURSOR FOR 
        SELECT t.datum, t.beginn, a.fehlgrund 
        FROM Anwesenheit a 
        INNER JOIN Termin t ON a.terminId = t.terminId
        WHERE a.matrikelnummer = pMatrikelnummer AND a.fehlgrund IS NOT NULL;
        DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done =1;
	OPEN fehlCursor;
		WHILE done = 0 DO
			FETCH fehlCursor INTO datum, beginn, fehlgrund;
			IF done = 0 THEN
				SET fehltage = CONCAT(fehltage, 'Datum: ', datum, ', Beginn: ', beginn, ', Fehlgrund: ', fehlgrund, '; ');
			END IF;
		END WHILE;
	CLOSE fehlCursor;
    RETURN fehltage;
END