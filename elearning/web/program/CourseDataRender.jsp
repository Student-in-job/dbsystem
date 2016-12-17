<%-- 
    Document   : Program.jsp
    Created on : Aug 25, 2016, 1:52:15 PM
    Author     : javlonboy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Course :: ${initParam.SiteName} &mdash; 2016 </title>
        <link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/kube.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/extend/tabs.js"></script>
    </head>
    <body>
        <div  class="box " >
            <div id="mesagge" class="middle-text"></div>
        </div>
        <%@include file="/header.jsp" %>
        <div class="row centered">
            <div class="col col-8">
                <h3>${program.name}</h3>

                <div class="row green-bg">



                    <div class="col">
                        <img src="${pageContext.request.contextPath}/${course.program.ico}" alt="" class="float-left" style="margin-right: 20px; margin-bottom: 20px;">
                        <p class="middle">
                            Area: <a href="${pageContext.request.contextPath}/program/Courses?area_id=${course.program.area.id}">${course.program.area.name}</a><br>
                            Duration: ${course.program.duration} days<br>
                            Start date: ${course.startDate}<br>
                            End date: ${course.endDate}<br>
                            Level: ${course.program.level}<br>
                            Teacher: <a href="${pageContext.request.contextPath}/user/Profile?id=${course.program.user.id}"> ${course.program.user.name} ${course.program.user.surname}</a> <br>
                            <c:if test="${student}">                           
                                <a href="${pageContext.request.contextPath}/program/StartCourse?id=${course.id}"><button class="button small round error">START</button></a>
                            </c:if>     
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col space-top">
                        <p>
                            ${course.program.description}
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
                        <li><a href="#test">TEST</a></li>
                        <li><a href="#task">TASK</a></li>
                        <li><a href="#tab13">STUDENTS</a></li>
                        <c:if test="${admin}">
                        <li><a href="#result">RESULT</a></li>
                        </c:if>
                    </ul>
                </nav>
                <div id="material"  >
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
                <div id="test">
                <c:forEach items="${tests}" var="test">                              
                    <div class="row">
                        <div class="col">
                            <p>
                                <a href = "${pageContext.request.contextPath}/test/StartTest?id=${test.id}">${test.name}</a>
                            </p>
                        </div>                                              
                    </div>
                </c:forEach>                       
                </div>
                <div id="task">
                    <c:forEach items="${tasks}" var="task">                              
                        <div class="row">
                            <div class="col">
                                <p>
                                    <a href = "${pageContext.request.contextPath}/task/StartTask?id=${task.id}">${task.name}</a>
                                </p>
                            </div>                           
                        </div>
                    </c:forEach>                  
                </div>
                 <div id="tab13">
                    <c:forEach items="${students}" var="student">                              
                        <div class="row">
                            <div class="col">
                                <p>
                                    <a href = "${pageContext.request.contextPath}/user/Profile?id=${student.id}">${student.name} ${student.surname}</a>
                                </p>
                            </div>                           
                        </div>
                    </c:forEach>
                    <c:if test="${admin}"> 
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
                <c:if test="${admin}">
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
    </body>
</html>