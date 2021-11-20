package com.example.pollsystemproject.db;


import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

public class DBConnection {
    public static String ReadPropertisFile(String p){
        try{
            FileInputStream fis = new FileInputStream("/Users/liuhe/IdeaProjects/soen387-asg1-poll-system2/src/main/resources/database.properties");
            Properties prop = new Properties();
            prop.load(fis);

            return prop.getProperty(p);

        }catch (IOException e){
            e.printStackTrace();
        }
        return "";
    }

    // JDBC driver name and database URL
    static final String JDBC_DRIVER = ReadPropertisFile("jdbc_driver");

    static final String DB_URL = ReadPropertisFile("db_url");
    static final String DB_NAME = ReadPropertisFile("db_name");
    static final String DB_POLL_NAME = ReadPropertisFile("db_poll_name");
    // Database credentials
    static final String DB_USER = ReadPropertisFile("db_username");
    static final String DB_PASSWORD = ReadPropertisFile("db_password");


    static Connection conn = null;
    public static Connection getConnection() {

        try{
            //Register JDBC driver
            Class.forName(JDBC_DRIVER);
            //Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL+DB_NAME,DB_USER,DB_PASSWORD);
            return conn;
        } catch (SQLException e){
            throw new RuntimeException("Error connecting to database",e);
        } catch (ClassNotFoundException e){
            throw new RuntimeException("Error Class Not Found",e);
        }


    }
    public static Connection getPollConnection() {

        try{
            //Register JDBC driver
            Class.forName(JDBC_DRIVER);
            //Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL+DB_POLL_NAME,DB_USER,DB_PASSWORD);
            return conn;
        } catch (SQLException e){
            throw new RuntimeException("Error connecting to database",e);
        } catch (ClassNotFoundException e){
            throw new RuntimeException("Error Class Not Found",e);
        }


    }
    public static void closeConnection() throws SQLException{
        //Close connection
        if(conn!=null) conn.close();
    }



}
