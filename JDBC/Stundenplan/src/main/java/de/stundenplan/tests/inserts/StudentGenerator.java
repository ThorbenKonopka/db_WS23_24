package de.stundenplan.tests.inserts;

import de.stundenplan.ConnectionPool;
import de.stundenplan.tests.Testcase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentGenerator extends Testcase {

    @Override
    public String getName() {
        return "StudentGenerator";
    }

    @Override
    public void test() throws SQLException {
        Connection  con = ConnectionPool.getConnectionPool().getRootConnection();
        int startjahr = 2025;
        int jahre = 50;
        int matrikelnummer = 6;

        for (int i = 0; i < jahre; i++) {
            int jahrgang = startjahr + i;

            for (int j = 0; j < 20; j++) {
                String vorname = "StudentVN" + matrikelnummer;
                String nachname = "StudentNN" + matrikelnummer;
                String gruppe = matrikelnummer % 2 == 0 ? "A-F" : "G-L";

                String sql = "INSERT INTO Student (matrikelnummer, name, vorname, jahrgang, gruppe) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement statement = con.prepareStatement(sql)) {

                    statement.setInt(1, matrikelnummer);
                    statement.setString(2, nachname);
                    statement.setString(3, vorname);
                    statement.setInt(4, jahrgang);
                    statement.setString(5, gruppe);

                    statement.executeUpdate();
                }

                matrikelnummer++;
            }
        }

    }
}
