<%-- 
    Document   : userRegister
    Created on : 29 Mar, 2023, 9:04:03 PM
    Author     : Dev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="style.css" rel="stylesheet">
        <title> Customer Registration </title>
    </head>
    <body>
        <h1 class='title'>IoT Bay Store</h1>
        <% 
            String matchErr = (String) session.getAttribute("matchErr");
            String existErr = (String) session.getAttribute("existErr");
            String fnameErr = (String) session.getAttribute("fnameErr");
            String lnameErr = (String) session.getAttribute("lnameErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String passErr = (String) session.getAttribute("passErr");
            String phoneErr = (String) session.getAttribute("phoneErr");
            String streetNumErr = (String) session.getAttribute("streetNumErr");
            String postcodeErr = (String) session.getAttribute("postcodeErr");
        %>
        <div class="registerpagecontainer">
            <form action="RegisterServlet" method="POST">
                
                <div class='register-container'>
                    <div>
                         <h1>Sign Up Here!</h1>
                    </div>
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
                                    <td> <label for="street-number">Street Number</label> </td>
                                    <td> <input type="text" placeholder="<%=(streetNumErr != null ? streetNumErr : "Enter Street Number")%>" name="streetnum" required> </td>
                                </tr>
                                <tr>
                                    <td> <label for="street-name">Street Name</label> </td>
                                    <td> <input type="text" placeholder="Enter Street Name" name="streetname" required> </td>
                                </tr>
                                <tr>
                                    <td> <label for="suburb">Suburb</label> </td>
                                    <td> <input type="text" placeholder="Enter Suburb" name="suburb" required> </td>
                                </tr>
                                <tr>
                                    <td> <label for="state">State</label> </td>
                                    <td> <input type="text" placeholder="Enter State" name="state" required> </td>
                                </tr>
                                <tr>
                                    <td> <label for="postcode">Postcode</label> </td>
                                    <td> <input type="text" placeholder="<%=(postcodeErr != null ? postcodeErr : "Enter Postcode")%>" name="postcode" required> </td>
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
                    <div>
                        <button type="submit">Create Account</button>
                    </div>
                    <div style="margin-top: 15px; padding-bottom: -20px">
                        Already have an account? <a href="login.jsp"><strong>Sign in</strong></a>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
