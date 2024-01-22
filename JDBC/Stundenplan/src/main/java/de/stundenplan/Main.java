package de.stundenplan;

import de.stundenplan.tests.Testcase;
import de.stundenplan.tests.inserts.Insert1;
import de.stundenplan.tests.testcases.SelectFromStudent;

import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Main {
    private final static String URL = "jdbc:mysql://localhost:3306/Stundenplan?verifyServerCertificate=false&useSSL=true&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8";


    public static void main(String[] args) throws SQLException {
        // Treiber wird automatisch initialisiert
        DriverManager.setLogWriter(new PrintWriter(System.out));

        List<Testcase> inserts = new ArrayList<>();
        inserts.add(new Insert1());

        inserts.forEach(Testcase::executeTest);


        List<Testcase> testcases = new ArrayList<>();
        testcases.add(new SelectFromStudent());

        testcases.forEach(Testcase::executeTest);

        ConnectionPool.destroy();
    }

    public static String createSQL() {
        return "SELECT * FROM Student;";
    }
}