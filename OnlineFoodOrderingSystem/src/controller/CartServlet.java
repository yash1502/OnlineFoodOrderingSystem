/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Entity.Account;
import Entity.CustomerOrder;
import Entity.Item;
import Entity.OrderItem;
import Util.CartUtil;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Yash
 */
@WebServlet(name = "Cart",
            loadOnStartup = 1,
            urlPatterns = {"/addToCart",
                           "/viewCart",
                           "/removeFromCart",
                           "/clearCart",
                           "/placeOrder"})
public class CartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet cartServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cartServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String userPath = request.getServletPath();
        HttpSession session = request.getSession();
        List<OrderItem> cart = (List) session.getAttribute("cart");
        List menu = (List) session.getAttribute("menu");
        
        if (userPath.equals("/clearCart")) {
            
            if (cart == null) {
                System.out.println("No cart Exists");
            } else {
                cart.clear();
            }
            String page = "cart.jsp";
               RequestDispatcher dispatcher = request.getRequestDispatcher(page);
            if (dispatcher != null) {
                dispatcher.forward(request, response);
            }            
        } else if (userPath.equals("/removeFromCart")) {
            int itemID =  parseInt(request.getParameter("itemId"));
            OrderItem item = cart.get(itemID-1);
            if (cart == null) {
                System.out.println("No cart Exists");
            } else {
                cart.remove(item);
                
            }
            String page = "cart.jsp";
               RequestDispatcher dispatcher = request.getRequestDispatcher(page);
            if (dispatcher != null) {
                dispatcher.forward(request, response);
            } 
        }
        
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userPath = request.getServletPath();
        HttpSession session = request.getSession();
        List<OrderItem> cart = (List) session.getAttribute("cart");
        List menu = (List) session.getAttribute("menu");
        Account user = (Account) session.getAttribute("account");
        
        if (userPath.equals("/addToCart")) {

            // if user is adding item to cart for first time
            // create cart object and attach it to user session
            if (cart == null) {

                cart = new ArrayList();
                session.setAttribute("cart", cart);
            }

            // get user input from request
            int itemID = parseInt(request.getParameter("itemId"));
            int quantity = parseInt(request.getParameter("quantity"));
            String customization = request.getParameter("customization");

            Item newItem = (Item) menu.get(itemID-1);
            OrderItem newerItem = new OrderItem();
            newerItem.setItem(newItem);
            newerItem.setQuantity(quantity);
            newerItem.setCustomization(customization);
            cart.add(newerItem);
            session.setAttribute("cart", cart);
            
            String page = "cart.jsp";
               RequestDispatcher dispatcher = request.getRequestDispatcher(page);
            if (dispatcher != null) {
                dispatcher.forward(request, response);
            }

        } else if (userPath.equals("/placeOrder")) {
            CartUtil.placeOrder(user.getEmail());
            String page = "https://www.sandbox.paypal.com/cgi-bin/webscr";
               RequestDispatcher dispatcher = request.getRequestDispatcher(page);
            if (dispatcher != null) {
                dispatcher.forward(request, response);
        }

    }
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
