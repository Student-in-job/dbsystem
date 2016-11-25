<%-- 
    Document   : Group
    Created on : 23.10.2016, 20:18:31
    Author     : ksinn
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/Error.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Group</title>
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
                    <h3>${group.name}</h3>
                    <h4>Public: ${group.publish}</h4>
                    <h4>Active: ${group.active}</h4>
                </div>
                <div class="col col-1">
                    <a class="test-edit" href="${pageContext.request.contextPath}/edit/EditGroup?group=${group.id}">
                        <i class="fa fa-cog font-green" aria-hidden="true"></i>
                        Edit
                    </a>
                </div>
                <div class="col">
                    <a href="${pageContext.request.contextPath}/edit/CreateTask?group=${group.id}">
                        <button class="button round outline small">
                            Add task <i class="fa fa-plus" aria-hidden="true"></i>
                        </button>
                    </a>
                    <a href="${pageContext.request.contextPath}/edit/DataBaseManager?group=${group.id}">
                        <button class="button round outline small">
                            DMManager <i class="fa fa-plus" aria-hidden="true"></i>
                        </button>
                    </a>
                </div>
            </div>
            <hr>
<%--            <c:if test="${tasks.isEmpty==null}">
            
            <div class="row">
                <div class="col">
                    <div class="col offset-1">
                        <p>Nothing yet</p>
                    </div>
                </div>
            </div> 
            </c:if>
--%>
            <c:forEach var="task" items="${tasks}">
            <div class="row">
                <div class="col offset-1">
                    <p>${task.question} (${task.ball} )</p>
                        <div class="form-item checkboxes">
                            <p>${task.answer}</p>
                        </div>
                </div>
                <div class="col">
                    <a class="test-edit" href="${pageContext.request.contextPath}/edit/Delete?task=${task.id}">
                        <i class="fa fa-trash font-green"></i> Delete
                    </a> 
                    <a class="test-edit" href="${pageContext.request.contextPath}/edit/EditTask?task=${task.id}">
                        <i class="fa fa-cog font-green"></i> Edit
                    </a>
                </div>
            </div>
            </c:forEach>
            <div class="col">

            </div>

        </div>
<%@include file="/footer.jsp" %>
    </body>
</html>

