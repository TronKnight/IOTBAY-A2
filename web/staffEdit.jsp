<%-- 
    Document   : staffEdit
    Created on : 21 May, 2023, 8:53:12 PM
    Author     : Dev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Edit</title>
        <link href="style.css" rel="stylesheet">
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
            <form action="StaffEditServlet" method="POST">
                <div class='register-container'>
                    <h1><strong>Edit Details</strong></h1>
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
                        <button type="submit">Edit Account</button>
                    </div> 
                    <div style="margin-top: 15px; padding-bottom: -20px">
                        <a href="staffMain.jsp"><strong>Go Back</strong></a>
                    </div>
                </div>
            </form>
        </div>
    </body>
    </body>
</html>
