package com.travelink.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public interface DatabaseInfo {
//    public static String DRIVERNAME="com.microsoft.sqlserver.jdbc.SQLServerDriver";
//    public static String DBURL="jdbc:sqlserver://LAPTOP-O852JI22;databaseName=Travelink;encrypt=false;trustServerCertificate=false;loginTimeout=30;";
//    public static String USERDB="sa";
//    public static String PASSDB="admin";
    
 
//    Nguyen: 
    public static String DRIVERNAME="com.microsoft.sqlserver.jdbc.SQLServerDriver";
    public static String DBURL="jdbc:sqlserver://LAPTOP-TUUH19FT;databaseName=Travelink;encrypt=false;trustServerCertificate=false;loginTimeout=30;";
    public static String USERDB="admin";
    public static String PASSDB="admin";

    public static Connection getConnect() {
        try {
            Class.forName(DRIVERNAME);
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
        }
        try {
            Connection con = DriverManager.getConnection(DBURL, USERDB, PASSDB);
            return con;
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }    
}