package de.stundenplan.tests.testcases;

import de.stundenplan.ConnectionPool;
import de.stundenplan.Table;
import de.stundenplan.tests.Testcase;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class VeranstaltungZuStudentView extends Testcase {
    @Override
    public String getName() {
        return "Alle Veranstaltungen für einen Studenten aus der View";
    }

    @Override
    public void test() throws SQLException {
        Connection connection = ConnectionPool.getConnectionPool().getVerwalterConnection();
        try (Statement statement = connection.createStatement()) {
            Table table = new Table(statement.executeQuery("SELECT SQL_NO_CACHE * FROM verwaltungView;"));
            //table.print(7);
        }
    }
}
