<%-- 
    Document   : Userbar.jsp
    Created on : Aug 23, 2016, 4:41:08 PM
    Author     : javlonboy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/checkUser.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:query var="programs" dataSource="jdbc/DB">
    select id, name from program where users = ${user.id};
</sql:query>

<sql:query var="studys" dataSource="jdbc/DB">
    select course, s.id, name, completed, (now()::date - start_date)+1 as day  from (study s join course c on s.course=c.id) join program p on c.program = p.id where s.users = ${user.id}</sql:query>  

<sql:query var="courses" dataSource="jdbc/DB">
    select course.*, name, duration, (start_date + interval '1 day'*duration)::date as end_date  from program join course on program.id=program where users = ${user.id}
</sql:query>


<%! String pageTitle = "Cabinet";%>
<%@include file="/header.jsp" %>
<%@include file="/bar.jsp" %>
<div class="row">
    <div class="col offset-2 col-8">
        <nav class="breadcrumbs">
            <ul>
                <li><a class="blue-link" href="${pageContext.request.contextPath}">Home</a></li>
                <li><span>Cabinet</span></li>
            </ul>
        </nav>
    </div>
</div>
<div class="row">
    <div class="col offset-2 col-8">
        <div class="row userbar-1">
            <div class="col col-3 text-right">
                <img src="${pageContext.request.contextPath}/file/user/ico/${user.id}.png" onerror="if (this.src != 'error.jpg') this.src = '${pageContext.request.contextPath}/resourse/img/cat_${user.id%8+1}.png';" alt="" class="img-circle">
            </div>
            <div class="col col-3">
                <br>
                <h1>${user.name}<br>${user.surname}</h1>
            </div>
            <div class="col text-center"> 
                <br>
                <br>
            </div>
        </div> 
    </div>
</div>
<div class="row userbar-2">
    <div class="col offset-2 col-8">
        <nav class="tabs space-top" data-component="tabs">
            <ul>
                <li class="active"><a href="#studys">Study</a></li>
                <li><a href="#courses">Course</a></li>
                <li><a href="#tool">Tool</a></li>
            </ul>
        </nav>
        <div id="studys">
            <c:forEach var="study" items="${studys.rows}">
                <div class="row">
                    <div class="col col-7">
                        <h3><a href="${pageContext.request.contextPath}/course/render?id=${study.course}">${study.name}</a>  <c:if test="${study.completed == 1}">completed</c:if></h3>
                        <span class="italic small muted">${study.day} day</span>
                    </div>
                    <div class="col col-5 text-right">
                    </div>
                </div>
                <hr class="space-both">
                <sql:query var="tasks" dataSource="jdbc/DB">
                    SELECT current_time between  (time '00:00' + interval '1 hour' * starttime) and (time '00:00' + (interval '1 hour'*starttime) + (interval '1 minute'*time)) as mayStart, 
                    id, name, total_count, passing_count, time, starttime, period 
                    FROM task 
                    where program=(select program from course where id=${study.course}) and current_date between (select start_date from course where id=${study.course}) + interval '1 day'*(day-1) and (select start_date from course where id=${study.course}) + interval '1 day'*(day-1+period-1)    
                    order by starttime
                </sql:query>
                <c:forEach var="task" items="${tasks.rows}">
                    <div class="row">  
                        <div class="col col-1 text-center align-middle">
                            <span>at</span><br>
                            <span>${task.starttime}:00</span>
                        </div>
                        <div class="col col-9">
                            <div>
                                <c:choose>
                                    <c:when test="${tasks.rowCount==0}">
                                        No today tasks!
                                    </c:when>
                                    <c:when test="${tasks.rowCount!=0}">
                                        <p class="bold">${task.name}</p>
                                        <p>
                                            at ${task.starttime}:00 ${task.time}m for ${task.total_count} tasks (passing: ${task.passing_count})
                                        </p>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col col-2 text-right">
                            <c:choose>
                                <c:when test="${task.mayStart}">
                                    <a href="${pageContext.request.contextPath}/task/work/${System.currentTimeMillis()}?s=${study.id}&t=${task.id}">
                                        <i title="Start task" class="fa fa-3x fa-play error" aria-hidden="true"></i>
                                    </a>
                                </c:when>
                                <c:otherwise>                                    
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <hr>
                </c:forEach>
            </c:forEach> 
        </div>
        <div id="courses">
            <c:forEach var="course" items="${courses.rows}">
                <div class="row">
                    <div class="col col-1 text-center align-middle">
                        <span>${course.duration}</span><br>
                        <span>day</span>
                    </div> 
                    <div class="col col-9">
                        <p class="bold">
                            <a class="blue-link" href="${pageContext.request.contextPath}/course/render?id=${course.id}">${course.name}</a>
                            <c:choose>
                                <c:when test="${course.opened==0}">
                                    <i title="All user can salf join to course " class="fa fa-eye font-green" aria-hidden="true" ></i>
                                </c:when>
                                <c:otherwise>
                                    <i title="Only you can join student to course" class="fa fa-eye" aria-hidden="true"></i>
                                </c:otherwise>
                            </c:choose>
                        </p>    
                        <p>
                            <span class="italic small muted">
                                from ${course.start_date} to ${course.end_date} 
                            </span>
                        </p>
                    </div>
                    <div class="col col-2 text-right">
                        <a class="blue-edit" href="${pageContext.request.contextPath}/task/edit/task?id=${course.id}">
                            <i class="fa fa-cog"></i> Edit
                        </a>
                    </div>

                </div>
                <hr>
            </c:forEach> 
        </div>
        <div id="tool">
            For creating course you need do next steps
            <ul>
                <li>Create new program</li>
                <li>Create same material ther;</li>
                <li>Create  test and Exem;</li>
                <li>Publish;</li>
            </ul>
            <a href="${pageContext.request.contextPath}/program/add"><button class="button round outline">Create new program</button></a>
            <a href="${pageContext.request.contextPath}/task/create/${System.currentTimeMillis()}"><button class="button round outline">Create task</button></a>
        </div>
    </div>
</div> 
<%@include file="/footer.jsp" %>

