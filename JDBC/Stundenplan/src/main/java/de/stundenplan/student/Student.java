package de.stundenplan.student;

public class Student {
    private final int matrikkelnummer;
    private String name;
    private String vorname;
    private String gruppe;
    private int jahrgang;

    protected Student(int matrikkelnummer, String name, String vorname, String gruppe, int jahrgang) {
        this.matrikkelnummer = matrikkelnummer;
        this.name = name;
        this.vorname = vorname;
        this.gruppe = gruppe;
        this.jahrgang = jahrgang;
    }
}