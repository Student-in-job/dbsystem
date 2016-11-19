<%-- 
    Document   : Error
    Created on : 24.07.2016, 11:37:12
    Author     : ksinn
--%>

<%@page import="Learning.User"%>
<%@page import="API.AppInf"%>
<%@page import="java.util.Date"%>
<%@page import="API.UserSWT"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="/avtorize.jsp"%>

<%
if(user!=null) {
            UserSWT wt = new UserSWT();
            wt.putData(user, AppInf.main, AppInf.task+"/Auth", new Date().getTime() + 5*60*1000);           
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Rederect</title>
        <meta charset="utf-8">
        <link href="<%=request.getServletContext().getContextPath()%>/img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/normalize.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube.min.css">

        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube-ext.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/master.css">
        <script src="<%=request.getServletContext().getContextPath()%>/js/jquery.min.js"></script>
        <script src="<%=request.getServletContext().getContextPath()%>/js/kube.min.js"></script>
    </head>
    <script> 
        
     window.location.href = "<%=AppInf.task%>/Auth?<%=wt.getURLParam()%>";   
    
    </script>
    <body>
        
    </body>     
</html>
<%} else {
    response.sendRedirect(request.getServletContext().getContextPath());
}%>