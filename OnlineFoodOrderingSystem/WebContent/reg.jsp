<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
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
        * {box-sizing: border-box}

        /* Full-width input fields */
        input[type=text], input[type=password] {
            width: 30%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

        input[type=text]:focus, input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }

        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 25px;
        }

        /* Set a style for all buttons */
        button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 30%;
            opacity: 0.9;
        }

        button:hover {
            opacity:1;
        }

        /* Extra styles for the cancel button */
        .cancelbtn {
            padding: 14px 20px;
            background-color: #f44336;
        }

        /* Float cancel and signup buttons and add an equal width */
        .cancelbtn, .signupbtn {
            float: center;
            width: 30%;
        }

        /* Clear floats */
        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }

        /* Change styles for cancel button and signup button on extra small screens */
        @media screen and (max-width: 300px) {
            .cancelbtn, .signupbtn {
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

    <center><form action="registration.jsp" style="border:1px solid #ccc">
            <div class="container">
                <h1>Sign Up</h1>
                <p>Please fill in this form to create an account.</p>
                <hr>

                <label for="email"><b>First Name</b></label> <br/>
                <input type="text" placeholder="Enter First Name" name="fname" required><br/>

                <label for="email"><b>Last Name</b></label><br/>
                <input type="text" placeholder="Enter Last Name" name="lname" required><br/>

                <label for="email"><b>Email</b></label><br/>
                <input type="text" placeholder="Enter Email" name="email" required><br/>

                <label for="email"><b>Username</b></label><br/>
                <input type="text" placeholder="Enter Username" name="uname" required><br/>

                <label for="psw"><b>Password</b></label><br/>
                <input type="password" placeholder="Enter Password" name="pass" required><br/>

                <label for="email"><b>Street</b></label><br/>
                <input type="text" placeholder="Enter Street" name="street" required><br/>

                <label for="email"><b>State</b></label><br/>
                <input type="text" placeholder="Enter State" name="state" required><br/>

                <label for="email"><b>Zip</b></label><br/>
                <input type="text" placeholder="Enter Zip" name="zip" required><br/>

                <label for="email"><b>Phone</b></label><br/>
                <input type="text" placeholder="Enter Phone" name="phone" required><br/>

                <div class="clearfix">

                <button type="submit" class="signupbtn">Sign Up</button><br/>
                    <hr/> Already a member? <a href="mainlogin.jsp">Login  Here</a>
                </div>
            </div>
        </form></center>

</body>
</html>