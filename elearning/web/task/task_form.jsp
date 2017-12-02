<%-- 
    Document   : CreateTask
    Created on : 05.09.2016, 11:17:11
    Author     : ksinn
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%@include file="/checkUser.jsp" %>
<%! String pageTitle = "Task";%>
<%@include file="/header.jsp" %>
<%@include file="/bar.jsp"%>
<div class="row centered registration">
    <div class="col col-4">

        <form id="form" class="form" action="" method="POST">
            <h3 class="text-centered">Task</h3>
            <input type="hidden" name="program" value="${program.id}"> 
            <input type="hidden" name="task" value="${task.id}"> 

            <div class="form-item">
                <label>Task service:</label>
                <select required name="service" >
                    <c:forEach items="${services}" var="service">
                        <option <c:if test="${service.id == task.serviceId}">selected</c:if> value="${service.id}">${service.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-item">
                <label>Group ID:</label>
                <select required name="group" >
                    <c:forEach items="${tasks}" var="list">
                        <option <c:if test="${list.key.equals(task.groupId)}">selected</c:if> value="${list.key}">${list.value}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-item">
                <label>Name:</label>
                <input class="width-100" required type="text" name="name" value="${task.name}">
            </div>

            <div class="form-item">
                <label>Day:</label>
                <input class="width-100" required type="number" name="day" value="${task.day}">
            </div>

            <div class="form-item">
                <label>Total Count:</label>
                <input class="width-100" required  type="number" name="total_count" value="${task.totalCount}">
            </div>

            <div class="form-item">
                <label>Passing Count:</label>
                <input class="width-100" required  type="number" name="passing_count" value="${task.passingCount}">
            </div>

            <div class="form-item">
                <label>Period:</label>
                <input class="width-100" required type="number" name="period" value="${task.period}">
            </div>

            <div class="form-item">
                <label>Start Time(hour):</label>
                <input class="width-100" required type="number" name="starttime" value="${task.startTime}">
            </div>

            <div class="form-item">
                <label>Time(in minuts):</label>
                <input class="width-100" required type="number" name="time" value="${task.time}">
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
                name: {
                    required: true,
                    maxlength: 64
                },
                day: {
                    required: true,
                    number: true,
                    min: 1
                },
                period: {
                    required: true,
                    number: true,
                    min: 1
                },
                starttime: {
                    required: true,
                    number: true,
                    min: 0
                },
                time: {
                    required: true,
                    number: true,
                    min: 1
                },
                group: {
                    required: true,
                    number: true,
                    min: 1
                },
                total_count: {
                    required: true,
                    number: true,
                    min: 1
                },
                passing_count: {
                    required: true,
                    number: true,
                    min: 1
                }

            }

        });


    }); //end of ready
</script> 
<%@include file="/footer.jsp" %>
