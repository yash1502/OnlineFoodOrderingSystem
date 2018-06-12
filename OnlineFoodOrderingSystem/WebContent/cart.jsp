<%-- 
    Document   : cart
    Created on : Apr 18, 2018, 2:04:34 PM
    Author     : Yash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
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
        <!-- header -->
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

        <!--Navbar-->
        <section class="saction1">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="menu">
                            <div class="mobile-nav-container"> </div>
                            <div class="mobile-nav-btn"><img class="nav-open" src="css/nav-open.png" alt="Nav Button Open"> <img class="nav-close" src="css/nav-close.png" alt="Nav Button Close"> </div>
                            <nav>
                                <ul>
                                    <li><a href="index.jsp">Home</a></li>
                                        <% if ((session.getAttribute("account") == null) || (session.getAttribute("account") == "")) { %>
                                    <li>                                        
                                        <a href="mainlogin.jsp">Login</a>
                                    </li>
                                    <li><a href="reg.jsp">Register</a></li>
                                        <%} else {
                                        %>
                                        <% } %>
                                    <li>
                                        <% if ((session.getAttribute("account") == null) || (session.getAttribute("account") == "")) { %>
                                        <%} else {
                                        %><a href="logout">Logout</a></li> <% }%>
                                    <li><a href="restaurants">Restaurants</a></li>
                                </ul>
                        </div>       
                    </div>
                </div>
            </div>
        </section>
        <h2>Cart</h2>
        <table class="cartList">
            <tr>
                <th class="col-md-2 h4">Item</th>
                <th class="col-md-1 h4">Price</th>
                <th class="col-md-1 h4">Quantity</th>
                <th></th>
            </tr>
        <c:set var="total" value="${0}"/>
        <c:forEach items="${cart}" var="item" varStatus="status">
            <tr class="${((status.index % 2) == 0) ? 'lightBlue' : 'white'}  ">
                <td>${item.getItem().getItemName()} </td>
                <td>$${item.getItem().getPrice()}</td>
                <td>${item.getQuantity()}</td>
                <td><form class="" action="<c:url value="removeFromCart"/>">
                        <input type="hidden"
                               name="itemId"
                               value="${status.count}">
                        <input class="btn btn-primary menuItem"
                               type="submit"
                               name="submit"
                               value="Remove From Cart">
                    </form></td>
            </tr>
            <c:set var="total" value="${total + item.getItem().getPrice() * item.getQuantity()}" />
        </c:forEach>
        </table>
        <div>
                Total: $${total}
        </div>
    
         <form action="${initParam['posturl']}" method="post">
            <input type="hidden" name="upload" value="1"/>
            <input type="hidden" name="return" value="${initParam['returnurl']}"/>
            <input type="hidden" name="cmd" value="_cart"/>
            <input type="hidden" name="business" value="${initParam['business']}"/>

            <input type="hidden" name="item_name_1" value="product 1"/>
            <input type="hidden" name="amount_1" value="${total}"/>
            <input type="hidden" name="quantity_1" value="1"/>
            <input class="btn btn-primary" type="submit" value="Place Order"/>
        </form>
        <a class="btn btn-default" href="clearCart">Clear cart</a>   

      
    </body>
</html>
