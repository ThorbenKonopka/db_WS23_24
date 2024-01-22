package de.stundenplan.tests.testcases;

import de.stundenplan.ConnectionPool;
import de.stundenplan.tests.Testcase;

import java.sql.Connection;

public class SelectFromStudent extends Testcase {
    @Override
    public void test() {
        System.out.println("INSERT GEHT");
    }

    @Override
    public String getName() {
        return "Testcase Beispiel.";
    }
}
