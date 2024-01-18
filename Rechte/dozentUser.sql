CREATE USER IF NOT EXISTS `dozent`@`%` IDENTIFIED BY "password";
GRANT SELECT ON `Stundenplan`.dozentView TO `dozent`@`%`;
GRANT EXECUTE ON PROCEDURE Stundenplan.trageVertretungEin TO `dozent`@`%`;
GRANT EXECUTE ON PROCEDURE Stundenplan.lasseTerminAusfallen TO `dozent`@`%`;
GRANT EXECUTE ON PROCEDURE Stundenplan.verschiebeTermin TO `dozent`@`%`;
GRANT EXECUTE ON PROCEDURE Stundenplan.erstelleHistorieneintrag TO `dozent`@`%`;
FLUSH PRIVILEGES;
