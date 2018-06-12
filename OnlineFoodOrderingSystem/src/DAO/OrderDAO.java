/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Restaurant;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.jsp.jstl.sql.Result;
import javax.servlet.jsp.jstl.sql.ResultSupport;

/**
 *
 * @author Yash
 */
public class OrderDAO {

    PreparedStatement ps = null;
    ResultSet rs = null;
    List<Restaurant> restaurantList = new ArrayList();

    // public List<Item> getItemList();
    
    // public double getTotal();
    
    // public 
}
