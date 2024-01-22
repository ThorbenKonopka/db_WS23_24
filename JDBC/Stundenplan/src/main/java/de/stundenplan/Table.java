package de.stundenplan;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Table {
    private final ResultSet resultSet;

    public Table(ResultSet resultSet) {
        this.resultSet = resultSet;
    }

    public void print(int columnMax) throws SQLException {
        //int counter = 0;
        while (resultSet.next()/* && counter < 20*/) {
            try {
                for(int i = 1; i <= columnMax; i++) {
                    System.out.print(resultSet.getString(i) + " ");
                }
            } catch (Error | SQLException e) {
                continue;
            }
            System.out.println();
            //counter++;
        }
    }
}
