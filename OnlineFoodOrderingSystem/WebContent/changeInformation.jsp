<%-- 
    Document   : changeInformation
    Created on : Apr 30, 2018, 2:07:56 PM
    Author     : Yash
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<%@ page import="DAO.AccountDAO"%>
<%@ page import="Entity.Customer"%>
<%@ page import="Entity.Account"%>

<%

    String pwd = request.getParameter("newpass");
    String fname = request.getParameter("newfname");
    String lname = request.getParameter("newlname");
    String email = request.getParameter("newemail");
    String street = request.getParameter("newstreet");
    String phone = request.getParameter("newphone");
    String state = request.getParameter("newstate");
    int zip = Integer.parseInt(request.getParameter("newzip"));

    session.setAttribute("fname", fname);
    session.setAttribute("lname", lname);
    session.setAttribute("pass", pwd);
    session.setAttribute("email", email);
    Account user = new Account();
    user = (Account) session.getAttribute("account");
    Customer cust = new Customer();
    cust = (Customer) session.getAttribute("customer");

    Class.forName("com.mysql.jdbc.Driver");

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ofos",
            "root", "qwerty");
    Statement st = con.createStatement();;
    //ResultSet rs;
    int i = st.executeUpdate("update ofos.account SET account.email ='" + email + "', account.password ='" + pwd + "' WHERE account.AccountID ='" + user.getAccountID() + "'");
    int j = st.executeUpdate("update ofos.customer SET customer.fName = '" + fname + "', customer.lName ='" + lname + "', customer.street ='" + street + "', customer.stateLoc ='" + state + "', customer.zip ='" + zip + "', customer.phone ='" + phone + "' WHERE customer.custId ='" + cust.getCustId() + "'");
    AccountDAO dao = new AccountDAO();
    int acctId = dao.check(email, pwd);

    if (acctId > 0) {

        user.setEmail(email);
        user.setAccountID(acctId);
        user.setPassword(pwd);
        session.setAttribute("account", user);
        response.sendRedirect("index.jsp");
        cust = dao.getCustomer(user.getAccountID());
        session.setAttribute("customer", cust);
        if (i > 0) {
            //session.setAttribute("userid", user);
            response.sendRedirect("profile");
            // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
        } else {
            response.sendRedirect("index.jsp");
        }
%>

