package de.stundenplan.tests.inserts;

import de.stundenplan.ConnectionPool;
import de.stundenplan.tests.Testcase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SemesterGenerator extends Testcase {
    @Override
    public String getName() {
        return "SemesterGenerator";
    }

    @Override
    public void test() throws SQLException {
        Connection con = ConnectionPool.getConnectionPool().getRootConnection();
        int jahre = 50;
        int startjahr = 2025;
        try {
            for (int i = 0; i < jahre; i++) {
                int jahr = startjahr + i;

                String ws = "WS" + jahr + "/" + (jahr + 1);
                String ss = "SS" + (jahr + 1);

                String sql = "INSERT INTO D_Semester (semester) VALUES (?)";
                PreparedStatement statement = con.prepareStatement(sql);

                statement.setString(1, ws);
                statement.executeUpdate();

                statement.setString(1, ss);
                statement.executeUpdate();
            }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Con nicht schließen
            System.out.println("Semester erzeugt");
        }
    }
}
