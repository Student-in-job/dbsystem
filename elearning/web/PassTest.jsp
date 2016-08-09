<%-- 
    Document   : PassTest
    Created on : 09.08.2016, 16:40:28
    Author     : ksinn
--%>

<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   
User user = (User) session.getAttribute("user");
    if(user==null) response.sendError(500, "You are not logined");
    if(!user.isLogined()) response.sendError(500, "You are not logined");
    AcceptTest accept = (AcceptTest) session.getAttribute("accept");
    if(accept=null){
        
    }
    
    
    User_courses uhc = new User_courses(Integer.parseInt(request.getParameter("uhc")));
    Test test = new Test(Integer.parseInt(request.getParameter("test")));
    
    try{accept = new AcceptTest(uhc, test);}
    catch(Exception ex){response.sendError(500, "Material not exist!");}
    session.setAttribute("accept", accept);
    

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Pass Test!</h1>
        
    </body>
</html>
