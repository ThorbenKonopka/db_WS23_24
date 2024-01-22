package de.stundenplan.tests.inserts;

import de.stundenplan.ConnectionPool;
import de.stundenplan.tests.Testcase;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;

public class TerminGenerator extends Testcase {
    @Override
    public String getName() {
        return "TerminGenerator";
    }

    @Override
    public void test() throws SQLException {
        Connection con = ConnectionPool.getConnectionPool().getRootConnection();
        try {
            String countSql = "SELECT COUNT(*) AS anzahl FROM Veranstaltung";
            PreparedStatement countStmt = con.prepareStatement(countSql);
            ResultSet countRs = countStmt.executeQuery();
            int anzahlVeranstaltungen = 0;

            if (countRs.next()) {
                anzahlVeranstaltungen = countRs.getInt("anzahl");
            }


            LocalDate datum = LocalDate.of(2025, 9, 1);
            LocalTime beginn = LocalTime.of(8, 0);
            LocalTime ende = LocalTime.of(10, 0);

            for (int veranstaltungId = 1; veranstaltungId <= anzahlVeranstaltungen; veranstaltungId++) {
                for (int i = 0; i < 10; i++) {
                    String terminSql = "INSERT INTO Termin (datum, beginn, ende, veranstaltungId) VALUES (?, ?, ?, ?)";
                    PreparedStatement terminStmt = con.prepareStatement(terminSql);

                    terminStmt.setDate(1, Date.valueOf(datum.plus(i * 7, ChronoUnit.DAYS)));
                    terminStmt.setTime(2, Time.valueOf(beginn));
                    terminStmt.setTime(3, Time.valueOf(ende));
                    terminStmt.setInt(4, veranstaltungId);

                    terminStmt.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Con nicht schließen
            System.out.println("Termin erzeugt");
        }
        }
}

