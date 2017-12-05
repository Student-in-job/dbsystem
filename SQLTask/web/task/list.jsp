<%-- 
    Document   : Group
    Created on : 23.10.2016, 20:18:31
    Author     : ksinn
--%>
<%!String pageTitle = "List";%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/header.jspf"%>

<div class=" test">
    <div class="row ">
        <div class="col col-3 offset-1">
            <h3>${list.name}</h3>
            <c:if test="${list.isPublic()}">
                <h4 style="color: red">Public list</h4>
                <p>All user can use this list</p>
            </c:if>
            <h4>Count of task: ${list.tasks.size()}</h4>
        </div>
        <div class="col col-1">
            <a class="test-edit" href="edit/list?id=${list.id}">
                <i class="fa fa-cog font-green" aria-hidden="true"></i>
                Edit
            </a>
            <a class="test-edit" href="${pageContext.request.contextPath}/owner/CheckGroup?group=${list.id}">
                <i class="fa fa-cog font-green" aria-hidden="true"></i>
                Check
            </a>
        </div>
        <div class="col">
            <a href="add/task?list=${list.id}" class="button small round success outline">
                Add task <i class="fa fa-plus" aria-hidden="true"></i>
            </a>
            <a href="${pageContext.request.contextPath}/admin/DataBaseManager?group=${list.id}" class="button small round success outline">
                DBM <i class="fa fa-plus" aria-hidden="true"></i>
            </a>
        </div>
    </div>
    <hr>
    <c:forEach var="task" items="${list.tasks}">
        <div class="row">
            <div class="col offset-1">
                <p class="bold">${task.question} <i>(${task.time} min)</i></p>
                <div class="form-item checkboxes">
                    <p>${task.answer}</p>
                </div>
            </div>
            <div class="col">
                <a class="test-edit" href="task?id=${task.id}">
                    <i class="fa fa-trash font-green"></i> Show
                </a>
                <a class="test-edit" href="${pageContext.request.contextPath}/edit/task?id=${task.id}">
                    <i class="fa fa-cog font-green"></i> Edit
                </a>
            </div>
        </div>
        <hr>
    </c:forEach>
    <div class="col">

    </div>


    <%@include file="/footer.jspf"%>




