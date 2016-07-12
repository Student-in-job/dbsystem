<%-- 
    Document   : Program
    Created on : 11.07.2016, 11:12:30
    Author     : ksinn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Learning.Program"%>
<%@page import="Learning.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    User user = (User) session.getAttribute("user");
    if(user==null||!user.isLogined())
        response.sendRedirect("../login.jsp");
    
    ArrayList<Program> list = user.getPrograms();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=user.getName()%>'s programs</title>
    </head>
    <body>
        <h1><%=user.getName()%>'s programs</h1>
<%
    for(int i=0; i<list.size(); i++){
            
            
%>
        <article>
            <h2>Name: <%=list.get(i).getName()%></h2>
             <h3>Typ: <%=list.get(i).getTyp()%></h2>
             <p>Typ: <%=list.get(i).getInventory()%></p>
             <p>
                 <a href="CreateMaterial.jsp?program=<%=list.get(i).getID()%>" alt="Create new material in this program">add Material</a>
             </p>
        </article>
<%}%>
    </body>
</html>
