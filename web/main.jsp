<%-- 
    Document   : main
    Created on : Mar 30, 2023, 8:48:39 AM
    Author     : Dev
--%>

<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
    <head>
        <link href="style.css" rel="stylesheet">
        <title> Main Page</title>
    </head>
    <body>
        <%
            User user = (User)session.getAttribute("user");
            String email = request.getParameter("email");
        %>        
        <h1 class='title'>IoT Bay Store</h1>       
        <div class="banner" id="Navigation">
            <div id="navigationbuttons">
                <div class="navigationpagebutton pageButton flex-inline current">
                    <a href="#" class="white white-button nav-link">Link1</a>
                </div>
                <div class="navigationpagebutton pageButton flex-inline">
                    <a href="userLogs.jsp" class="white white-button nav-link">View Logs</a>
                </div>
                <div class="navigationpagebutton pageButton flex-inline">
                    <a href="userEdit.jsp" class="white white-button nav-link">Edit Account</a>
                </div>
                <div class="navigationpagebutton pageButton flex-inline">
                    <a href="LogoutServlet" class="white white-button nav-link">Logout</a>
                </div>
            </div>
        </div>
        <h2 style="text-align: right"> Welcome: <%= user.getFirstName() + " " + user.getLastName() %>! </h2>
    </body>
</html>
