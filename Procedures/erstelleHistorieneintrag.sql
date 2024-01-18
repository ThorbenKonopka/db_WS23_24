USE `Stundenplan`;
DROP procedure IF EXISTS `Stundenplan`.`erstelleHistorieneintrag`;
;

DELIMITER $$
CREATE DEFINER=`root`@`%` PROCEDURE `erstelleHistorieneintrag`(
 IN p_terminId INT,
 IN p_aenderungsart VARCHAR(255)
)
BEGIN
    INSERT INTO Historie (aenderungsart, aenderungsdatum, terminId, datum, beginn, ende)
    SELECT 
        p_aenderungsart,
        NOW(),
        terminId,
        datum,
        beginn,
        ende
    FROM Termin
    WHERE terminId = p_terminId;
END
$$

DELIMITER ;



