package de.stundenplan.tests.testcases;

import de.stundenplan.ConnectionPool;
import de.stundenplan.Table;
import de.stundenplan.tests.Testcase;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class VeranstaltungZuStudentJoin extends Testcase {

    @Override
    public String getName() {
        return "Alle Veranstaltungen für einen Studenten mit Join";
    }

    @Override
    public void test() throws SQLException {
        Connection connection = ConnectionPool.getConnectionPool().getRootConnection();
        try (Statement statement = connection.createStatement()) {
            Table table = new Table(statement.executeQuery("SELECT SQL_NO_CACHE student.name, student.vorname, student.matrikelnummer, student.jahrgang, student.gruppe, modul.name, veranstaltung.typ FROM Student student " +
                                    "LEFT JOIN BelegteVeranstaltung bv ON bv.matrikelnummer = student.matrikelnummer "+
                                    "LEFT JOIN Veranstaltung veranstaltung ON veranstaltung.veranstaltungid = bv.veranstaltungid " +
                                    "LEFT JOIN Modul modul ON modul.modulId = veranstaltung.modulId;"));
            //table.print(7);
        }
    }
}
