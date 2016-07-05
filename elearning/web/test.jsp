<%-- 
    Document   : test
    Created on : 04.07.2016, 18:22:53
    Author     : ksinn
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Learning.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Learning.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <%
            SimpleDateFormat format = new SimpleDateFormat();
            format.applyPattern("dd.MM.yyyy");
            Date docDate= format.parse("20.06.1994");

            try{
            boolean isRegistred = User.Register("mail1", "password", "name", "surname", docDate, "w");
            
            User user = User.Authorize("mail", "password");
            if(user!=null){
        %>
        <%=user.getName()%> <%=user.getSurname()%>
       
        <%}
            }
            catch(Exception e)
            {
                out.println(e.getMessage());
            }            
        %>
        
        
    </body>
</html>
