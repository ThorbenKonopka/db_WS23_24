package de.stundenplan.tests.testcases;

import de.stundenplan.ConnectionPool;
import de.stundenplan.tests.Testcase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

public class HistorieTest extends Testcase {
    @Override
    public String getName() {
        return "Historie Test";
    }

    @Override
    public void test() throws SQLException {
        Connection con = ConnectionPool.getConnectionPool().getRootConnection();
        int anzahlVertretungen = 20;
        Random random = new Random();


        int maxDozentId = 4;
        int maxTerminId = 1000;

        for (int i = 0; i < anzahlVertretungen; i++) {
            int zufaelligerDozent = 1 + random.nextInt(maxDozentId);
            int zufaelligerTermin = 1 + random.nextInt(maxTerminId);

            String sql = "INSERT INTO vertretenderDozent (dozentId, terminId) VALUES (?, ?)";
            try(PreparedStatement statement = con.prepareStatement(sql)) {

                statement.setInt(1, zufaelligerDozent);
                statement.setInt(2, zufaelligerTermin);

                statement.executeUpdate();
            }
        }
    }
}
