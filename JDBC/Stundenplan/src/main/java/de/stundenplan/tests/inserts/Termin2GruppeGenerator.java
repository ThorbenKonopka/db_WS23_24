package de.stundenplan.tests.inserts;

import de.stundenplan.ConnectionPool;
import de.stundenplan.tests.Testcase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

public class Termin2GruppeGenerator extends Testcase {
    @Override
    public String getName() {
        return "Termin2Gruppe Generator";
    }

    @Override
    public void test() throws SQLException {
        Connection con = ConnectionPool.getConnectionPool().getRootConnection();
        Random random = new Random();

        try {
            String terminModulSql = "SELECT t.terminId FROM Termin t JOIN Veranstaltung v ON t.veranstaltungId = v.veranstaltungId JOIN Modul m ON v.modulId = m.modulId WHERE m.pflichtveranstaltung = 1";
            PreparedStatement terminModulStmt = con.prepareStatement(terminModulSql);
            ResultSet terminModulRs = terminModulStmt.executeQuery();

            while (terminModulRs.next()) {
                int terminId = terminModulRs.getInt("terminId");

                String[] gruppen = {"A-F", "G-L"};
                String gruppe = gruppen[random.nextInt(gruppen.length)];

                String termin2GruppeSql = "INSERT INTO Termin2Gruppe (terminId, gruppe) VALUES (?, ?)";
                PreparedStatement termin2GruppeStmt = con.prepareStatement(termin2GruppeSql);

                termin2GruppeStmt.setInt(1, terminId);
                termin2GruppeStmt.setString(2, gruppe);

                termin2GruppeStmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            System.out.println("Termin2Gruppe befüllt");
        }
    }
}
