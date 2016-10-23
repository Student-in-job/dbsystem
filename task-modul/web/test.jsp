<%-- 
    Document   : test
    Created on : 22.10.2016, 12:38:59
    Author     : ksinn
--%>

<%@page import="Model.Log"%>
<%@page import="Model.TaskGroup"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
<%--        <p>Question: ${test.question}</p>
        <p>Ansver: ${test.answer}</p>
        <p>Ball: ${test.ball}</p>
        <p>Time: ${test.time}</p>--%>
        
        <p>Name: ${test.name}</p>
        <p>Public: ${test.publish}</p>
        <p>Active: ${test.active}</p>
        <p>Owner: ${test.owner}</p>
        
        
        
    </body>
</html>
