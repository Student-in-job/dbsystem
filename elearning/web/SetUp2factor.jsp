<%-- 
    Document   : Error
    Created on : 24.07.2016, 11:37:12
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="avtorize.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>SetUp Key</title>
        <meta charset="utf-8">
        <link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
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
    <body>
        <%@include file="/header.jsp" %>
        <div class="row centered bg-blue">
            <div class="col col-3 text-center">
                <img src="<%=request.getServletContext().getContextPath()%>/img/ghost.png" alt="error">
                <div class="p-error">
                    <h3>Warning! You can not input data agane!</h3>
                    <p>
                        <a href="SetUpController" target="_blank">get QRcode</a> or <a href="SetUpPhone.jsp"> set up you phone</a>  and login agane!
                    </p>
                    
                </div>
            </div>
        </div>
        <%@include file="/footer.jsp" %>
    </body>
</html>
