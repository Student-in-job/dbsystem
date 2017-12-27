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
<div class="row blue-blok">
    <div class="col offset-2 col-8">
        <nav class="breadcrumbs">
            <ul>
                <li><a class="blue-edit" href="${pageContext.request.contextPath}/">Home</a></li>
                <li><a class="blue-edit" href="${pageContext.request.contextPath}/user/cabinet">Cabinet</a></li>
                <li><a class="blue-link" href="${pageContext.request.contextPath}/course/render?id=${course.id}">${course.name}</a></li>

                <c:choose>
                    <c:when test="${not empty param.id}">
                        <li><span>Edit task ${task.name}</span></li>
                        </c:when>
                        <c:otherwise>
                        <li><span>Add new task</span></li>
                        </c:otherwise>
                    </c:choose>
            </ul>
        </nav>
        <div class="row space-top">
            <div class="col col-7">
                <c:choose>
                    <c:when test="${not empty param.id}">
                        <h3>Edit task <span class="italic">${task.name}</span> in <span class="italic"> ${course.name}</span></h3>
                    </c:when>
                    <c:otherwise>
                        <h3>Add task in <span class="italic">${course.name}</span></h3>
                        </c:otherwise>
                    </c:choose>
            </div>
            <div class="col col-5 text-right">

            </div>
        </div>

        <hr class="space-both">

        <div class="row centered">
            <div class="col">
                <form id="form" class="form" action="" method="POST">
                    <input type="hidden" name="course" value="${course.id}"> 
                    <input type="hidden" name="id" value="${task.id}"> 
                    <div class="form-item">
                        <label>Name:</label>
                        <input required type="text" name="name" value="${task.name}">
                    </div>
                    <div class="row gutters">
                        <div class="col col-5">
                            <div class="form-item">
                                <label>Task service:</label>
                                <select required name="service" >
                                    <c:forEach items="${services}" var="service">
                                        <option <c:if test="${service.id == task.serviceId}">selected</c:if> value="${service.id}">${service.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col col-5">
                            <div class="form-item">
                                <label>List name:</label>
                                <select required name="group" >
                                    <c:forEach items="${tasks}" var="list">
                                        <option <c:if test="${list.key eq task.listId}">selected</c:if> value="${list.key}">${list.value}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label>Count:</label>
                        <input required  type="number" name="total_count" value="${task.count}">
                    </div>


                    <div class="form-item">
                        <label>Start:</label>
                        <div class="row gutters">
                            <div class="col col-5">
                                <div class="form-item">
                                    <input id="start_date"  name="start_date" required type="date" value="${task.startDate}">
                                    <input required type="hidden" id="start_day_input" name="start_date" value="${task.startDate.time}">
                                </div>
                                <div class="desc">Date</div>
                            </div>
                            <div class="col col-5">
                                <div class="form-item">
                                    <input required type="time" name="start_time" value="${task.startTime}">
                                    <div class="desc">Time</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label>End:</label>
                        <div class="row gutters">
                            <div class="col col-5">
                                <div class="form-item">
                                    <input id="end_date" name="end_date" required type="date" value="${task.endDate}">
                                </div>
                                <div class="desc">Date</div>
                            </div>
                            <div class="col col-5">
                                <div class="form-item">
                                    <input required type="time" name="end_time" value="${task.endTime}">
                                    <div class="desc">Time</div>
                                </div>
                            </div>
                        </div> 
                    </div>

                    <div class="form-item text-center">
                        <button class="button primary w25 big">Complete</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resourse/js/jquery.validate.min.js"></script> 
<script>
    $(document).ready(function () {
        a = new Date();
        a.setTime(${task.startDate.time})
        $("start_date").val(a);

        $("#form").validate({
            rules: {
                name: {
                    required: true,
                    maxlength: 64
                },
                period: {
                    required: true,
                    number: true,
                    min: 1
                },
                count: {
                    required: true,
                    number: true,
                    min: 1
                }

            }

        });
    }); //end of ready
</script> 
<%@include file="/footer.jsp" %>
