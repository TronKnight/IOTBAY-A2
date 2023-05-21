<%-- 
    Document   : logout
    Created on : 30 Mar, 2023, 10:58:32 PM
    Author     : Dev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="style.css" rel="stylesheet">
        <title> Logout </title>
    </head>
    <body>
   <div class="container">
        <img src="home.jpg" alt="Ecommerce Image" class="image" >
            <div class="login-container">
                <h1>You have been logged out.</h1>
                <% session.invalidate(); %>
            <a href="index.jsp">Back to Login</a>
            </div>
    </div>    
    </body>
</html>
