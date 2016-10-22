<%-- 
    Document   : test
    Created on : 22.10.2016, 12:38:59
    Author     : ksinn
--%>

<%@page import="Model.Log"%>
<%@page import="Model.Task"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    Task task = new Task();
    task.getById(1);
    request.setAttribute("task", task);
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <p>Question: ${task.question}</p>
        <p>Ansver: ${task.answer}</p>
        <p>Ball: ${task.ball}</p>
        <p>Time: ${task.time}</p>
    </body>
</html>
