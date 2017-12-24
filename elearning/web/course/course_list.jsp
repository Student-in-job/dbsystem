<%-- 
    Document   : Program.jsp
    Created on : Aug 25, 2016, 1:52:15 PM
    Author     : javlonboy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@include file="/checkUser.jsp" %>

<sql:query var="courses" dataSource="jdbc/DB">
    select open, course.id as id, start_date, program, name, duration, description, users, (select concat(name, ' ', surname) from users where id=users) as user_name
    from course join program on program = program.id where course.id=?
    <sql:param value="${Integer.parseInt(param.id)}"/>
</sql:query>

<c:forEach items="${courses.rows}" var="course">

    <c:if test="${courses.rowCount != 1}">
        <c:redirect url="/error" />
    </c:if>
    <c:if test="${course.users == user.id}">
        <c:set var="tuter" value="true"/>
    </c:if>

    <sql:query var="tasks" dataSource="jdbc/DB">
        SELECT id, name, total_count, time, day, starttime, to_char((select start_date from course where id=${course.id}) + interval '1 day' * (day-1), 'DD/MM') AS startday
        FROM task 
        where program = ${course.program}
        order by day, starttime
    </sql:query>
    <%--
    <sql:query var="materials" dataSource="jdbc/DB">
        select * from material where program = ${course.program};
    </sql:query>
    --%>    
    <sql:query var="students" dataSource="jdbc/DB">
        select * from users where exists (select * from study where users = users.id and course=${course.id} and completed=0) order by surname
    </sql:query>


    <%! String pageTitle = "Course";%>
    <%@include file="/header.jsp" %>
    <%@include file="/bar.jsp" %>
    <div class="row">
        <div class="col offset-2 col-8">
            <nav class="breadcrumbs">
                <ul>
                    <li><a class="blue-link" href="${pageContext.request.contextPath}">Home</a></li>
                    <li><a class="blue-link" href="${pageContext.request.contextPath}/courses">Courses</a></li>
                    <li><span>${course.name}</span></li>
                </ul>
            </nav>
        </div>
    </div>
    <div class="row course-2">
        <div class="col offset-2 col-8">
            <div class="row">
                <div class="col">
                    <h3>${course.name}</h3>
                </div>
            </div>
            <div class="row green-bg">
                <div class="col col-4">
                    <img src="${pageContext.request.contextPath}/${initParam.FileDir}/program/${course.program}.jpg" 
                         onerror="if (this.src != 'error.jpg') this.src = '${pageContext.request.contextPath}/resourse/img/default_program.png';">
                </div>
                <div class="col col-6 text-left">
                    <p class="space-top">
                        Start date: ${course.start_date} <br> 
                        Duration: ${course.duration} days<br> 
                        Teacher:  ${course.user_name}<br>  
                        <c:if test="${course.open==1}">
                            <button onclick="join()" class="button small round error">JOIN</button>
                        </c:if>
                    </p>
                </div>
                <div class="col col-2 text-right">
                    <c:if test="${tuter}">
                        <a class="white-edit">
                            <i class="fa fa-play font-con" aria-hidden="true"> Start</i>
                        </a>
                        <a class="white-edit">
                            <i class="fa fa-pause font-con" aria-hidden="true"> Stop</i>
                        </a>
                        <a class="white-edit"  href="${pageContext.request.contextPath}/task/add/list">
                            <i class="fa fa-plus font-con" aria-hidden="true"> Edit</i>
                        </a>
                    </c:if>
                </div>
            </div>
            <div class="row">
                <div class="col space-top">
                    <p>
                        ${course.description}
                    </p>
                </div>
            </div>
            <div class="row centered">
                <div class="col">
                    <nav class="tabs" data-component="tabs" data-equals="true">
                        <ul>
                            <li class="active"><a href="#tasks">TASK</a></li>
                            <li><a href="#students">STUDENTS</a></li>
                            <li><a href="#marks">RESULT</a></li>
                        </ul>
                    </nav>
                    <div id="tasks">
                        <div class="row">
                            <div class="col offset-10 col-2 text-right">
                                <p>
                                    <c:if test="${tuter}"> 
                                        <a class="green-edit" href="${pageContext.request.contextPath}/task/add?id=${course.program}">
                                            <i class="fa fa-plus font-green" aria-hidden="true"> Add task</i>
                                        </a>
                                    </c:if>
                                </p>
                            </div>
                        </div>
                        <c:forEach items="${tasks.rows}" var="task">  
                            <div class="row">  
                                <div class="col col-1 text-center align-middle">
                                    <span>${task.startday}</span><br>
                                    <span>${task.day} day</span><br>
                                </div>
                                <div class="col col-9">
                                    <div>
                                        <p class="bold">
                                            ${task.name}
                                        </p>
                                        <p>
                                            ${task.total_count} tasks at ${task.starttime}:00 till ${task.starttime + Integer.valueOf(task.time/60)}:${Integer.valueOf(task.time)%60==0?"00":Integer.valueOf(task.time)%60}
                                        </p>
                                    </div>
                                </div>
                                <div class="col col-2 text-right">
                                    <c:if test="${tuter}"> 
                                        <a class="green-edit" href="${pageContext.request.contextPath}/task/edit?id=${task.id}">
                                            <i class="fa fa-cog green-edit" aria-hidden="true"> Edit</i>
                                        </a>
                                    </c:if>
                                </div>
                            </div>
                            <hr>
                        </c:forEach>                  
                    </div>
                    <div id="students">
                        <div class="row">
                            <div class="col offset-10 col-2 text-right">
                                <p>
                                    <c:if test="${tuter}"> 
                                        <a class="green-edit" href="${pageContext.request.contextPath}/task/add/list">
                                            <i class="fa fa-plus font-green" aria-hidden="true"> Add student</i>
                                        </a>
                                    </c:if>
                                </p>
                            </div>
                        </div>
                        <c:forEach items="${students.rows}" var="student"> 
                            <div class="row">  
                                <div class="col col-1 text-center align-middle">
                                    <br><br>
                                </div>
                                <div class="col col-9">
                                    <div>
                                        ${student.surname} ${student.name}
                                    </div>
                                </div>
                                <div class="col col-2 text-right">
                                </div>
                            </div>
                            <hr>
                        </c:forEach>                        
                    </div>
                    <div id="marks">
                        <nav class="tabs space-top" data-component="tabs">
                            <ul>
                                <c:forEach items="${tasks.rows}" var="task">
                                    <li>
                                        <a href="#task${task.id}">${task.name}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </nav>
                        <c:forEach items="${tasks.rows}" var="task">
                            <sql:query var="res" dataSource="jdbc/DB">
                                select mail ,users, name, surname, (select max(completed) from work where task = ${task.id} and study = study.id) as result 
                                from study join users on users.id = users 
                                where course = ${course.id}  
                                order by result                    
                            </sql:query>
                            <div id="task${task.id}">
                                <table calss="bordered striped">
                                    <tr>
                                        <th>mail</th>
                                        <th>Name</th>
                                        <th>Result</th>
                                    </tr>
                                    <c:forEach items="${res.rows}" var="res">
                                        <tr>
                                            <td>${res.mail}</td>
                                            <td>${res.surname} ${res.name}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${res.result == -1}">
                                                        not completed
                                                    </c:when>
                                                    <c:when test="${res.result == null}">
                                                        no attempt
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${res.result}
                                                    </c:otherwise>
                                                </c:choose>                                        
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>                   

    <div id="my-modal" class="modal-box hide">
        <div class="modal">
            <span class="close"></span>
            <div class="modal-header"></div>
            <div id="modalBody" class="modal-body text-center">

            </div>
        </div>
    </div>
    <script>
        function join() {

            $.ajax("${pageContext.request.contextPath}/course/join?id=${course.id}", {
                        method: 'get',
                        success: function (result) {
                            document.getElementById("modalBody").innerHTML = result;
                            $.modalwindow({target: '#my-modal', width: '300px', header: 'Response'});
                        }
                    });

                }
    </script>
    <%@include file="/footer.jsp" %>
</c:forEach>