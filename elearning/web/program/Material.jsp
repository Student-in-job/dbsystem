<%-- 
    Document   : Material
    Created on : 13.07.2016, 12:31:37
    Author     : ksinn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    User user = (User) session.getAttribute("user");
    if(user==null||!user.isLogined())
        response.sendRedirect("../login.jsp");
    if(request.getParameter("material")!=null){    
        Material material = new Material(request.getParameter("material"));
           

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Material</title>
    </head>
    <body>
        <h1>
            <%=material.getProgram().getName()%> -> <%=material.getProgram().getName()%><%=material.getName()%>
            <a href="EditMaterial.jsp?material=<%=material.getID()%>">Edit</a>
            <a href="Delete?material=<%=material.getID()%>">-</a>
        </h1>
        <h3>Inventory: <%=material.getInventory()%></h3>
        <p><%=material.getText()%></p>
    </body>
</html>
<%}%>