CREATE USER IF NOT EXISTS `dozent`@'%' IDENTIFIED BY "password";
GRANT SELECT ON `Stundenplan` . dozentView TO `dozent`@`%`;
GRANT EXECUTE ON `Stundenplan`.trageVertretungEin, `Stundenplan`.lasseTerminAusfallen, `Stundenplan`.verschiebeTermin, `Stundenplan`.erstelleHistorieneintrag TO `dozent`@`%`;
FLUSH PRIVILEGES;
