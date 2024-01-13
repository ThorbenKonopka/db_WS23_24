USE `Stundenplan`;
DROP procedure IF EXISTS `trageAnwesenheitEin`;

USE `Stundenplan`;
DROP procedure IF EXISTS `Stundenplan`.`trageAnwesenheitEin`;
;

DELIMITER $$
USE `Stundenplan`$$
CREATE DEFINER=`root`@`%` PROCEDURE `trageAnwesenheitEin`(IN pTerminId INT, IN pAnwesendeStudentenIds TEXT)
BEGIN
    CREATE TEMPORARY TABLE tempAnwesend (matrikelnummer INT);
    CREATE TEMPORARY TABLE tempPflichtig (nameVorname TEXT);
    

    SET @sql = CONCAT('INSERT INTO tempAnwesend (matrikelnummer) VALUES (', REPLACE(pAnwesendeStudentenIds, ',', '),('), ')');
    PREPARE statement FROM @sql;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;
    SELECT * FROM tempAnwesend;
    
    SET @anwesenheitsliste = getAnwesenheitsliste(pTerminId);
    SELECT @anwesenheitsliste;
    
    SET @sql = CONCAT('INSERT INTO tempPflichtig (nameVorname) VALUES ("', REPLACE(@anwesenheitsliste, '\n', '"),("'), '")');
	PREPARE statement FROM @sql;
    SELECT @sql;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;
    DELETE FROM tempPflichtig WHERE nameVorname = "";
    SELECT * FROM tempPflichtig;
    
    INSERT INTO Anwesenheit (matrikelnummer, terminId, fehlgrund)
    SELECT s.matrikelnummer, pTerminId, IF(a.matrikelnummer IS NULL, "unentschuldigt",NULL) AS fehlgrund
    FROM Student s
    LEFT JOIN tempAnwesend a ON s.matrikelnummer = a.matrikelnummer
    WHERE EXISTS (SELECT 1 FROM tempPflichtig p WHERE p.nameVorname = CONCAT(s.name, ', ', s.vorname));
    DROP TEMPORARY TABLE tempAnwesend;
    DROP TEMPORARY table tempPflichtig;
    END$$

DELIMITER ;
;


