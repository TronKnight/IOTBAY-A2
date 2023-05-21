<%-- 
    Document   : welcome
    Created on : 29 Apr, 2023, 08:44:35 AM
    Author     : Dev
--%>

<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="style.css" rel="stylesheet">
        <title> Welcome </title>
    </head>
    <body>
        <%
            User user = (User)session.getAttribute("user");
            String email = request.getParameter("email");
        %>
        <h1 class='title'>IoT Bay Store</h1>         
        <div>
            <h1> Welcome <%= user.getFirstName() + " " + user.getLastName() %>! </h1>
            <p>Your email is <%=user.getEmail()%></p>
            <p>Your phone number is <%=user.getPhoneNumber()%></p>
            <br>

            <form action="main.jsp" method="POST" style="margin-left: 600px; width: 190px; border-radius: 50%">
                Your Homepage is ready!
                <button  type="submit" style="margin-top: 15px"> 
                    Dashboard
                </button> 
            </form>
        </div>
    </body>
</html>
