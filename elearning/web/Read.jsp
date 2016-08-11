<%-- 
    Document   : Read
    Created on : 09.08.2016, 14:14:23
    Author     : ksinn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Material mat = new Material(Integer.parseInt(request.getParameter("material")));
    
    ArrayList<Files> file = mat.getDocFile();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=mat.getName()%></title>
    </head>
    <body>
        <h1><%=mat.getProgram().getName()%></h1>
        <h2><%=mat.getName()%></h2>
        <div>
            <%=mat.getText()%>
        </div>
            <div>
<%
for(int i=0; i<file.size(); i++){
%>               
                <a href="<%=file.get(i).getURL()%>"><%=file.get(i).getName()%></a>
<%}%>
            </div>    
<%
ArrayList<Files> file = mat.getVideoFile();
%>        
    </body>
</html>
