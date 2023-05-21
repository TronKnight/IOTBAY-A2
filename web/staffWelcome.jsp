<%-- 
    Document   : staffWelcome
    Created on : Apr 24, 2022, 1:45:06 AM
    Author     : Dev
--%>

<%@page import="uts.isd.model.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="style.css" rel="stylesheet">
        <title> Welcome </title>
    </head>
    <body>    
        <% 
            Staff staff = (Staff)session.getAttribute("staff");
            String email = request.getParameter("email");
        %>
        <h1 class='title'>IoT Bay Store</h1> 
        <div>
            <h1> Welcome <%= staff.getFirstName() + " " + staff.getLastName()%>! </h1>
            <p>Your email is <%=staff.getEmail()%></p>
            <p>Your phone number is <%=staff.getPhoneNumber()%></p>
            <br>
            <form action="staffMain.jsp" method="POST" style="margin-left: 600px; width: 190px; border-radius: 50%">
                Your Homepage is ready!
                <button  type="submit" style="margin-top: 15px"> 
                    Dashboard
                </button> 
            </form>
        </div>
    </body>
</html>
