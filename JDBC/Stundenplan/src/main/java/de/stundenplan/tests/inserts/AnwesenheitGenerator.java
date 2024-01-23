package de.stundenplan.tests.inserts;

import de.stundenplan.ConnectionPool;
import de.stundenplan.tests.Testcase;

import java.sql.*;
import java.util.Random;

public class AnwesenheitGenerator extends Testcase {
    @Override
    public String getName() {
        return "AnwesenheitGenerator";
    }

    @Override
    public void test() throws SQLException {
        Connection con = ConnectionPool.getConnectionPool().getRootConnection();

        Random random = new Random();

        try {
            String terminSql = "SELECT terminId FROM Termin";
            PreparedStatement terminStmt = con.prepareStatement(terminSql);
            ResultSet terminRs = terminStmt.executeQuery();

            while (terminRs.next()) {
                int terminId = terminRs.getInt("terminId");
                String studentSql = "SELECT matrikelnummer FROM Student";
                PreparedStatement studentStmt = con.prepareStatement(studentSql);
                ResultSet studentRs = studentStmt.executeQuery();

                while (studentRs.next()) {
                    int matrikelnummer = studentRs.getInt("matrikelnummer");
                    boolean istAnwesend = random.nextBoolean();
                    String anwesenheitSql = "INSERT INTO Anwesenheit (fehlgrund, terminId, matrikelnummer) VALUES (?, ?, ?)";
                    PreparedStatement anwesenheitStmt = con.prepareStatement(anwesenheitSql);

                    if (istAnwesend) {
                        anwesenheitStmt.setNull(1, Types.VARCHAR);
                    } else {
                        String[] fehlgruende = {"Krank", "unentschuldigt", "verspätet", "freigestellt"};
                        String fehlgrund = fehlgruende[random.nextInt(fehlgruende.length)];
                        anwesenheitStmt.setString(1, fehlgrund);
                    }

                    anwesenheitStmt.setInt(2, terminId);
                    anwesenheitStmt.setInt(3, matrikelnummer);

                    anwesenheitStmt.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            System.out.println("Anwesenheit befüllt");
        }
    }
}

