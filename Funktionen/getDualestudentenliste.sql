USE `Stundenplan`;

DELIMITER $$

CREATE FUNCTION getDualestudenten() RETURNS TEXT
READS SQL DATA

BEGIN
    DECLARE liste TEXT;
    DECLARE done INT DEFAULT 0;
    DECLARE tempStudentName VARCHAR(255);
    
    DECLARE studentCursor CURSOR FOR
    SELECT CONCAT(student.name, ', ', student.vorname)
    FROM Student student
    WHERE DATEDIFF(CURDATE(), getStartdate((student.jahrgang + 2))) >= 0;
    
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