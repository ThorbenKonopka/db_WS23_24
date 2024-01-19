USE `Stundenplan`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` TRIGGER `beforeUpdateAnwesenheit` BEFORE UPDATE ON `Anwesenheit` FOR EACH ROW BEGIN
    INSERT INTO `AnwesenheitProtokoll` (
        `fehlgrundVorher`, `Anwesenheit_terminId`, `Anwesenheit_matrikelnummer`
    )
    VALUES (
        OLD.fehlgrund, OLD.terminId, OLD.matrikelnummer
    );
END
$$

DELIMITER ;
