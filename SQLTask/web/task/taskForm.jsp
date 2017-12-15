<%-- 
    Document   : CreateTask
    Created on : 05.09.2016, 11:17:11
    Author     : ksinn
--%>
<%!String pageTitle = "Task";%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/header.jspf"%>

<div class="row centered registration">
    <div class="col col-4">

        <form id="form" class="form" action="" method="POST">
            <h3 class="text-centered">Task</h3>
            <input type="hidden" name="list" value="${task.list.id}"> 
            <input type="hidden" name="id" value="${task.id}"> 

            <div class="form-item sql-teatarea">
                <label>Question:</label>
                <textarea id="input" required name="question">${task.question}</textarea>
            </div>

            <div class="form-item sql-teatarea">
                <label>SQL answer:</label>
                <c:if test="${task.exception!=null}">
                    <b style="color: #f00">${task.exception.message}</b>
                </c:if>  
                <textarea required name="answer">${task.answer}</textarea>
            </div>

            <div class="form-item">
                <label>Image:</label> 
                <input class="width-100" type="text" name="img" value="${task.img}">
            </div>

            <div class="form-item">
                <label>Time(in minuts):</label>
                <input class="width-100" min="1" type="number" name="time" value="${task.time}">
            </div>


            <div class="form-item">
                <label>Ball:</label>
                <input class="width-100" min="1" type="number" name="ball" value="${task.ball}">
            </div>

            <div class="form-item">
                <button class="button primary width-100 big">Complete</button>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script> 
<script>
    $(document).ready(function () {

        $("#form").validate({
            rules: {
                answer: {
                    required: true,
                    minlength: 10,
                    maxlength: 500
                },
                question: {
                    required: true,
                    minlength: 10,
                    maxlength: 1000
                },
                time: {
                    number: true,
                    min: 0,
                    max: 120
                },
                ball: {
                    number: true,
                    min: 0,
                    max: 100
                }

            }

        });


    }); //end of ready
</script> 


<%@include file="/footer.jspf"%>


