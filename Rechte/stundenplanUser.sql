/*Der User stundenplan@% wird durch das setzen der Umgebungsvariablen in der compose.yaml Datei erstellt.*/
GRANT CREATE, DROP, DELETE, INSERT, SELECT, UPDATE, EXECUTE ON `Stundenplan` . * TO `stundenplan`@`%`; 
FLUSH PRIVILEGES;