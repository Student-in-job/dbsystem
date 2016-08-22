<%-- 
    Document   : logfrag
    Created on : 22.08.2016, 13:21:08
    Author     : ksinn
--%>

<%@page import="Learning.User"%>
<%
User user = (User) session.getAttribute("user");
if(user==null) {
    Cookes cookes = request.getC
    response.sendRedirect("login.jsp"); return; 
}
    

%>