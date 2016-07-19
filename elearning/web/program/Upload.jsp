<%-- 
    Document   : Upload
    Created on : 12.07.2016, 11:07:55
    Author     : ksinn
--%>


<%@page import="java.util.UUID"%>
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
if(request.getMethod()=="GET"){
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
		<input name="data" type="file"><br>
		<input type="submit"><br>
	</form>
</body>
</html>
<%
}

if(request.getMethod()=="POST"){

Material nm = (Material) session.getAttribute("nMaterial");
Part part = request.getPart("data");
String fileName = "/home/ksinn/NetBeansProjects/dbsystem/uploadFiles/"+UUID.randomUUID()+extractFileName(part);
part.write(fileName);
    
}

	
}
%>


<%!
   
private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("."), s.length()-1);
            }
        }
        return "";
    }
%>