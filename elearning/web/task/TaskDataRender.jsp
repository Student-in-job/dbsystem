<%-- 
    Document   : Test
    Created on : 13.07.2016, 16:56:55
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <div class=" test">
            <div class="row ">
                <div class="col col-3 offset-1">
                    <h3>${task.name} (${task.time} m (at ${task.startTime}) duaring ${task.period} d)</h3>
                    <h4><a href="${pageContext.request.contextPath}/program/Program?id=${task.program.id}">${task.program.name}</a></h4>
                    <h4>${task.totalCount} tasks from group ${task.groupId}</h4>
                    <h4>Passing: ${task.passingCount}</h4>
                </div>
                <div class="col col-1">
                    <a class="test-edit" href="EditTask?id=${task.id}">
                        <i class="fa fa-cog font-green" aria-hidden="true"></i>
                        Edit
                    </a>
                    <a class="test-edit" href="Delete?id=${task.id}">
                        <i class="fa fa-cog font-green" aria-hidden="true"></i>
                        Delete
                    </a>
                </div>
            </div>
            <hr>            

            <div class="col">               
            </div>

        </div>
<%@include file="/footer.jsp" %>
    </body>
</html>