package de.stundenplan;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class Main {
    private final static String URL = "jdbc:mysql://localhost:3306/Stundenplan?verifyServerCertificate=false&useSSL=true&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8";


    public static void main(String[] args) throws SQLException {
        // Treiber wird automatisch initialisiert
        DriverManager.setLogWriter(new PrintWriter(System.out));
        try (Connection con = DriverManager.getConnection(URL, "stundenplan", getPasswordForStundenplanUser())) {
            System.out.println("----------SQL----------");
            try (Statement statement = con.createStatement()) {
                ResultSet resultSet = statement.executeQuery(createSQL());

                int matrikelnummer;
                String name;
                String vorname;
                int jahrgang;
                String gruppe;

                while (resultSet.next()) {
                    matrikelnummer = resultSet.getInt("matrikelnummer");
                    name = resultSet.getString("name");
                    vorname = resultSet.getString("vorname");
                    jahrgang = resultSet.getInt("jahrgang");
                    gruppe = resultSet.getString("gruppe");
                    System.out.println(matrikelnummer + ", " + name + ", " + vorname + ", " + jahrgang + ", " + gruppe);
                }

            }
        }
    }

    public static String createSQL() {
        return "SELECT * FROM Student;";
    }

    private static String getPasswordForStundenplanUser() {
        File passwordFile = getPasswordFileForStundenplanUser();

        try (FileInputStream fileInputStream = new FileInputStream(passwordFile)) {
            return new String(fileInputStream.readAllBytes());
        } catch (IOException e) {
            throw new RuntimeException();
        }
    }

    private static File getPasswordFileForStundenplanUser() {
        return new File(getAbsolutPathOfRootProject() + "/DB/mysql/passwords/stundenplan.txt");
    }

    private static String getAbsolutPathOfRootProject() {
        return getRootProjectFile().getParentFile().getParentFile().getAbsolutePath();
    }

    private static File getRootProjectFile() {
        File file = new File("");
        return new File(file.getAbsolutePath());
    }
}