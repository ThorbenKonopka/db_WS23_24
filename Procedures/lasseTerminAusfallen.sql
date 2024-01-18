USE `Stundenplan`;
DROP procedure IF EXISTS `Stundenplan`.`lasseTerminAusfallen`;

DELIMITER $$
CREATE DEFINER=`root`@`%` PROCEDURE `lasseTerminAusfallen`(
    IN p_terminId INT
)

BEGIN
    CALL erstelleHistorieneintrag(p_terminId, 'Ausfall');
    UPDATE Termin
    SET
        datum = NULL,
        beginn = NULL,
        ende = NULL
    WHERE terminId = p_terminId;
END
$$

DELIMITER ;
