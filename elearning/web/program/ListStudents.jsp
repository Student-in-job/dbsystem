<%-- 
    Document   : ListStudents
    Created on : 02.12.2016, 17:54:33
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Program :: ${initParam.SiteName} &mdash; 2016 </title>
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
        <%@include file="../header.jsp"%>
        <c:forEach items="${users}" var="user">  
            <div id="${user.id}">
                ${user.name} ${user.surname} - <button onclick="add(${user.id})">Add</button>
            </div>
        </c:forEach>    
    </body>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script>
        
        $("#${user.id}").remove();        
        
        function add(id){
            $.ajax({  
                url: "${pageContext.request.contextPath}/program/StartCourse?id=${course.id}&user="+id, 
                method: 'POST',
                cache: false, 
                error: function(){
                    document.getElementById('message').style.display = 'block';
                    $("#message").html("Error");
                },
                success: function(data){
                       document.getElementById('message').style.display = 'block';
                       $("#message").html(data); 
                       del(id);
                        
                }  
            });  
        }
         
         
         
        function del(id){
            $("#"+id).remove();        
        } 
    </script>
<%@include file="/footer.jsp" %>
    </body>
</html>
