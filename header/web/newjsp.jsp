<%-- 
    Document   : newjsp
    Created on : 25.11.2016, 18:34:33
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
        <p>HTTP_X_FORWARDED_FOR: <%=request.getHeader("HTTP_X_FORWARDED_FOR")%></p>
        <p>RemoteAddr: <%=request.getRemoteAddr()%></p>
        <p>RemoteAddr: <%=request.getRemoteHost()%></p>
    </body>
</html>
