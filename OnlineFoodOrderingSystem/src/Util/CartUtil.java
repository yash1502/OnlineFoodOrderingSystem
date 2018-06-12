/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import Entity.CustomerOrder;
import Entity.Item;
import Entity.OrderItem;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;

/**
 *
 * @author Yash
 */
public class CartUtil {

    private CustomerOrder cart = new CustomerOrder();

    public void addToCart(OrderItem item) {
        cart.addItem(item);
    }

    public void removeFromCart(OrderItem item) {
        cart.removeItem(item);
    }

    public void clearCart() {
        cart.clearOrder();
    }

    public static void placeOrder(String userEmail) {
        /**
         * Outgoing Mail (SMTP) Server requires TLS or SSL: smtp.gmail.com (use
         * authentication) Use Authentication: Yes Port for TLS/STARTTLS: 587
         */
        final String fromEmail = "tjhill@ilstu.edu"; //requires valid gmail id
        final String password = "your pw here"; // correct password for gmail id
        final String toEmail = "tjomhill@yahoo.com"; // can be any email id 

        System.out.println("TLSEmail Start");
        Properties props = new Properties();
        props.put("mail.smtp.host", "outlook.office365.com"); //SMTP Host
        props.put("mail.smtp.port", "587"); //TLS Port
        props.put("mail.smtp.auth", "true"); //enable authentication
        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS

        //create Authenticator object to pass in Session.getInstance argument
        Authenticator auth = new Authenticator() {
            //override the getPasswordAuthentication method
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };

        Session session = Session.getInstance(props, auth);

        Email.sendEmail(session, userEmail, "Order Placed", "Your order with OFOS has been placed!");
    }

}
