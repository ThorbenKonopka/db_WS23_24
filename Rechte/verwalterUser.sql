CREATE USER IF NOT EXISTS `verwalter`@'%' IDENTIFIED BY "password";
GRANT SELECT ON `Stundenplan` . verwalterView TO `verwalter`@`%`;
GRANT EXECUTE ON `Stundenplan`.studentExmatrikulieren TO `verwalter`@`%`;
FLUSH PRIVILEGES;
