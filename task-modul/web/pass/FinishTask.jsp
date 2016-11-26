<%-- 
    Document   : FinishTest
    Created on : 10.08.2016, 14:39:43
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/Error.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task</title>
        <link href="../img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
    </head>
    <body>
        <%@include file="../header.jsp" %>
        
        <div class="row centered text-center test">
            <div class="col col-8 ">
                <h1>You compleat</h1>
                <p>${request.error}</p>
            </div>            
        </div>
        <%@include file="/footer.jsp" %>
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>


   </body>
</html>
