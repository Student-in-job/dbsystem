<%-- 
    Document   : UserBar
    Created on : 19.07.2016, 19:14:28
    Author     : ksinn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
User user = (User) session.getAttribute("user");
if(user!=null&&user.isLogined()){
    
    ArrayList<Program> program = user.getPrograms();
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
    </head>
    <body>
       <div>
            <img src="http://cs623726.vk.me/v623726602/4a73a/xh1E6l3zWvw.jpg" height="100">
            <h3>Andreeva Kseniya</h3>
            <p>Rating: 100</p>
            <h6><a href="resetpasswd.jsp" alt="log in">Reset password</a></h6>  
            <h6><a href="resetmail.jsp" alt="log in">Reset mail</a></h6>
            
            <div style="border: 1px solid black;">
                <h3>Programs:  <a href="program/CreateProgram.jsp?program=0" alt="registration">+</a></h3>
<%for(int i=0; i<program.size(); i++) {%>  
                <p>
                    <a href="program/Program.jsp?program=<%=program.get(i).getID()%>"><%=program.get(i).getName()%></a>
                    <a href="<%=program.get(i).isPublished()?"\">(Statistic)":"\">(Publish)"%></a>
                </p>
<%}%>                
            </div> 
        
        </div> 
        
        
<%}
else{
%>

<h3><a href="login.jsp" alt="log in">Log in</a></h3>  
        <h3><a href="registration.jsp" alt="registration">Registration</a></h3>
<%}%> 
            </div>
    </body>
</html>

