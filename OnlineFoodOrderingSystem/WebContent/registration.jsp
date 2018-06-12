<%@page import="Util.Email"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>

<%@ page import ="java.sql.*" %>
<%
    String fname = request.getParameter("fname");
    String pwd = request.getParameter("pass");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String street = request.getParameter("street");
    String state = request.getParameter("state");
    String zip = request.getParameter("zip");
    String phone = request.getParameter("phone");
    
    int AccountId;
    int custId;

    session.setAttribute("fname", fname);
    session.setAttribute("lname", lname);
    session.setAttribute("pass", pwd);
    session.setAttribute("email", email);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/OFOS",
            "root", "qwerty");
    Statement st = con.createStatement();

    int i = st.executeUpdate("insert into ofos.account(email, password, acctType) values ('" + email + "', '" + pwd + "','0')", st.RETURN_GENERATED_KEYS);
    ResultSet rs = st.getGeneratedKeys();
    if (rs.next()) {
        AccountId = rs.getInt(1);
    } else {
        AccountId = rs.getInt(1);
    }

    int j = st.executeUpdate("insert into ofos.customer(fName, lName, AccountID, street, stateLoc, zip, phone) values ('" + fname + "','" + lname + "','" + AccountId + "','" + street + "','" + state + "','" + zip + "','" + phone + "')", st.RETURN_GENERATED_KEYS);
    rs = st.getGeneratedKeys();
    if (rs.next()) {
        custId = rs.getInt(1);
    } else {
        custId = rs.getInt(1);
    }
    if (i > 0) {
         String to = email;

        // Sender's email ID needs to be mentioned
        String from = "yneema@ilstu.edu";
        
        // Assuming you are sending email from this host
        String host = "outlook.office365.com";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.setProperty("mail.smtp.host", host);
        properties.setProperty("mail.smtp.starttls.enable", "true");
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.port", "587");
        // Get the default Session object.
        Session sess = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("yneema@ilstu.edu", "Your Password");
            }
        });

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(sess);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("Congratulations!");

            // Send the actual HTML message, as big as you like
            message.setContent("<h1> Hi '"+fname+"'You have been successfully registered to Online food ordering system!!!!</h1>",
                    "text/html");

            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
        //session.setAttribute("userid", user);
        session.setAttribute("AccountId", AccountId);
        session.setAttribute("custId", custId);
        response.sendRedirect("mainlogin.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("index.jsp");
    }
%>
