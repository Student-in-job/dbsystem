<%-- 
    Document   : Upload
    Created on : 12.07.2016, 11:07:55
    Author     : ksinn
--%>


<%@page import="com.ibm.useful.http.FileData"%>
<%@page import="com.ibm.useful.http.PostData"%>
<%@page import="DataBase.Log"%>
<%@page import="Learning.*"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
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

NewMaterial nm = (NewMaterial) session.getAttribute("nMaterial");
try
{
    if(request.getContentType().equals("multipart/form-data"))
    {

        PostData multidata=new PostData(request);
        String fileDescription=multidata.getParameter("description");
        FileData tempFile=multidata.getFileData("file_send");
        if(tempFile!=null) nm.UploadFile(tempFile);
    }
}
catch(Exception e){
    Log.getOut(e.getMessage());
}
		
}
%>