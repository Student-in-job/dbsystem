<%-- 
    Document   : Upload
    Created on : 12.07.2016, 11:07:55
    Author     : ksinn
--%>

<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page import="DataBase.Log"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
try{

User user = (User) session.getAttribute("user");
    if(user!=null&&user.isLogined()){
String mark = null;
int material = Integer.parseInt(request.getParameter("material"));

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload</title>
    </head>
    <body>
        <html>
<head>
<body>
    <h2><%=mark==null?"":mark%></h2>
    <form action="/elearning/program/Upload" method="post" enctype="multipart/form-data">
        <input name="material" type="hidden" value="<%=material%>"><br>
	<input name="data" type="file" accept="	application/msword, video/mp4, 	application/pdf, application/powerpoint"><br>
        <input type="submit"><br>
    </form>
</body>
</html>
<%}
else response.sendRedirect("login.jsp");
}
catch(Exception ex){
    Log.getOut(ex.getMessage());
    response.sendRedirect("/elearning/Error.jsp");
}
%>
