DROP TRIGGER IF EXISTS `Stundenplan`.`STUDENT_AFTER_INSERT`;

DELIMITER $$
USE `Stundenplan`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Stundenplan`.`STUDENT_AFTER_INSERT` AFTER INSERT ON `Student` FOR EACH ROW
BEGIN
	INSERT INTO BelegteVeranstaltung (veranstaltungId, matrikelnummer)
    SELECT v.veranstaltungId, NEW.matrikelnummer
    FROM Veranstaltung v
    JOIN Modul m USING (modulId)
    WHERE m.pflichtveranstaltung = 1 AND v.jahrgang = NEW.jahrgang;
END$$
DELIMITER ;

