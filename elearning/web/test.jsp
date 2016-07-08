<%-- 
    Document   : test
    Created on : 04.07.2016, 18:22:53
    Author     : ksinn
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Learning.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Learning.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <form action="login.jsp" method="put">
                <div>
                <p>e-mail:</p>
                <input required type="mail" name="mail" placeholder="ksinn@mai.ru">
            </div>
            <div>
                <p>Password:</p>
                <input required type="password" name="password" placeholder="*****">
            </div>
            <input type="submit">
            </form>
        
        
    </body>
</html>
