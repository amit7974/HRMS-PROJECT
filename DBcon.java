package com.db.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class DBcon {
    private Connection con;
    @Value("${db.driverClassName}")
    public String JDBC_DRIVER;
    @Value("${db.url}")
    public String DB_URL;

    @Value("${db.username}")
    public String USER;
    @Value("${db.password}")
    public String PASS;
    
    public Connection getCon() {
        try {
            Class.forName(JDBC_DRIVER);
            con=DriverManager.getConnection(DB_URL,USER,PASS);
        }catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        } 
        return con;
    }
  
}
