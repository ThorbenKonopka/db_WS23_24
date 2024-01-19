USE `Stundenplan`;
DROP procedure IF EXISTS `Stundenplan`.`trageVertretungEin`;

DELIMITER $$
CREATE DEFINER=`root`@`%` PROCEDURE `trageVertretungEin`(
    IN p_terminId INT,
    IN p_dozentId INT
)
BEGIN
    CALL erstelleHistorieneintrag(p_terminId, 'Vertretung');
    INSERT INTO vertretenderDozent (dozentId, terminId)
    VALUES (p_dozentId, p_terminId)
    ON DUPLICATE KEY UPDATE
    dozentId = p_dozentId;
END
$$

DELIMITER ;

