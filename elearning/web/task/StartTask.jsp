<%-- 
    Document   : Test
    Created on : Aug 24, 2016, 5:17:51 PM
    Author     : javlonboy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/Error.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task :: ${initParam.SiteName} &mdash; 2016 </title>
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
        <%@include file="/header.jsp" %>
        
        <div class="row centered text-center test">
            <div class="col col-12 ">
                <h3>${task.name}</h3>
            </div>
            <div class="row centered best-results ">
                <h4 class="col col-12"></h4>            
            </div>
            <div class="col col-12 test-btn">
                <form method="POST" action="">
                <input type="hidden" name="test" value="${test.id}">
                <input class="button round outline" type="submit" value="Start task &rarr;">
                </form> 
            </div>             
        </div>
        <%@include file="/footer.jsp" %>
        <script src="${pageContext.request.contextPath}/js/jquery.easypiechart.min.js"></script>
        <script>
            $(function () {
                $('.chart').easyPieChart({
                    easing: 'easeOutBounce',
                    onStep: function (from, to, percent) {
                        $(this.el).find('.percent').text(Math.round(percent));
                    }
                });
            });
        </script>

    </body>
</html>
