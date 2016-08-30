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
<%
String er = request.getParameter("e");
if("ObjectNotFind".equals(er)){
%>
        <p>Содержимое этой страницы не было найдено</p>
<%
    return;
}
if("ObjectNotFind".equals(er)){
%>
        <p>Содержимое этой страницы не было найдено</p>
<%
    return;
}
if("ObjectNotFind".equals(er)){
%>
        <p>Содержимое этой страницы не было найдено</p>
<%
    return;
}
if("IllegalAction".equals(er)){
%>
        <p>Вы попыталсь совершить недопустимое действие</p>
<%
    return;
}
if("IOExtension".equals(er)){
%>
        <p>Невозможно найти фаил</p>
<%
    return;
}
if("InvalidParameter".equals(er)){
%>
        <p>Неверный параметор</p>
<%
    return;
}
if("".equals(er)){
%>
        <p>Ошибка на сервере</p>
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
