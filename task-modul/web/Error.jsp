<%-- 
    Document   : Error
    Created on : 24.07.2016, 11:37:12
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Error</title>
        <meta charset="utf-8">
        <link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/kube.min.js"></script>
    </head>
    <body>
        <%@include file="/header.jsp" %>
        <div class="row centered bg-blue">
            <div class="col col-3 text-center">
                <img src="${pageContext.request.contextPath}/img/ghost.png" alt="error">
                <div class="p-error">
                    <h3>WHOOPS!</h3>
<%
String er = request.getParameter("e");

if("ObjectNotFind".equals(er)){
%>
        <p>We couldn't find the page you were looking for.</p>
<%
    return;
}
if("IllegalAction".equals(er)){
%>
        <p>You have tried to do the impossible.</p>
<%
    return;
}
if("IOExtension".equals(er)){
%>
        <p>The problem with the file.</p>
<%
    return;
}
if("InvalidParameter".equals(er)){
%>
        <p>Invalid Parameter.</p>
<%
    return;
}
if("".equals(er)){
%>
        <p>Problems with server.</p>
<%
    return;
}
%>                    
                </div>
            </div>
        </div>
        <%@include file="/footer.jsp" %>
    </body>
</html>
