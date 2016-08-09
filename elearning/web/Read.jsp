<%-- 
    Document   : Read
    Created on : 09.08.2016, 14:14:23
    Author     : ksinn
--%>

<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   
User user = (User) session.getAttribute("user");
    if(user==null) response.sendError(500, "You are not logined");
    if(!user.isLogined()) response.sendError(500, "You are not logined");
    
    try{Material mat = new Material(Integer.parseInt(request.getParameter("material")));}
    catch(Exception ex){response.sendError(500, "Material not exist!");}
    

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
