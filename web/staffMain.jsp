<%-- 
    Document   : staffMain
    Created on : Apr 29, 2023, 11:30:27 AM
    Author     : Dev
--%>

<%@page import="uts.isd.model.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="style.css" rel="stylesheet">
        <title> Main </title>
    </head>
    <body>
        <%
            Staff staff = (Staff) session.getAttribute("staff");
        %>
        <h1 class='title'>IoT Bay Store</h1>
        <header>
            <div class="banner" id="Navigation">
                <div id="navigationbuttons">
                    <div class="navigationpagebutton pageButton flex-inline current">
                        <a href="#" class="white white-button nav-link">Link1</a>
                    </div>
                    <div class="navigationpagebutton pageButton flex-inline">
                        <a href="logs.jsp" class="white white-button nav-link">View Logs</a>
                    </div>
                    <div class="navigationpagebutton pageButton flex-inline">
                        <a href="staffEdit.jsp" class="white white-button nav-link">Edit Account</a>
                    </div>
                    <div class="navigationpagebutton pageButton flex-inline">
                        <a href="StaffLogoutServlet" class="white white-button nav-link">Logout</a>
                    </div>
                </div>
            </div>	
        </header>
        <h2 style="text-align: right"> Welcome: <%= staff.getFirstName() + " " + staff.getLastName() %> ! </h2>
    </body>
</html>
