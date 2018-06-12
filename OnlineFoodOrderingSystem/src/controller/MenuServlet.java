/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Entity.CustomerOrder;
import Util.RestaurantUtil;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Double.parseDouble;
import static java.lang.Integer.parseInt;
import java.text.DecimalFormat;
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
@WebServlet(name = "MenuServlet",
        loadOnStartup = 1,
        urlPatterns = {"/WingStop",
            "/FirehouseSubs",
            "/PandaExpress",
            "/PoblanoBurritos",
            "/firehousesubs",
            "/pandaexpress",
            "/poblanoburritos",
            "/wingstop",
            "/rateRestaurantFirehouse",
            "/rateRestaurantWingStop",
            "/rateRestaurantPoblanos",
            "/rateRestaurantPanda"})
public class MenuServlet extends HttpServlet {
    
    private static DecimalFormat df2 = new DecimalFormat(".##");

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
            out.println("<title>Servlet MenuServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MenuServlet at " + request.getContextPath() + "</h1>");
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
        
        
        String userPath = request.getServletPath();
        HttpSession session = request.getSession();

        if (userPath.equals("/WingStop") || (userPath.equals("/wingstop"))) { //restID = 1
            String page = "menus/wingstop.jsp";

            // access a class called RestaurantUtil
            List menu = RestaurantUtil.getMenu(1);
            double rating = RestaurantUtil.getRating(1);
            session.setAttribute("rating", rating);
            session.setAttribute("menu", menu);

            RequestDispatcher dispatcher = request.getRequestDispatcher(page);
            if (dispatcher != null) {
                dispatcher.forward(request, response);
            }

        } else if (userPath.equals("/FirehouseSubs") || (userPath.equals("/firehousesubs"))) {
            String page = "menus/firehousesubs.jsp";

            // access a class called RestaurantUtil
            List menu = RestaurantUtil.getMenu(2);
            double rating = RestaurantUtil.getRating(2);
            session.setAttribute("rating", rating);
            session.setAttribute("menu", menu);

            RequestDispatcher dispatcher = request.getRequestDispatcher(page);
            if (dispatcher != null) {
                dispatcher.forward(request, response);
            }
        } else if (userPath.equals("/PoblanoBurritos") || (userPath.equals("/poblanoburritos"))) { //restID = 1
            String page = "menus/poblanoburritos.jsp";

            // access a class called RestaurantUtil
            List menu = RestaurantUtil.getMenu(3);
            double rating = RestaurantUtil.getRating(3);
            session.setAttribute("rating", rating);
            session.setAttribute("menu", menu);

            RequestDispatcher dispatcher = request.getRequestDispatcher(page);
            if (dispatcher != null) {
                dispatcher.forward(request, response);
            }
        } else if (userPath.equals("/PandaExpress") || (userPath.equals("/pandaexpress"))) { //restID = 1
            String page = "menus/pandaexpress.jsp";

            // access a class called RestaurantUtil
            List menu = RestaurantUtil.getMenu(4);
            double rating = RestaurantUtil.getRating(4);
            session.setAttribute("rating", rating);
            session.setAttribute("menu", menu);

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

        double currentRating = 0;
        double customerRating = 0;
        

        if (userPath.equals("/rateRestaurantFirehouse")) {
            currentRating = (double) session.getAttribute("rating");
            customerRating = parseDouble(request.getParameter("customerRating"));
            RestaurantUtil.rateRestaurant(customerRating, 2);
            response.sendRedirect("FirehouseSubs");
        } else if (userPath.equals("/rateRestaurantWingStop")) {
            currentRating = (double) session.getAttribute("rating");
            customerRating = parseDouble(request.getParameter("customerRating"));
            RestaurantUtil.rateRestaurant(customerRating, 1);
            response.sendRedirect("WingStop");
        } else if (userPath.equals("/rateRestaurantPoblanos")) {
            currentRating = (double) session.getAttribute("rating");
            customerRating = parseDouble(request.getParameter("customerRating"));
            RestaurantUtil.rateRestaurant(customerRating, 3);
            response.sendRedirect("PoblanoBurritos");
        } else if (userPath.equals("/rateRestaurantPanda")) {
            currentRating = (double) session.getAttribute("rating");
            customerRating = parseDouble(request.getParameter("customerRating"));
            RestaurantUtil.rateRestaurant(customerRating, 4);
            response.sendRedirect("PandaExpress");
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
