package de.stundenplan.tests.testcases;

import de.stundenplan.ConnectionPool;
import de.stundenplan.Table;
import de.stundenplan.tests.Testcase;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class SelectFromStudent extends Testcase {

    @Override
    public void test() throws SQLException{
        Connection connection = ConnectionPool.getConnectionPool().getRootConnection();

        try (Statement statement = connection.createStatement()) {
            Table table = new Table(statement.executeQuery("SELECT * FROM Student"));
        }
    }

    @Override
    public String getName() {
        return "Alles von Student";
    }
}
