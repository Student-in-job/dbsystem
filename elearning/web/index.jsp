<%-- 
    Document   : index.jsp
    Created on : 08.07.2016, 10:45:40
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
    </head>
    <body>
        <h1>Main Page</h1>
        <div>
            <jsp:useBean id="user" class="Learning.User" scope="session"/> 
            <jsp:getProperty name="user" property="name"/>
        </div>
        <h3><a href="login.jsp" alt="log in">Log in</a>  <a href="resetpasswd.jsp" alt="log in">Reset password</a>  <a href="resetmail.jsp" alt="log in">Reset mail</a></h3>
        <h3><a href="registration.jsp" alt="registration">Registration</a></h3>
        
    </body>
</html>
