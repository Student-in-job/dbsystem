<%-- 
    Document   : FinishTest
    Created on : 10.08.2016, 14:39:43
    Author     : ksinn
--%>

<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   

        AcceptTest accept = (AcceptTest) session.getAttribute("accept");
        if(accept==null){
            response.sendRedirect("StartPassTest.jsp");
        }
        else{
            session.removeAttribute("accept");
            accept.Final();            
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
<%}%>