package de.stundenplan.tests.testcases;

import de.stundenplan.ConnectionPool;
import de.stundenplan.tests.Testcase;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class ProcedureStudentExmatrikulieren extends Testcase {
    @Override
    public String getName() {
        return "Procedure StudentExmatrikulieren";
    }

    @Override
    public void init() {
        System.out.println("INIT");
    }

    @Override
    public void test() throws SQLException {
        Connection connection = ConnectionPool.getConnectionPool().getVerwalterConnection();

        try (Statement statement = connection.createStatement()) {
            statement.execute("CALL studentExmatrikulieren(-1);");
        }
    }
}
