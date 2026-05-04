package com.portfolio.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// Simple Database Connection Class
public class DBConnection {
    
    // Database Configuration (read from environment variables with sensible defaults)
    private static final String DB_URL = System.getenv("DB_URL") != null ? System.getenv("DB_URL") : "jdbc:mysql://localhost:3306/portfolio_db";
    private static final String DB_USER = System.getenv("DB_USER") != null ? System.getenv("DB_USER") : "root";
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD") != null ? System.getenv("DB_PASSWORD") : ""; // Set via env in production
    private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
    
    // Static block to load JDBC driver
    static {
        try {
            Class.forName(DB_DRIVER);
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC Driver not found!");
            e.printStackTrace();
        }
    }
    
    // Get Database Connection
    public static Connection getConnection() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            System.out.println("✓ Database Connected Successfully! URL=" + DB_URL);
        } catch (SQLException e) {
            System.out.println("✗ Database Connection Failed! URL=" + DB_URL);
            e.printStackTrace();
        }
        return conn;
    }
    
    // Close Connection (use in finally block)
    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
                System.out.println("✓ Connection Closed");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
