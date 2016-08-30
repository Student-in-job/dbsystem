<%-- 
    Document   : error.jsp
    Created on : Aug 30, 2016, 1:33:18 PM
    Author     : javlonboy
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="avtorize.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Error</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="css/kube.min.css">

        <link rel="stylesheet" href="css/kube-ext.css">
        <link rel="stylesheet" href="css/master.css">
        <script src="<%=request.getServletContext().getContextPath()%>/js/jquery.min.js"></script>
        <script src="<%=request.getServletContext().getContextPath()%>/js/kube.min.js"></script>
    </head>
    <body>
        <%@include file="/header.jsp" %>
        <div class="row centered bg-blue">
            <div class="col col-3 text-center">
                <img src="img/ghost.png" alt="error">
                <div class="p-error">
                    <h3>WHOOPS!</h3>
                    <p>We couldn't find the page you were looking for.</p>
                </div>
            </div>
        </div>
        <%@include file="/footer.jsp" %>
    </body>
</html>
