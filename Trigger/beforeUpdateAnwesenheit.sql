CREATE DEFINER=`root`@`localhost` TRIGGER `beforeUpdateAnwesenheit` BEFORE UPDATE ON `anwesenheit` FOR EACH ROW BEGIN
    INSERT INTO `AnwesenheitProtokoll` (
        `fehlgrundVorher`, `matrikelnummerVorher`, `terminIdVorher`
    )
    VALUES (
        OLD.fehlgrund, OLD.matrikelnummer, OLD.terminId
    );
END