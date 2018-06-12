/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.AccountDAO;
import Entity.Account;
import Entity.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile", "/updateProfile"})
public class ProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet ProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileServlet at " + request.getContextPath() + "</h1>");
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

        if (userPath.equals("/profile")) {
            AccountDAO dao = new AccountDAO();

            request.getRequestDispatcher("/profile.jsp").forward(request, response);
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

        if (userPath.equals("/updateProfile")) {
            String pwd = request.getParameter("newpass");
            String fname = request.getParameter("newfname");
            String lname = request.getParameter("newlname");
            String email = request.getParameter("newemail");
            String street = request.getParameter("newstreet");
            String phone = request.getParameter("newphone");
            String state = request.getParameter("newstate");
            int zip = Integer.parseInt(request.getParameter("newzip"));
            HttpSession session = request.getSession();

            Account user = new Account();
            user = (Account) session.getAttribute("account");
            Customer cust = new Customer();
            cust = (Customer) session.getAttribute("customer");
            int custId = cust.getCustId();

            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            Connection con = null;
            try {
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ofos",
                        "root", "qwerty");
            } catch (SQLException ex) {
                Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            Statement st = null;
            try {
                st = con.createStatement();
            } catch (SQLException ex) {
                Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            //ResultSet rs;
            int i = 0;
            try {
                i = st.executeUpdate("update ofos.account SET account.email ='" + email + "', account.password ='" + pwd + "' WHERE account.AccountID ='" + user.getAccountID() + "'");
            } catch (SQLException ex) {
                Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                int j = st.executeUpdate("update ofos.customer SET customer.fName = '" + fname + "', customer.lName ='" + lname + "', customer.street ='" + street + "', customer.stateLoc ='" + state + "', customer.zip ='" + zip + "', customer.phone ='" + phone + "' WHERE customer.custId ='" + custId + "'");
            } catch (SQLException ex) {
                Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            AccountDAO dao = new AccountDAO();
            int acctId = dao.check(email, pwd);

            if (acctId > 0) {

                user.setEmail(email);
                user.setAccountID(acctId);
                user.setPassword(pwd);
                session.setAttribute("account", user);

                cust = dao.getCustomer(user.getAccountID());
                session.setAttribute("customer", cust);
                if (i > 0) {
                    String page = "profile.jsp";
               RequestDispatcher dispatcher = request.getRequestDispatcher(page);
            if (dispatcher != null) {
                dispatcher.forward(request, response);
                    // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
                } else {
                    response.sendRedirect("index.jsp");
                }
            }
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
