USE `Stundenplan`;
DROP procedure IF EXISTS `Stundenplan`.`verschiebeTermin`;

DELIMITER $$
CREATE DEFINER=`root`@`%` PROCEDURE `verschiebeTermin`(
    IN p_terminId INT,
    IN p_neuesDatum DATE,
    IN p_neuerBeginn TIME,
    IN p_neuesEnde TIME
)
BEGIN
    CALL erstelleHistorieneintrag(p_terminId, 'Verschiebung');
    UPDATE Termin
    SET
        datum = p_neuesDatum,
        beginn = p_neuerBeginn,
        ende = p_neuesEnde
    WHERE terminId = p_terminId;
END
$$

DELIMITER ;

