USE `Stundenplan`;

DELIMITER $$

CREATE TRIGGER Stundenplan.beforeInsertJahrgang
BEFORE INSERT ON D_Jahrgang
FOR EACH ROW
BEGIN
    IF NEW.jahrgang > 2000 AND NEW.jahrgang < 2100 THEN
       	SET NEW.jahrgang = (NEW.jahrgang - 2000);
    END IF;
    IF NEW.jahrgang > 99 OR NEW.jahrgang < 1 THEN
    	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalider Jahrgang';
    END IF;
END
$$


CREATE TRIGGER Stundenplan.beforeInsertStudent
BEFORE INSERT ON Student
FOR EACH ROW
BEGIN
    IF NEW.jahrgang > 2000 AND NEW.jahrgang < 2100 THEN
       	SET NEW.jahrgang = (NEW.jahrgang - 2000);
    END IF;
    IF NEW.jahrgang NOT IN (SELECT jahrgang FROM D_Jahrgang) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalider Jahrgang';
    END IF;
END
$$


CREATE TRIGGER Stundenplan.beforeInsertVeranstaltung
BEFORE INSERT ON Veranstaltung
FOR EACH ROW
BEGIN
    IF NEW.jahrgang > 2000 AND NEW.jahrgang < 2100 THEN
       	SET NEW.jahrgang = (NEW.jahrgang - 2000);
    END IF;
    IF NEW.jahrgang NOT IN (SELECT jahrgang FROM D_Jahrgang) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalider Jahrgang';
    END IF;
END
$$

DELIMITER ;
