CALL trageVertretungEin(1,1);
CALL lasseTerminAusfallen(2);
CALL verschiebeTermin(3,'2030-12-13', '09:00:00', '11:00:00');

SELECT * FROM Historie;
SELECT name, terminId  FROM 
Dozent
JOIN vertretenderDozent USING (dozentId);
SELECT * FROM Termin;