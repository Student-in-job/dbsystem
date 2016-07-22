<%-- 
    Document   : Upload
    Created on : 12.07.2016, 11:07:55
    Author     : ksinn
--%>

<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="org.apache.tomcat.util.http.fileupload.RequestContext"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="DataBase.Log"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String program = request.getParameter("program");
if(request.getMethod()=="POST"){
    Part part = request.getPart("data");
    if(Files.Write(part, program)){
        response.sendRedirect("Program.jsp?program="+program);
    }
}
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
	<form action="Upload.jsp" method="post" enctype="multipart/form-data">
            <input name="program" type="hidden" value="<%=program%>"><br>
		<input name="data" type="file"><br>
		<input type="submit"><br>
	</form>
</body>
</html>
