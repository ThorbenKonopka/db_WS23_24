package de.stundenplan.tests.inserts;

import de.stundenplan.ConnectionPool;
import de.stundenplan.tests.Testcase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

// testet gleichzeitig den HistorieTrigger mit, aber nur für "Vertretung"
public class vertretenderDozentGenerator extends Testcase {
    @Override
    public String getName() {
        return "vertretenderDozentGenerator";
    }

    @Override
    public void test() throws SQLException {
        Connection con = ConnectionPool.getConnectionPool().getRootConnection();
        int anzahlVertretungen = 20;
        Random random = new Random();

        try {
            int maxDozentId = 4;
            int maxTerminId = 1000;

            for (int i = 0; i < anzahlVertretungen; i++) {
                int zufaelligerDozent = 1 + random.nextInt(maxDozentId);
                int zufaelligerTermin = 1 + random.nextInt(maxTerminId);

                String sql = "INSERT INTO vertretenderDozent (dozentId, terminId) VALUES (?, ?)";
                PreparedStatement statement = con.prepareStatement(sql);

                statement.setInt(1, zufaelligerDozent);
                statement.setInt(2, zufaelligerTermin);

                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            System.out.println("vertretenderDozent befüllt");
        }
    }
}

