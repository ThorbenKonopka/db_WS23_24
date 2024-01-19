USE `Stundenplan`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` TRIGGER `beforeInsertBelegteveranstaltung` BEFORE INSERT ON `BelegteVeranstaltung` FOR EACH ROW BEGIN
    /* Deklaration von Variablen für Studenten- und Veranstaltungs-Jahrgang */
    DECLARE studentJahrgang INT;
    DECLARE veranstaltungJahrgang INT;
    
    /* Abrufen des Jahrgangs des Studenten basierend auf der übergebenen Matrikelnummer */
    SELECT jahrgang INTO studentJahrgang
    FROM Student
    WHERE matrikelnummer = NEW.matrikelnummer;

    /* Abrufen des Jahrgangs der Veranstaltung basierend auf der übergebenen Veranstaltungs-ID */
    SELECT jahrgang INTO veranstaltungJahrgang
    FROM Veranstaltung
    WHERE veranstaltungId = NEW.veranstaltungId;

    /* Prüfung ob Jahrgang angegeben wird und ob beide angaben übereinstimmen */
    IF studentJahrgang IS NULL OR veranstaltungJahrgang IS NULL OR studentJahrgang != veranstaltungJahrgang THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ein Student kann nur an Veranstaltungen seines Jahrgangs teilnehmen.';
    END IF;
END
$$

DELIMITER ;
