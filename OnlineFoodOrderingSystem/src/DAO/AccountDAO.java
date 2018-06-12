/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Customer;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Yash
 */
public class AccountDAO {
    private int acctId = 0;

    public int check(String username, String password) {

        //Get the connection
        try {

            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/OFOS",
                    "root", "qwerty");
            Statement st = con.createStatement();
        ResultSet rs;
        rs = st.executeQuery("select * from Account where email='" + username + "' and password='" + password + "'");
            if (rs.next()) {
                acctId = rs.getInt("accountID");
                return acctId;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public Customer getCustomer(int acctId) {
        Customer cust = new Customer();
        ResultSet rs = null;
        //Get the connection
        try {

            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/OFOS",
                    "root", "qwerty");
            Statement st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM customer where accountID = " + acctId);
            while (rs.next()) {
                cust.setCustId(((Integer) rs.getInt("custId")));
                cust.setFName(rs.getString("fName"));
                cust.setLName(rs.getString("lName"));
                cust.setStreet(rs.getString("street"));
                cust.setStateLoc(rs.getString("stateLoc"));
                cust.setZip((Integer) rs.getInt("zip"));
                cust.setPhone(rs.getString("phone"));
            }
            return cust;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return cust;
    }
}
