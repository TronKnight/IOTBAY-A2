<%-- 
    Document   : order
    Created on : [May 20, 2023, 10:48:39 PM]
    Author     : [Martin]
--%>

<%@page import="uts.isd.model.Order"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
    <head>
        <link href="style.css" rel="stylesheet">
        <title>Order Page</title>
    </head>
    <body>
        <h1 class="title">IoT Bay Store - Order Page</h1>
        <div class="banner" id="Navigation">
            <div id="navigationbuttons">
                <div class="navigationpagebutton pageButton flex-inline">
                    <a href="main.jsp" class="white white-button nav-link">Main</a>
                </div>
                <div class="navigationpagebutton pageButton flex-inline current">
                    <a href="OrderServlet" class="white white-button nav-link">Order</a>
                </div>
                <div class="navigationpagebutton pageButton flex-inline">
                    <a href="AccLogsServlet" class="white white-button nav-link">View Logs</a>
                </div>
                <div class="navigationpagebutton pageButton flex-inline">
                    <a href="userEdit.jsp" class="white white-button nav-link">Edit Account</a>
                </div>
                <div class="navigationpagebutton pageButton flex-inline">
                    <a href="LogoutServlet" class="white white-button nav-link">Logout</a>
                </div>
            </div>
        </div>
        

        <%-- Example: Display a list of orders --%>
        <h3>Order History</h3>
        <%-- Retrieve a list of orders from the servlet or database --%>
        <%-- List<Order> orderList = orderDao.getAllOrders(); --%>
        <%-- for (Order order : orderList) { --%>
        <%--     <div> --%>
        <%--         <p>Order ID: <%= order.getOrderId() %></p> --%>
        <%--         <p>Order Date: <%= order.getOrderDate() %></p> --%>
        <%--         <p>Status: <%= order.getStatus() %></p> --%>
        <%--     </div> --%>
        <%-- } --%>

    </body>
</html>
