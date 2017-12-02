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
        <link href="${pageContext.request.contextPath}/img/favicon.png" rel="shortcut icon" type="image/x-icon">
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
                    <h4>Task's count: ${tasks.size()}</h4>
                </div>
                <div class="col col-1">
                    <a class="test-edit" href="${pageContext.request.contextPath}/edit/EditGroup?group=${group.id}">
                        <i class="fa fa-cog font-green" aria-hidden="true"></i>
                        Edit
                    </a>
                    <a class="test-edit" href="${pageContext.request.contextPath}/owner/CheckGroup?group=${group.id}">
                        <i class="fa fa-cog font-green" aria-hidden="true"></i>
                        Check
                    </a>
                </div>
                <div class="col">
                    <a href="${pageContext.request.contextPath}/edit/CreateTask?group=${group.id}" class="button small round success outline">
                        Add task <i class="fa fa-plus" aria-hidden="true"></i>
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/DataBaseManager?group=${group.id}" class="button small round success outline">
                        DM-Manager <i class="fa fa-plus" aria-hidden="true"></i>
                    </a>
                </div>
            </div>
            <hr>
            <c:forEach var="task" items="${tasks}">
                <div 
                    <c:choose>
                        <c:when test="${task.value.isEmpty()}">style="background-color: background"</c:when>
                        <c:when test="${task.value!=null}">style="background-color: bisque"</c:when>
                    </c:choose>
                    class="row">
                    <div class="col offset-1">
                        <p class="bold">${task.key.question} <i>(${task.key.time} min)</i></p>
                        <div class="form-item checkboxes">
                            <p style="color: red">${task.value}</p>
                            <p>${task.key.answer}</p>
                        </div>
                    </div>
                    <div class="col">
                        <a class="test-edit" href="${pageContext.request.contextPath}/owner/Task?task=${task.key.id}">
                            <i class="fa fa-trash font-green"></i> Show
                        </a>
                        <a class="test-edit" href="${pageContext.request.contextPath}/edit/EditTask?task=${task.key.id}">
                            <i class="fa fa-cog font-green"></i> Edit
                        </a>
                    </div>
                </div>
                <hr>
            </c:forEach>
            <div class="col">

            </div>

        </div>
        <%@include file="/footer.jsp" %>
    </body>
</html>

