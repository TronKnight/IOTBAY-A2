<%-- 
    Document   : index
    Created on : 29 Mar, 2023, 10:42:03 PM
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
   <h1 class='title'>IoT Bay Store</h1>
    <div class="container">
        <img src="home.jpg" alt="Ecommerce Image" class="image" >
        <div class="homecontainer">
            <a href="userRegister.jsp" ><button class="indexbutton">Customer Sign-Up</button><a/>
            <a href="staffRegister.jsp" ><button class="indexbutton">Staff Sign-Up</button></a> 
            <a href="#"><button class="indexbutton">Catalogue Browse</button></a> 
        </div>
        <jsp:include page="/ConnServlet" flush="true"/>
        
    </body>
</html>
