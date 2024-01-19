CREATE USER IF NOT EXISTS `verwalter`@'%' IDENTIFIED BY "password";
GRANT SELECT ON `Stundenplan` . verwaltungView TO `verwalter`@`%`;
GRANT EXECUTE ON PROCEDURE `Stundenplan`.studentExmatrikulieren TO `verwalter`@`%`;
GRANT EXECUTE ON PROCEDURE `Stundenplan`.trageAnwesenheitEin TO `verwalter`@`%`;
FLUSH PRIVILEGES;
