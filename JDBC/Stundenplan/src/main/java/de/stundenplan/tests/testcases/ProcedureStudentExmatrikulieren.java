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
        Connection connection = ConnectionPool.getConnectionPool().getRootConnection();
        StringBuilder sb = new StringBuilder("INSERT INTO Student (matrikelnummer, name, vorname, jahrgang, gruppe) \n");
        sb.append("VALUES ");
        for (int i = 100100; i < 100200; i++) {
            sb.append("(" + i + ", 'NAME', 'VORNAME', 23, 'G-L'), \n");
        }
        sb.deleteCharAt(sb.length() - 3);
        sb.deleteCharAt(sb.length() - 1);
        sb.deleteCharAt(sb.length() - 1);
        sb.append(";");
        try (Statement statement = connection.createStatement()) {
            statement.execute(sb.toString());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void test() throws SQLException {
        Connection connection = ConnectionPool.getConnectionPool().getVerwalterConnection();

        try (Statement statement = connection.createStatement()) {
            for(int i = 100100; i < 100200; i++) {
                statement.execute("CALL studentExmatrikulieren(" + i + ");");
            }
        }
    }
}
