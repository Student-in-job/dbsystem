<%-- 
    Document   : newjsp
    Created on : 25.11.2016, 18:34:33
    Author     : ksinn
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Enumeration<String> names = request.getHeaderNames(); 
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>HTTP_X_FORWARDED_FOR: <%=request.getHeader("X-FORWARDED-FOR")%></p>
        <p>RemoteAddr: <%=request.getRemoteAddr()%></p>
        <p>RemoteHost: <%=request.getRemoteHost()%></p>
        <div>
        <h3>All headers </h3>
        <%while(names.hasMoreElements()){
        String name = names.nextElement();%>
            <p>
                <b><%=name%> :</b> <%=request.getHeader(name)%>
            </p>
        <%}%>
        </div>
    </body>
</html>
