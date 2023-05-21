<%-- 
    Document   : staffRegister
    Created on : 31 Mar, 2023, 11:38:32 PM
    Author     : Dev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="style.css" rel="stylesheet">
        <title> Main </title>
    </head>
    <body>
        <% 
            String matchErr = (String) session.getAttribute("matchErr");
            String existErr = (String) session.getAttribute("existErr");
            String fnameErr = (String) session.getAttribute("fnameErr");
            String lnameErr = (String) session.getAttribute("lnameErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String passErr = (String) session.getAttribute("passErr");
            String phoneErr = (String) session.getAttribute("phoneErr");
        %>
        <h1 class='title'>IoT Bay Store</h1>    
        <div class="registerpagecontainer">
            <form action="StaffRegisterServlet" method="POST">
                <div class='register-container'>
                    <h1><strong>Sign Up Here!</strong></h1>
                    <span> <%=(existErr != null ? existErr: "")%> </span>
                    <div>
                        <table style="width: auto;">
                            <tbody>
                                <tr>
                                    <td> <label for="fname">First Name</label> </td>
                                    <td> <input type="text" placeholder="<%=(fnameErr != null ? fnameErr : "Enter First Name")%>" name="fname" required> </td>
                                </tr>
                                
                                <tr>
                                    <td> <label for="lname">Last Name</label> </td>
                                    <td> <input type="text" placeholder="<%=(lnameErr != null ? lnameErr : "Enter Last Name")%>" name="lname" required> </td>
                                </tr>
                                
                                <tr>
                                    <td> <label for="email">Email</label> </td>
                                    <td> <input type="email" placeholder="<%=(emailErr != null ? emailErr : "Enter Email")%>" name="email" required> </td>
                                </tr>
                                
                                <tr>
                                    <td> <label for="phonenum">Phone Number</label> </td>
                                    <td> <input type="text" placeholder="<%=(phoneErr != null ? phoneErr : "Enter Phone Number")%>" name="phonenum" required> </td>
                                </tr>
                                
                                <tr>
                                    <td> <label for="Country">Country</label></td>
                                    <td> <input type="text" placeholder="Enter Country" name="country" required></td>
                                </tr>
                                
                                <tr>
                                    <td> <label for="psw">Password</label> </td>
                                    <td> <input type="password" placeholder="<%=(passErr != null ? passErr : "Enter Your Password")%>" name="pass" required> </td>
                                </tr>
                                
                                <tr>
                                    <td> <label for="psw">Confirm Password</label> </td>
                                    <td> <input type="password" placeholder="Confirm Password" name="cpass" required> </td>
                                </tr>
                                <span> <%=(matchErr != null ? matchErr: "")%> </span>
                            </tbody>
                        </table>
                    </div>
                    <div style="margin-bottom: 1cm">
                        <button type="submit">Create Account</button>
                    </div> 
                    
                    <div>
                        Already have an account? <a href="staffLogin.jsp"><strong>Sign in</strong></a>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>