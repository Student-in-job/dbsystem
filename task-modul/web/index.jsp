<%-- 
    Document   : index
    Created on : 07.12.2016, 13:36:01
    Author     : ksinn
--%>

<%@page import="API.AppInf"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(request.getSession().getAttribute("user_id")==null){
    response.setHeader("Location", AppInf.main);
    response.setHeader("Cache-Control", "no-store");
    response.setStatus(301);
} else {
    response.sendRedirect("main");
}
%>
