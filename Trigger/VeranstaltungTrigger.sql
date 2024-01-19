DROP TRIGGER IF EXISTS `Stundenplan`.`VERANSTALTUNG_BEFORE_DELETE`;

DELIMITER $$
USE `Stundenplan`$$
CREATE DEFINER=`root`@`%` TRIGGER `VERANSTALTUNG_BEFORE_DELETE` BEFORE DELETE ON `Veranstaltung` FOR EACH ROW BEGIN
    
    DECLARE termin_zaehler INT;
    SET SQL_SAFE_UPDATES = 0;
    SELECT COUNT(*)
    INTO termin_zaehler
    FROM Termin
    WHERE veranstaltungId = OLD.veranstaltungId AND (datum IS NOT NULL OR beginn IS NOT NULL OR ende is NOT NULL);
    
    IF termin_zaehler > 0 THEN
		SIGNAL SQLSTATE "45000"
		SET MESSAGE_TEXT = "Veranstaltung kann nicht gelöscht werden, solange es noch zugehörige Termine gibt";
    ELSE
		DELETE FROM Historie WHERE terminId IN (SELECT terminId FROM Termin WHERE veranstaltungId = OLD.veranstaltungId);
		DELETE FROM Anwesenheit WHERE terminId IN (SELECT terminId FROM Termin WHERE veranstaltungId = OLD.veranstaltungId);
		DELETE FROM Termin2Gruppe WHERE terminId IN (SELECT terminId FROM Termin WHERE veranstaltungId = OLD.veranstaltungId);
		DELETE FROM vertretenderDozent WHERE terminId IN (SELECT terminId FROM Termin WHERE veranstaltungId = OLD.veranstaltungId);
        DELETE FROM Termin WHERE veranstaltungId = OLD.veranstaltungId;
        DELETE FROM BelegteVeranstaltung WHERE veranstaltungId = OLD.veranstaltungId;
	END IF;
    SET SQL_SAFE_UPDATES = 1;
END$$
DELIMITER ;

