<%-- 
    Document   : Program.jsp
    Created on : Aug 25, 2016, 1:52:15 PM
    Author     : javlonboy
    Страница информации о программе.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/checkUser.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:query var="programs" dataSource="jdbc/DB">
    select * from program where id = ? and users = ${user.id}
    <sql:param value="${Integer.parseInt(param.id)}"/>
</sql:query>
<c:if test="${programs.rowCount != 1}">
    <c:redirect url="/error" />
</c:if>
<c:forEach items="${programs.rows}" var="program">
    <sql:query var="tasks" dataSource="jdbc/DB">
        select * from task where program = ${program.id};
    </sql:query>
    <%--
    <sql:query var="materials" dataSource="jdbc/DB">
        select * from material where program = ${program.id};
    </sql:query>
    --%>
    <%! String pageTitle = "Program";%>
    <%@include file="/header.jsp" %>
    <div  class="box " >
        <div id="mesagge" class="middle-text"></div>
    </div>
    <%@include file="/bar.jsp" %>
    <div class="row centered">
        <div class="col col-8">
            <h2>${program.name}</h2>
            <div class="row green-bg">
                <div class="col">
                    <img src="${pageContext.request.contextPath}/${initParam.FileDir}/program/${program.id}.jpg" onerror="if (this.src != 'error.jpg') this.src = '${pageContext.request.contextPath}/resourse/img/default_program.png';" alt="" class="float-left" style="margin-right: 20px; margin-bottom: 20px;">
                    <p class="middle">
                        Duration: ${program.duration} days<br>
                        <a href="${pageContext.request.contextPath}/program/edit?id=${program.id}"><button class="button small round primary">UPDATE</button></a>
                        <a href="${pageContext.request.contextPath}/course/add?id=${program.id}"><button class="button small round error">START COURSE</button></a>   
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col space-top">
                    <p>
                        ${program.description}
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="row centered  course-2">
        <div class="col col-8">
            <nav class="tabs" data-component="tabs" data-equals="true">
                <ul>
                    <li class="active"><a href="#material">MATERIAL</a></li>
                    <li><a href="#task">TASK</a></li>
                </ul>
            </nav>
            <%--
                    <div id="material"  >
                        <c:forEach items="${materials.rows}" var="material">                   
                            <div class="row">
                                <div class="col">
                                    <p>
                                        <a href = "${pageContext.request.contextPath}/material/render?id=${material.id}">${material.name}</a> 
                                    </p>
                                </div>
                                <c:if test="${admin}">                           
                                    <div>
                                        <a href="${pageContext.request.contextPath}/material/edit?id=${material.id}"><button class="button small round primary">UPDATE</button></a>
                                    </div>
                                </c:if>
                            </div>
                        </c:forEach>            
                        <div class="row">
                            <div class="col">
                                <p>
                                    Create new material 
                                </p>
                            </div>
                            <div>
                                <a href="${pageContext.request.contextPath}/material/add?p=${program.id}"><button class="button small round success">ADD</button></a>
                            </div>
                        </div>                      
                    </div>
            --%>

            <div id="task">
                <c:forEach items="${tasks.rows}" var="task">                              
                    <div class="row">
                        <div class="col">
                            <h6>${task.name}</h6>
                            <p>
                                ${task.time}m (at ${task.starttime}) duaring ${task.period} d
                                Yoy need take ${task.passing_count} from ${task.total_count} tasks
                            </p>
                        </div>
                        <div>
                            <a href="${pageContext.request.contextPath}/task/edit?id=${task.id}"><button class="button small round primary">UPDATE</button></a>
                        </div> 
                    </div>
                </c:forEach>
                <div class="row">
                    <div class="col">
                        <p>
                            Create new task 
                        </p>
                    </div>
                    <div>
                        <a href="${pageContext.request.contextPath}/task/add?id=${program.id}"><button class="button small round success">ADD</button></a>
                    </div>
                </div>                 
            </div>
        </div>
    </div>
    <%@include file="/footer.jsp" %>
</c:forEach>