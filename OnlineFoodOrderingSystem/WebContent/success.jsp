<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
%>
Invalid Username or Password<br/>
<a href="mainlogin.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("username   ")%>
<a href='logout.jsp'>Log out</a>
<%
    }
%>