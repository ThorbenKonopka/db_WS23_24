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

        for (int i = 0; i < jahre; i++) {
            int jahr = startjahr + i;

            String ws = "WS" + jahr + "/" + (jahr + 1);
            String ss = "SS" + (jahr + 1);

            String sql = "INSERT INTO D_Semester (semester) VALUES (?)";
            try (PreparedStatement statement = con.prepareStatement(sql)) {
                try {
                    statement.setString(1, ws);
                    statement.executeUpdate();
                } catch (SQLException e) {
                    System.out.println("DOPPELT: " + ws );
                }

                try {
                    statement.setString(1, ss);
                    statement.executeUpdate();
                } catch (SQLException e) {
                    System.out.println("DOPPELT: " + ss);
                }
            }
        }
    }
}
