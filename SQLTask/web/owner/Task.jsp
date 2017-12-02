<%-- 
    Document   : Test
    Created on : 13.07.2016, 16:56:55
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/Error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task</title>
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
                    <h4><a href="Group?group=${task.list.id}">${task.list.name}</a></h4>
                    <h4>Time: ${task.time}</h4>
                    <h4>Ball: ${task.ball}</h4>
                </div>
                <div class="col col-1">
                    <a class="test-edit" href="${pageContext.request.contextPath}/edit/EditTask?task=${task.id}">
                        <i class="fa fa-cog font-green" aria-hidden="true"></i>
                        Edit
                    </a>
                </div>
            </div>
            <hr>            
            <div class="col">
                <img class="db-schem" src="${task.img}">
            </div>
            <div class="col">
                <p>${task.question}</p>
                <b>${task.answer}</b><br>
                <b style="color: #f00">${er.message}</b>
               <table>
                   <c:forEach var="row" items="${rs}">
                    <tr>
                        <c:forEach var="cell" items="${row}">
                        <td>${cell}</td>
                        </c:forEach>
                    </tr> 
                    </c:forEach>
                </table>              
            </div>
               
               <div class="col">
                   <form method="post">
                       <input name="task" value="${task.id}">
                       <textarea name="answer">${param.answer}</textarea>
                       <input type="submit">
                   </form>              
            </div>
               
               <div class="col">
                <b style="color: #f00">${testExp}</b>
               <table>
                   <c:forEach var="row" items="${testArray}">
                    <tr>
                        <c:forEach var="cell" items="${row}">
                        <td>${cell}</td>
                        </c:forEach>
                    </tr> 
                    </c:forEach>
                </table>              
            </div>

        </div>
<%@include file="/footer.jsp" %>
    </body>
</html>