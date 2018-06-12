<!DOCTYPE html>

<html style="" class=" js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface no-generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Order Food Online</title>
        <link href="css/css" rel="stylesheet" type="text/css">
        <link href="css/css(1)" rel="stylesheet" type="text/css">

        <!--MOBILE DEVICE-->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <!--CSS---->            
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/menuStyle.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <!--JS-->

        <script type="text/javascript" src="css/jquery-1.11.3.min.js.download"></script>
        <script type="text/javascript" src="css/modernizr.js.download"></script>
        <script src="css/scripts.js.download"></script>
        <script src="css/waypoints.min.js.download"></script>
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
        <section class="backgraound">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="back">
                            <div class="line1 os-animation animated rotateInDownLeft" data-os-animation="rotateInDownLeft" data-os-animation-delay="1s" style="animation-delay: 1s;"> </div>
                            <div class="line2 os-animation animated rotateInDownLeft" data-os-animation="rotateInDownLeft" data-os-animation-delay="1s" style="animation-delay: 1s;"> </div>
                            <h2 class="os-animation animated zoomIn" data-os-animation="zoomIn" data-os-animation-delay="0.50s" style="animation-delay: 0.5s;">Network of Restaurants</h2>
                            <h3 class="os-animation animated zoomIn" data-os-animation="zoomIn" data-os-animation-delay="1s" style="animation-delay: 1s;">To Order Online</h3>
                            <div class="line3 os-animation animated rotateInDownRight" data-os-animation="rotateInDownRight" data-os-animation-delay="1s" style="animation-delay: 1s;"> </div>
                            <div class="line4 os-animation animated rotateInDownRight" data-os-animation="rotateInDownRight" data-os-animation-delay="1s" style="animation-delay: 1s;"> </div>
                        </div>
                    </div>
                </div>

                <form class="example" action="SearchServlet" method="post">
                    <input type="text" id="myInput" placeholder="Search.." name="search"/>
                    <button type="submit">Search<i class="fa fa-search"></i></button>
                </form>
            </div>

        </section>

        <footer class="saction8">
            <div class="container" id="contact">
                <div class="row">

                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <div class="follow">
                            <h3>Follow Us On...</h3>
                        </div>
                        <div class="social">
                            <ul>
                                <li> <i class="fa fa-facebook-square"></i><a href="https://www.facebook.com/mrdeliveryusa">Facebook</a></li>
                                <li><i class="fa fa-twitter-square"></i><a href="https://twitter.com/mrdelivery">Twitter</a></li>
                                <li><i class="fa fa-linkedin-square"></i><a href="https://www.linkedin.com/company/mr-delivery-usa/">Linkedin</a></li>

                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </footer>

        <script type="text/javascript" src="css/sidemenu.js.download"></script>


    </body></html>