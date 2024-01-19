USE `Stundenplan`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` TRIGGER `beforeInsertTermin` BEFORE INSERT ON `Termin` FOR EACH ROW BEGIN
    /* Prüfen, ob das Datum, der Beginn und das Ende des neuen Termins in der Zukunft liegen */
    
    IF NEW.datum < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ein neuer Termin muss in der Zukunft liegen.';
    END IF;
END
$$

DELIMITER ;
