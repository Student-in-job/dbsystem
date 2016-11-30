<%-- 
    Document   : Upload
    Created on : 12.07.2016, 11:07:55
    Author     : ksinn
--%>

<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page import="DataBasePak.Log"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
User user=null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RegistAll</title>
        <link href="../img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/kube.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/extend/tabs.js"></script>
    </head>
    <body>
        <%@include file="../header.jsp"%>

        <div class="row centered registration">
            <div class="col col-4">
                
                
                <form id="form1" class="form" action="RegistAll" method="post">
                     
                    <div class="form-item">        
                        <label>List</label> 
                        <textarea name="data" ></textarea>
                    </div>
                    
                    
                    <div class="form-item">        
                    	<button class="button primary width-100 big">Complete</button>
                    </div> 
                </form>
   
               
            </div>
        </div>
        
        <%@include file="../footer.jsp" %>
    </body>
</html>

