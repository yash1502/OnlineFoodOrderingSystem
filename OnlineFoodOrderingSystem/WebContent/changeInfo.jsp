<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Info</title>
        <!--CSS---->            
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/menuStyle.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <body>
        <!-- Paste this code after body tag -->
        <div class="se-pre-con" style="display: none;"></div>
        <!-- Ends -->
        <header>
            <div class="container">
                <div class="row clearfix" id="home">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="logo">
                            <h1> <a href="index.jsp"><img src="css/TMPS000136.png" alt=""></a> </h1>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <section class="saction1">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="menu">
                            <div class="mobile-nav-container"> </div>
                            <div class="mobile-nav-btn"><img class="nav-open" src="css/nav-open.png" alt="Nav Button Open"> <img class="nav-close" src="css/nav-close.png" alt="Nav Button Close"> </div>
                            <nav>
                                <ul>
                                    <% if ((session.getAttribute("account") == null) || (session.getAttribute("account") == "")) { %>
                                    <li>                                        
                                        <a href="mainlogin.jsp">Login</a>
                                    </li>
                                    <li><a href="reg.jsp">Register</a></li>
                                        <%} else {
                                        %>
                                    <li>
                                        <a>Welcome ${customer.getFName()}</a>
                                    </li>
                                    <li><a href="profile">Profile</a>
                                    </li>
                                    <% } %>
                                    <li>
                                        <% if ((session.getAttribute("account") == null) || (session.getAttribute("account") == "")) { %>
                                        <%} else {
                                        %><a href="logout">Logout</a></li> <% }%>
                                    <li><a href="restaurants">Restaurants</a></li>
                                </ul>
                            </nav>
                            <a href="cart.jsp"><button type="button" class="btn btn-default btn-sm pull-right col-lg-3">
                                    <span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart
                                </button></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <form method="post" action="updateProfile">
            <center>
            <table border="1" width="30%" cellpadding="5">
                <h3>Edit Profile Information</h3>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="newfname" value="${customer.getFName()}" /></td>
                        
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="newlname" value="${customer.getLName()}" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="newemail" value="${account.getEmail()}" /></td>
                    </tr>
                    <tr>
                        <td>Street</td>
                        <td><input type="text" name="newstreet" value="${customer.getStreet()}" /></td>
                    </tr>
                    <tr>
                        <td>State</td>
                        <td><input type="text" name="newstate" value="${customer.getStateLoc()}" /></td>
                    </tr>
                    <tr>
                        <td>Zipcode</td>
                        <td><input type="text" name="newzip" value="${customer.getZip()}" /></td>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <td><input type="text" name="newphone" value="${customer.getPhone()}" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="newpass" value="${account.getPassword()}" required/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>