package de.stundenplan.tests.inserts;

import de.stundenplan.ConnectionPool;
import de.stundenplan.tests.Testcase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

public class VeranstaltungGenerator extends Testcase {
    @Override
    public String getName() {
        return "VeranstaltungGenerator";
    }

    @Override
    public void test() throws SQLException {
        Connection con = ConnectionPool.getConnectionPool().getRootConnection();
        Random random = new Random();
        int startjahr = 2019;
        int jahre = 6;
        for (int i = 0; i < jahre; i++) {
            int year = startjahr + i;
            String[] semesters = {"WS" + year + "/" + (year + 1), "SS" + (year + 1)};
            String[] typen = {"Vorlesungen", "Praktika", "Übungen"};

            for (String semester : semesters) {
                for (int modulId = 1; modulId <= 6; modulId++) {
                    for (String typ : typen) {
                        int dozentId = 1 + random.nextInt(4);

                        String sql = "INSERT INTO Veranstaltung (dozentId, typ, semester, modulId, jahrgang) VALUES (?, ?, ?, ?, ?)";
                        try(PreparedStatement statement = con.prepareStatement(sql)) {

                            statement.setInt(1, dozentId);
                            statement.setString(2, typ);
                            statement.setString(3, semester);
                            statement.setInt(4, modulId);
                            statement.setString(5, Integer.toString(year));

                            statement.executeUpdate();
                        }
                    }
                }
            }
        }

    }
}
