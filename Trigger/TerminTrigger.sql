DROP TRIGGER IF EXISTS `Stundenplan`.`TERMIN_AFTER_UPDATE`;

DELIMITER $$
USE `Stundenplan`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Stundenplan`.`TERMIN_AFTER_UPDATE` AFTER UPDATE ON `Termin` FOR EACH ROW
BEGIN
	IF NEW.datum IS NULL AND NEW.beginn is NULL AND NEW.ende IS NULL THEN
		CALL erstelleHistorieneintrag(NEW.terminid, "Ausfall");
	ELSEIF OLD.datum != NEW.datum OR OLD.beginn != NEW.beginn OR OLD.ende != NEW.ende THEN
		CALL erstelleHistorieneintrag(NEW.terminId,"Verschiebung");
	END IF;
END$$
DELIMITER ;

