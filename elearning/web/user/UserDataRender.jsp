<%-- 
    Document   : Userbar.jsp
    Created on : Aug 23, 2016, 4:41:08 PM
    Author     : javlonboy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Userbar :: ${initParam.SiteName} &mdash; 2016 </title>
        <link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">


    </head>
    <body>
        <div class=userbar>
            <%@include file="/header.jsp" %>
            <div class="row userbar-1">
                <div class="col col-3 text-right">
                    <img src="${pageContext.request.contextPath}/${user.ico}" alt="" class="img-circle">
                </div>
                <div class="col col-3">
                    <br>
                    <p>
                        Name: ${user.name} ${user.surname} <br>
                        Gender: ${user.genderString} <br>
                    </p>
                </div>
                <div class="col text-center"> 
                    <br>
                    <br>
                    <c:if test="${user != null}"><a class="button round outline" href="${pageContext.request.contextPath}/user/UserSettings">Settings &rarr;</a></c:if>
                </div>
            </div>
            <div class="row userbar-2 ">
                <div class="col col-2 offset-1 nav">
                    <a href="#created_courses" class="tablink" onclick="openTab(event, 'created_courses')">Created courses</a>
                    <a href="#published_courses" class="tablink" onclick="openTab(event, 'published_courses')">Published courses</a>
                    <a href="#learn_courses" class="tablink  a-blue" onclick="openTab(event, 'learn_courses')">Current courses</a>
                    <a href="#finished_courses" class="tablink" onclick="openTab(event, 'finished_courses')">Studied courses</a>
                    <a href="#create" class="tablink" onclick="openTab(event, 'create')">Create course</a>
                </div>
                <div class="col col-8 border">
                    
                        
                            <div id="created_courses" class="courses">
                                <h3>Created courses</h3>
                                <c:forEach var="program" items="${created_program}">
                                <p>
                                    <a href="${pageContext.request.contextPath}/program/Course.jsp?id=${program.iD}">${program.name}</a>
                                </p>     
                                </c:forEach>                                                                               
                            </div>
                    
                            <div id="published_courses" class="courses">
                                <h3>Published courses</h3>
                                <c:forEach var="program" items="${published_courses}">
                                <p>
                                    <a href="${pageContext.request.contextPath}/program/Course.jsp?id=${program.iD}">${program.name}</a>
                                </p>     
                                </c:forEach>                                                                               
                            </div>
                            
                            <div id="learn_courses" class="courses">
                                <h3>Learn courses</h3>
                                <c:forEach var="program" items="${learn_cours}">
                                <p>
                                    <a href="${pageContext.request.contextPath}/program/Course.jsp?id=${program.iD}">${program.name}</a>
                                </p>     
                                </c:forEach>                                                                               
                            </div>
                            
                            <div id="finished_courses" class="courses">
                                <h3>Finished courses</h3>
                                <c:forEach var="program" items="${finished_courses}">
                                <p>
                                    <a href="${pageContext.request.contextPath}/program/Course.jsp?id=${program.iD}">${program.name}</a>
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
                            <a href="${pageContext.request.contextPath}/program/CreateProgram.jsp"><button class="button round outline">Create course</button></a>
                            <a href="${pageContext.request.contextPath}/program/RederectTask.jsp"><button class="button round outline">Create task</button></a>
                        </div>
                </div>
            </div>
        </div>  
        <%@include file="/footer.jsp" %>
        <!-- Kube JS + jQuery are used for some functionality, but are not required for the basic setup -->
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/kube.min.js"></script>
        <script>
            document.getElementById("learn_courses").style.display = "block";
            
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

    </body>
</html>
