/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import DAO.RestaurantDAO;
import Entity.Item;
import java.util.*;

/**
 *
 * @author Yash
 */
public class RestaurantUtil {
    
    public static List<Item> getMenu(int restID) {
        List<Item> menu = new ArrayList();
        RestaurantDAO dao = new RestaurantDAO();
        menu =dao.getMenu(restID);

        return menu;
    }
    
    public static double getRating(int restID) {
        double rating = 0;
        RestaurantDAO dao = new RestaurantDAO();
        rating = dao.getRating(restID);
        return rating;
    }
    
    public static void rateRestaurant(double rating, int restID) {
        RestaurantDAO dao = new RestaurantDAO();
        dao.rateRestaurant(rating, restID);
        
    }
    
}
