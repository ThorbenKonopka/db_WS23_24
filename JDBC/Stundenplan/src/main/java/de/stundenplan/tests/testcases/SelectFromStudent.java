package de.stundenplan.tests.testcases;

import de.stundenplan.ConnectionPool;
import de.stundenplan.tests.Testcase;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SelectFromStudent extends Testcase {

    @Override
    public void test() throws SQLException{
        Connection connection = ConnectionPool.getConnectionPool().getRootConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM Student");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        System.out.println("INSERT GEHT");
    }

    @Override
    public String getName() {
        return "Testcase Beispiel.";
    }
}
