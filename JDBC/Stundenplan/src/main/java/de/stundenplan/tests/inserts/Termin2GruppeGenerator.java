package de.stundenplan.tests.inserts;

import de.stundenplan.ConnectionPool;
import de.stundenplan.tests.Testcase;

import java.sql.Connection;
import java.sql.SQLException;

public class Termin2GruppeGenerator extends Testcase {
    @Override
    public String getName() {
        return "Termin To Gruppe Generator";
    }

    @Override
    public void test() throws SQLException {
        Connection connection = ConnectionPool.getConnectionPool().getRootConnection();

    }
}
