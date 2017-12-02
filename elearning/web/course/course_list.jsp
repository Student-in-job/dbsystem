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
    select course.id as id, start_date, program, name, duration, description, user, (select concat(name, ' ', surname) from user where id=user) as user_name
    from course join program on program = program.id where course.id=?
    <sql:param value="${param.id}"/>
</sql:query>
    
<c:forEach items="${courses.rows}" var="course">
    
    <c:if test="${courses.rowCount != 1}">
        <c:redirect url="/error" />
    </c:if>
    <c:if test="${course.user == user.id}">
        <c:set var="tuter" value="true"/>
    </c:if>
    
    <sql:query var="tasks" dataSource="jdbc/DB">
        SELECT id, name, total_count, passing_count, time, period, starttime, (select start_date from course where id=${course.id}) + interval day-1 day AS startday, (select start_date from course where id=${course.id}) + interval day-1+period-1 day AS endday  FROM task;
    </sql:query>
    <%--
    <sql:query var="materials" dataSource="jdbc/DB">
        select * from material where program = ${course.program};
    </sql:query>
    --%>    
    <sql:query var="students" dataSource="jdbc/DB">
        select * from user where exists (select * from study where user = user.id and course=${course.id} and completed=0)
    </sql:query>
        
        
    <%! String pageTitle = "Course";%>
    <%@include file="/header.jsp" %>
    <div  class="box " >
        <div id="mesagge" class="middle-text"></div>
    </div>
    <%@include file="/bar.jsp" %>
    <div class="row centered">
        <div class="col col-8">
            <h3>${course.name}</h3>
            <div class="row green-bg">
                <div class="col">
                    <img src="${pageContext.request.contextPath}/${initParam.FileDir}/program/${course.program}.jpg" onerror="if (this.src != 'error.jpg') this.src = '${pageContext.request.contextPath}/resourse/img/default_program.png';" alt="" class="float-left" style="margin-right: 20px; margin-bottom: 20px;">
                    <p class="middle">
                        Start date: ${course.start_date} <br> 
                        Duration: ${course.duration} days<br> 
                        Teacher:  ${course.user_name}<br>  
                        <c:if test="${course.open==1}">
                            <a href="${pageContext.request.contextPath}/course/join?id=${course.id}"><button class="button small round error">JOIN</button></a>
                        </c:if>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col space-top">
                    <p>
                        ${course.description}
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="row centered  course-2">
        <div class="col col-8">
            <nav class="tabs" data-component="tabs" data-equals="true">
                <ul>
                    <li><a href="#material">MATERIAL</a></li>
                    <li class="active"><a href="#task">TASK</a></li>
                    <li><a href="#tab13">STUDENTS</a></li>
                        <c:if test="${tuter}">
                        <li><a href="#result">RESULT</a></li>
                        </c:if>
                </ul>
            </nav>
            <%--<div id="material"  >
                <c:forEach items="${materials}" var="material">                   
                    <div class="row">
                        <div class="col">
                            <p>
                                <a href = "${pageContext.request.contextPath}/material/Material?id=${material.id}">${material.name}</a> 
                            </p>
                        </div>
                    </div>
                </c:forEach>                      
            </div>                
            --%>
            <div id="task">
                <c:forEach items="${tasks.rows}" var="task">  
                    <div class="row">
                        <div class="col">
                            <h6>${task.name}</h6>
                            <p>
                                at ${task.starttime}:00 <c:choose><c:when test="${task.period==1}">${task.startday}</c:when><c:when test="${task.period!=1}">from ${task.startday} to ${task.endday}</c:when></c:choose>
                                <br>${task.time}m for ${task.total_count} tasks (passing: ${task.passing_count})
                            </p>
                        </div>                           
                    </div>
                </c:forEach>                  
            </div>
            <div id="tab13">
                <c:forEach items="${students.rows}" var="student">                              
                    <div class="row">
                        <div class="col">
                            <p>
                                ${student.name} ${student.surname}
                            </p>
                        </div>                           
                    </div>
                </c:forEach>
                <c:if test="${tuter}"> 
                    <div class="row">
                        <div class="col">
                            <p>
                                Add new student 
                            </p>
                        </div>
                        <div>
                            <a href="${pageContext.request.contextPath}/program/AddStudents?id=${course.id}"><button class="button small round success">ADD</button></a>
                        </div>
                    </div>
                </c:if>
            </div>
            <c:if test="${tuter}">
                <div id="result">
                    <table>
                        <c:forEach var="row" items="${marks}">
                            <tr>
                                <c:forEach var="cell" items="${row}">
                                    <td>${cell}</td>
                                </c:forEach>
                            </tr> 
                        </c:forEach>
                    </table>                
                </div>
            </c:if>
        </div>
    </div>
    <%@include file="/footer.jsp" %>
</c:forEach>