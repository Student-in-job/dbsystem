<%-- 
    Document   : Error
    Created on : 24.07.2016, 11:37:12
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Error!</h1>
<%=request.getParameter("sql")==null?"":"<h2>Data Base error!</h2>"%>     
<%=request.getParameter("noexist")==null?"":"<h2>This page have no exists data!</h2>"%>     
        <a href = "/elearning/">Go to main page.</a>
    </body>
</html>
