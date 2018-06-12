/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Yash
 */
public class SearchDAO {
    //    HttpSession session = request.getSession();
//    String find = request.getParameter("gotcha");
       public boolean check(String find) {

        //Get the connection
       
//       String firstLetter = String.valueOf(find.charAt(0));
        try {

            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SearchDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/OFOS",
                    "root", "qwerty");
        Statement st = con.createStatement();
        ResultSet rs;
        
       rs = st.executeQuery("select * from restaurant where name='" + find + "' ");
//     rs = st.executeQuery("select * from restaurant where name like '"+firstLetter+"'%");
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SearchDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
}
