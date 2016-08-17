<%-- 
    Document   : FinishTest
    Created on : 10.08.2016, 14:39:43
    Author     : ksinn
--%>

<%@page import="DataBase.*"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   

        AcceptTest accept = (AcceptTest) session.getAttribute("accept");
        if(accept==null){
            response.sendRedirect("/elearning/UserBar.jsp");
        }
        else{
            try{
                accept.Final();
                session.removeAttribute("accept");                     
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>You pass test <%=accept.getTest().getName()%>!</h1>
        <h2>You ball <%=accept.getBall()%>!</h2>
        <h2>You right answer on  <%=accept.getRightPointer()%> from <%=accept.getQuantity()%>!</h2>
    </body>
</html>
<%}catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=ObjectNotFind"); return;}
catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp"); return;}
        
}
%>