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
    select id, name from program where user = ${user.id};
</sql:query>
<sql:query var="studys" dataSource="jdbc/DB">
    select course, s.id, name, completed  from (study s join course c on s.course=c.id) join program p on c.program = p.id where s.user = ${user.id}</sql:query>  
<sql:query var="courses" dataSource="jdbc/DB">
    select course.*, name  from program join course on program.id=program where user = ${user.id}
</sql:query>


<%! String pageTitle = "Cabinet";%>
<%@include file="/header.jsp" %>
<div class=userbar>
    <%@include file="/bar.jsp" %>
    <div class="row userbar-1">
        <div class="col col-3 text-right">
            <img src="${pageContext.request.contextPath}/${initParam.FileDir}/user/${user.id}.jpg" onerror="if (this.src != 'error.jpg') this.src = '${pageContext.request.contextPath}/resourse/img/default_user.png';" alt="" class="img-circle">
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
    <div class="row userbar-2 ">
        <div class="col col-2 offset-1 nav">
            <a href="#studys" class="tablink  a-blue" onclick="openTab(event, 'studys')">STUDYS</a>
            <a href="#courses" class="tablink" onclick="openTab(event, 'courses')">COURSES</a>
            <a href="#program" class="tablink" onclick="openTab(event, 'program')">PROGRAMS</a>
            <a href="#create" class="tablink" onclick="openTab(event, 'create')">CREATE</a>
        </div>
        <div class="col col-8 border">


            <div id="program" class="courses">
                <h3>Program</h3>
                <c:forEach var="program" items="${programs.rows}">
                    <ul>
                        <li>
                            <a href="${pageContext.request.contextPath}/program/render?id=${program.id}">${program.name}</a>
                            <c:if test="${program.course != null}">
                                (<a href="${pageContext.request.contextPath}/course/render?id=${program.course}">course</a>)
                            </c:if>
                            <a href="${pageContext.request.contextPath}/course/add?id=${program.id}"><button class="button small round error">ADD COURSE</button></a>
                        </li>
                    </ul>     
                </c:forEach>                                                                               
            </div>

            <div id="studys" class="courses">
                <h3>Study</h3>
                <c:forEach var="study" items="${studys.rows}">
                    <sql:query var="tasks" dataSource="jdbc/DB">
                        SELECT time(now()) between  time(date(now()) + interval starttime hour) and time(date(now()) + interval starttime hour + interval time minute) as mayStart, id, name, total_count, passing_count, time, starttime, period FROM task where date(now()) between (select start_date from course where id=${study.course}) + interval day-1 day and (select start_date from course where id=${study.course}) + interval day-1+period-1 day                    
                    </sql:query>
                    <p>
                        <a href="${pageContext.request.contextPath}/course/render?id=${study.course}">${study.name}</a>  <c:if test="${study.completed == 1}">completed</c:if>
                        </p>
                        <div>
                        <c:choose>
                            <c:when test="${tasks.rowCount==0}">
                                No today tasks!
                            </c:when>
                            <c:when test="${tasks.rowCount!=0}">
                                <c:forEach items="${tasks.rows}" var="task"> 
                                            <h6>${task.name}</h6>
                                            <p>
                                                at ${task.starttime}:00 ${task.time}m for ${task.total_count} tasks (passing: ${task.passing_count})
                                            </p>
                                            <p>
                                                <c:if test="${task.mayStart==1}">
                                                    <a href="${pageContext.request.contextPath}/task/work/${System.currentTimeMillis()}?s=${study.id}&t=${task.id}"><button class="button round outline">Start</button></a>
                                                </c:if>
                                            </p>
                                </c:forEach> 
                            </c:when>
                        </c:choose>
                    </div>
                    <div>

                    </div>
                </c:forEach>                                                                               
            </div>

            <div id="courses" class="courses">
                <h3>Courses</h3>
                <c:forEach var="course" items="${courses.rows}">
                    <p>
                        <a href="${pageContext.request.contextPath}/course/render?id=${course.id}">${course.name}</a> from ${course.start_date} <c:if test="${course.closed==0}">closed</c:if> 
                        </p>     
                </c:forEach>                                                                               
            </div>

            <div id="create" class="courses">
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
</div> 
<!-- Kube JS + jQuery are used for some functionality, but are not required for the basic setup -->
<script src="${pageContext.request.contextPath}/resourse/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resourse/js/kube.min.js"></script>
<script>
                document.getElementById("studys").style.display = "block";
                function openTab(evt, cityName) {
                    var i, x, tablinks;
                    x = document.getElementsByClassName("courses");
                    for (i = 0; i < x.length; i++) {
                        x[i].style.display = "none";
                    }
                    tablinks = document.getElementsByClassName("tablink");
                    for (i = 0; i < x.length; i++) {
                        tablinks[i].className = tablinks[i].className.replace(" a-blue", "");
                    }
                    document.getElementById(cityName).style.display = "block";
                    evt.currentTarget.className += " a-blue";
                }

</script>
<%@include file="/footer.jsp" %>

