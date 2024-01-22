package de.stundenplan.tests.testcases;

import de.stundenplan.ConnectionPool;
import de.stundenplan.tests.Testcase;

import java.sql.Connection;
import java.sql.SQLException;

public class TrageAnwesenheitEinTest extends Testcase {
    @Override
    public String getName() {
        return "Trage Anwesenheit Ein Procedure Test";
    }

    @Override
    public void test() throws SQLException {
        Connection connection = ConnectionPool.getConnectionPool().getVerwalterConnection();

        String string = "CALL trageAnwesenheitEin();";
    }
}
