<%-- 
    Document   : index.jsp
    Created on : 08.07.2016, 10:45:40
    Author     : ksinn
--%>

<%@page import="Learning.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
    </head>
    <body>
        <h1>Main Page</h1>
            <div style="border: 1px solid black;">
<%
User user = (User) session.getAttribute("user");
if(user!=null&&user.isLogined()){
%>
        
            <p><%=user.getName()%></p>
            <a href="resetpasswd.jsp" alt="log in">Reset password</a>  <a href="resetmail.jsp" alt="log in">Reset mail</a>
            <p><a href="program/CreateProgram.jsp?program=0" alt="registration">Create new Program</a></p>
            <p><a href="program/Program.jsp" alt="registration">Show my Programs</a></p>
        
<%}
else{
%>

<h3><a href="login.jsp" alt="log in">Log in</a></h3>  
        <h3><a href="registration.jsp" alt="registration">Registration</a></h3>
<%}%> 
            </div>
    </body>
</html>
