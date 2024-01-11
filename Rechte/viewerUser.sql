CREATE USER IF NOT EXISTS `viewer`@'%' IDENTIFIED BY "password";
GRANT SELECT, EXECUTE ON `Stundenplan` . * TO `viewer`@`%`;
FLUSH PRIVILEGES;