package de.stundenplan.tests;

public abstract class Testcase {
    public abstract String getName();
    public void executeTest() {
        System.out.println("Test " + getName() + " Startet...");
        long before = System.currentTimeMillis();
        test();
        long after = System.currentTimeMillis();
        System.out.println("Test " + getName() + " ist fertig.");
        System.out.println("Der Test hat: " + (after-before) + " ms gebraucht.\n\n");
    }
    public abstract void test();
}
