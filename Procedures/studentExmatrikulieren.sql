CREATE DEFINER=`root`@`localhost` PROCEDURE `studentExmatrikulieren`(IN matrikelnummer_param INT)
BEGIN

    /* Lösche den Studenten aus der Tabelle BelegteVeranstaltung */
    DELETE FROM Stundenplan.BelegteVeranstaltung
    WHERE matrikelnummer = matrikelnummer_param;

    /* Lösche die Anwesenheitsdaten des Studenten */
    DELETE FROM Stundenplan.Anwesenheit
    WHERE matrikelnummer = matrikelnummer_param;

    /* Lösche den Studenten aus der Tabelle Student */
    DELETE FROM Stundenplan.Student
    WHERE matrikelnummer = matrikelnummer_param;
    
END