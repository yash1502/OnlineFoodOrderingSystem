<%-- 
    Document   : wing stop
    Created on : Apr 13, 2018, 4:10:49 PM
    Author     : Yash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Poblano Burritos</title>

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

        <!--        Navbar-->
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

        <h1>Welcome to Poblano Burritos!</h1>
        <h2>Menu</h2>
        <h3>Rating: ${rating}/5</h3>
        <form class="" action="<c:url value="rateRestaurantPoblanos"/>" method="post">
            <select name="customerRating">
                <option selected="selected" value="0">Select Rating</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
                <input class="btn btn-primary"
                   type="submit"
                   name="submit"
                   value="Rate">
        </form>
        <table class="menuList">
            <tr>
                <th class="col-md-2">Item</th>
                <th class="col-md-1">Price</th>
                <th class="col-md-3">Description</th>
            </tr>
            <c:forEach items="${menu}" var="item" varStatus="status">
                <tr class="${((status.index % 2) == 0) ? 'lightBlue' : 'white'}">
                    <td>${item.getItemName()}</td>
                    <td>$${item.getPrice()}</td>
                    <td>${item.getDescription()}</td>
                    <!-- Button trigger modal -->
                    <td>
                        <button type="button" class="btn btn-primary menuItem" data-toggle="modal" data-target="#menuModal${status.index}">
                            Add to Cart
                        </button>
                    </td>

                    <!-- Modal -->
                <div class="modal fade" id="menuModal${status.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Add to Cart</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form class ="btn btn-secondary" action="<c:url value="addToCart"/>" method="post">
                                    <label for="quantity">Quantity</label>
                                    <input class="form-control"
                                           type="text"
                                           value="1"
                                           name="quantity"
                                           id="quantity">
                                    <label for="customization">Customization:</label>
                                    <input class="form-control"
                                           type="text"
                                           name="customization">
                                    <input type="hidden"
                                           name="itemId"
                                           value="${status.count}">
                                    <input class="btn btn-primary"
                                           type="submit"
                                           name="submit"
                                           value="Add to Cart">
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
