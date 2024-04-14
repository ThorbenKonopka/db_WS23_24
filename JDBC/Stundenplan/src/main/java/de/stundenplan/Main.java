package de.stundenplan;

import de.stundenplan.tests.Testcase;
import de.stundenplan.tests.inserts.*;
import de.stundenplan.tests.testcases.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Main {
    private final static String URL = "jdbc:mysql://localhost:3306/Stundenplan?verifyServerCertificate=false&useSSL=true&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8";


    public static void main(String[] args) throws SQLException {
        // Treiber wird automatisch initialisiert
        //DriverManager.setLogWriter(new PrintWriter(System.out));

        ConnectionPool.init();

        long before = System.currentTimeMillis();

        List<Testcase> inserts = new ArrayList<>();
        inserts.add(new JahrgangGenerator());
        inserts.add(new SemesterGenerator());
        inserts.add(new VeranstaltungGenerator());
        inserts.add(new StudentGenerator());
        inserts.add(new TerminGenerator());
        inserts.add(new Termin2GruppeGenerator());

        //inserts.forEach(Testcase::executeTest);

        long after = System.currentTimeMillis();


        List<Testcase> testcases = new ArrayList<>();
        testcases.add(new SelectFromStudent());

        testcases.add(new ProcedureStudentExmatrikulieren());
        testcases.add(new DeleteStudentsEinzelnTest());
        testcases.add(new DeleteStudentsZusammenTest());

        testcases.add(new VeranstaltungZuStudentView());
        testcases.add(new VeranstaltungZuStudentJoin());

        testcases.add(new HistorieTest());

        testcases.forEach(Testcase::executeTest);

        ConnectionPool.destroy();

        System.out.println("Die Inserts haben: " + (after-before) + " ms gebraucht");
    }
}