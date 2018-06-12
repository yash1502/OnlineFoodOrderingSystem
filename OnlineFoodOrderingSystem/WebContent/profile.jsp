<%-- 
    Document   : profile
    Created on : Apr 30, 2018, 2:13:31 PM
    Author     : Yash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>

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
        <h2>Profile</h2>
        <div>First Name: ${customer.getFName()}<br/>
             Last Name: ${customer.getLName()}<br/>
             Street: ${customer.getStreet()}<br/>
             State: ${customer.getStateLoc()}<br/>
             Zip code: ${customer.getZip()}<br/>
             Phone: ${customer.getPhone()}<br/> 
        </div>
        
        <a class="btn btn-primary" href="changeInfo.jsp" role="button">Change Information</a>
    </body>
</html>
