USE Stundenplan;
SELECT getAnwesenheitsliste(1);

/*Anna Müller*/
SELECT getDozentTermine(1,"WS2023/2024");

SELECT getDualestudenten();

/*Königsmann*/
SELECT getFehltage(456789);

/*Königsmann*/
SELECT getNextTermin(456789,"Web-Engineering");
SELECT getNextTermin(456789, "Datenbanken");

SELECT isUni(456789,"2024-10-03");
SELECT isUni(456789,"2025-10-01");