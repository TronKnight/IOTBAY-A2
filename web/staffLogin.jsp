<%-- 
    Document   : staffLogin
    Created on : 20 May, 2023, 11:30:43 PM
    Author     : Dev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="style.css" rel="stylesheet">
        <title> Staff Login </title>
    </head>
        <% 
            String existErr = (String) session.getAttribute("existErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String passErr = (String) session.getAttribute("passErr");
        %>
        <h1 class='title'>IoT Bay Store</h1>
        <div class="container" style="margin-top: 10%">
            <div class ="stafflogin-container">
                <form action="StaffLoginServlet" method ="POST">
                    <h1><strong>Staff Login</strong></h1>
                    <span> <%=(existErr != null ? existErr: "")%> </span>
                    <div>
                        <table style="width: auto;">
                            <tr>
                                <td>
                                    <label for="email">Email:</label>
                                </td>
                                <td>
                                    <input type="text" id="email" name="email" placeholder="<%=(emailErr != null ? emailErr : "Enter Email") %>">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="pass">Password:</label>
                                </td>
                                <td>
                                    <input type="password" id="pass" name="pass" placeholder="<%=(passErr != null ? passErr : "Enter Password") %>">
                                </td>
                            </tr>    
                        </table>
                        <div>
                            <button type="submit">Login</button>
                        </div>
                    </div>
                    <div style="margin-top: 20px">
                        <a href="index.jsp"><strong> Back to Home Page</strong></a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
