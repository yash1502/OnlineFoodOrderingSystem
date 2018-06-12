<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>
        <!--CSS---->            
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/menuStyle.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <style>
            body {font-family: Arial, Helvetica, sans-serif;}
            form {border: 3px solid #f1f1f1;}

            input[type=text], input[type=password] {
                width: 30%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }

            button {
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 30%;
            }

            button:hover {
                opacity: 0.8;
            }

            .cancelbtn {
                width: auto;
                padding: 10px 18px;
                background-color: #f44336;
            }

            .imgcontainer {
                text-align: center;
                margin: 5px 0 12px 0;
                height:"2"; 
                width: "";
            }

            img.avatar {
                width: 10%;
                border-radius: 10%;
            }

            span.psw {
                float: right;
                padding-top: 16px;
            }

            /* Change styles for span and cancel button on extra small screens */
            @media screen and (max-width: 300px) {
                span.psw {
                    display: block;
                    float: none;
                }
                .cancelbtn {
                    width: 100%;
                }
            }
        </style>
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
        <h2>Login Form</h2>

    <center><form method="post" action="login">
            <div class="imgcontainer">
                <img src="images/images.jpg" alt="Avatar" class="avatar">
            </div>
            <div class="container">
                <label for="uname"><b>Email</b></label><br/>
                <input type="text" placeholder="Enter Username" name="username" required><br/>

                <label for="psw"><b>Password</b></label><br/>
                <input type="password" placeholder="Enter Password" name="pass" required><br/>

                <button type="submit">Login</button>
            </div>    

            <div class="container" style="background-color:#f1f1f1">

                <span class="psw">Yet Not <a href="reg.jsp">Registered?</a></span>
                Forgot Password? <a href="forget.jsp">Retrieve here</a>
            </div>
        </form></center>

</body>
</html>






