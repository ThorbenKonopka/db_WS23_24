USE `Stundenplan`;

DELIMITER $$

CREATE TRIGGER Stundenplan.beforeInsertGruppeAtTermin2Gruppe
BEFORE INSERT ON Termin2Gruppe
FOR EACH ROW
BEGIN
    IF (NEW.gruppe LIKE "g-l") THEN
       	SET NEW.gruppe = "G-L";
    END IF;
    IF NEW.gruppe LIKE "a-f" THEN
        SET NEW.gruppe = "A-F";
    END IF;
    IF NEW.gruppe NOT IN (SELECT gruppe FROM D_Gruppe) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Die angegebene Gruppe existiert nicht';
    END IF;
END
$$


CREATE TRIGGER Stundenplan.beforeInsertGruppeAtStudent
BEFORE INSERT ON Student
FOR EACH ROW
BEGIN
    IF NEW.gruppe LIKE "g-l" THEN
       	SET NEW.gruppe = "G-L";
    END IF;
    IF NEW.gruppe LIKE "a-f" THEN
        SET NEW.gruppe = "A-F";
    END IF;
    IF NEW.gruppe NOT IN (SELECT gruppe FROM D_Gruppe) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Die angegebene Gruppe existiert nicht';
    END IF;
END
$$

DELIMITER ;
