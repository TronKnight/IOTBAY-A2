<%-- 
    Document   : userLogs
    Created on : May 11, 2023, 4:06:51 PM
    Author     : Dev
--%>

<%@page import="uts.isd.model.User"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.Logs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:derby://localhost:1527/";
    String dbName = "usersdb";
    String userId = "iotbay";
    String password = "admin";
    try {
        Class.forName(driverName);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <link href="style.css" rel="stylesheet">
        <title> Logs </title>
    </head>
    <body>
        <%
            User user = (User)session.getAttribute("user");
            ArrayList logs = (ArrayList) session.getAttribute("logs");
            ArrayList tlogs = (ArrayList) session.getAttribute("tlogs");
        %>
        <h1 class='title'>IoT Bay Store</h1>
        <div>
            <table class="tablestyle">
                <h1 >Logs</h1> 
                <thead>
                    <tr>
                        <th class="tabledata">User ID</th>
                        <th class="tabledata">Action Type</th>
                        <th class="tabledata">DATE TIME</th>
                        </tr>
                </thead>

                    <%
                        try {
                        connection = DriverManager.getConnection(
                        connectionUrl + dbName, userId, password);
                        statement = connection.createStatement();
                        String sql = "SELECT * FROM USERLOGS";
                        resultSet = statement.executeQuery(sql);
                        while (resultSet.next()) {
                    %>

                    <tr>
                        <tr>
                            <td class="tabledata"><%=resultSet.getString("USERID")%></td>
                            <td class="tabledata"><%=resultSet.getString("STATUS")%></td>
                            <td class="tabledata"><%=resultSet.getString("CURRENTTIME")%></td>
                        </tr>
                    </tr>
                    <%
                        }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </table>
        </div>
        <div style="margin-top: 15px; padding-bottom: -20px">
            <a href="main.jsp"><strong>Go Back</strong></a>
        </div>
    </body>
</html>

