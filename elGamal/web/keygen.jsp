<%-- 
    Document   : keygen
    Created on : 04.12.2016, 12:50:38
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Keygen</title>
    </head>
    <body>
        <h1>Generated kays:</h1>
        <div>
            <h2>Public key:</h2>
            <p>p: ${keys.pk.p}</p>
            <p>g: ${keys.pk.g}</p>
            <p>h: ${keys.pk.h}</p>
        </div>
        <div>
            <h2>Pivate key:</h2>
            <p>x: ${keys.sk.x}</p>
        </div>
    </body>
</html>
