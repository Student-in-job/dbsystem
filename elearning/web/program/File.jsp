<%-- 
    Document   : File.jsp
    Created on : 22.07.2016, 11:17:49
    Author     : ksinn
--%>

<%@page import="Learning.Files"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
Files file = new Files(Integer.parseInt(request.getParameter("file")));
String s = "";
if("embed".equals(request.getParameter("code")))
    s = file.getEmbed();
if("url".equals(request.getParameter("code")))
    s = file.getURL();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <textarea readonly=""><%=s%></textarea>      
    </body>
</html>
