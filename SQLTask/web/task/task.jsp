<%-- 
    Document   : Test
    Created on : 13.07.2016, 16:56:55
    Author     : ksinn
--%>
<%!String pageTitle = "Task";%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/header.jspf"%>

<div class=" test">
    <div class="row ">
        <div class="col col-3 offset-1">
            <h4><a href="list?id=${task.list.id}">${task.list.name}</a></h4>
            <h4>Time: ${task.time}</h4>
            <h4>Ball: ${task.ball}</h4>
        </div>
        <div class="col col-1">
            <a class="test-edit" href="edit/task?id=${task.id}">
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
        <c:choose>
            <c:when test="${task.exception!=null}">
                <b style="color: #f00">${task.exception.message}</b>
            </c:when>                
            <c:when test="${task.executeResult!=null}">
                <table>
                    <c:forEach var="row" items="${task.executeResult}">
                        <tr>
                            <c:forEach var="cell" items="${row}">
                                <td>${cell}</td>
                            </c:forEach>
                        </tr> 
                    </c:forEach>
                </table> 
            </c:when>
        </c:choose>
    </div>
    <%--
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
    --%>

</div>

<%@include file="/footer.jspf"%>

