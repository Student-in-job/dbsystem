<%-- 
    Document   : Error
    Created on : 24.07.2016, 11:37:12
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Error!</h1>  
        
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
        
        <a href = "<%=request.getServletContext().getContextPath()%>">Go to main page.</a>
    </body>
</html>
