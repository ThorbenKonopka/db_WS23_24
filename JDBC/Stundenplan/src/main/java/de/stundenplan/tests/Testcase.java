package de.stundenplan.tests;

import java.sql.SQLException;

public abstract class Testcase {
    public abstract String getName();
    public void executeTest() {
        System.out.println("Test " + getName() + " Startet...");
        init();
        long before = System.currentTimeMillis();
        try {
            test();
        } catch (SQLException e) {
            System.out.println("Es ist ein Fehler aufgetreten, ;D");
            System.out.println(e.getMessage());
        }
        long after = System.currentTimeMillis();
        System.out.println("Test " + getName() + " ist fertig.");
        System.out.println("Der Test hat: " + (after-before) + " ms gebraucht.\n\n");
    }
    public abstract void test() throws SQLException;

    protected void init() {}
}
