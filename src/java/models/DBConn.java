/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author End User
 */
public class DBConn {
    private static String host = "10.73.32.200";
    private static int netTime = 2000;
    private static String user = "root";
    private static String pass = "qwerty";
    private static String database = "emedica";
    private static String dbUrl = "jdbc:mysql://" + getHost() + "/" + getDatabase();
    private static int port_rmi = 1098;

    public static String getHost() {
        return host;
    }

    public static int getNetTime() {
        return netTime;
    }

    public static String getUser() {
        return user;
    }

    public static String getDatabase() {
        return database;
    }

    public static int getPort_rmi() {
        return port_rmi;
    }
    public Connection getConn() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(this.dbUrl, getUser(), this.pass);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
