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
        <title>Program :: ${initParam.SiteName} &mdash; 2016 </title>
        <link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/kube.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/extend/tabs.js"></script>
        <script>  
        function publish()  
        {  
            $.ajax({  
                url: "${pageContext.request.contextPath}/program/Publishe?id=${program.id}", 
                method: 'POST',
                cache: false, 
                error: function(){
                    document.getElementById('mesagge').style.display = 'block';
                    $("#mesagge").html("Error");
                },
                success: function(data){
                    
                        document.getElementById('mesagge').style.display = 'block';
                        $("#mesagge").html(data); 
                        
                }  
            });  
        } 
         
    </script> 
        
    </head>
    <body>
        <div  class="box " >
            <div id="mesagge" class="middle-text"></div>
        </div>
        <%@include file="/header.jsp" %>
        <div class="row centered">
            <div class="col col-8">
                <h2>${program.name}</h2>

                <div class="row green-bg">



                    <div class="col">
                        <img src="${pageContext.request.contextPath}/${program.ico}" alt="" class="float-left" style="margin-right: 20px; margin-bottom: 20px;">
                        <p class="middle">
                            Area: <a href="${pageContext.request.contextPath}/program/Courses?area_id=${program.area.id}">${program.area.name}</a><br>
                            Duration: ${program.duration} days<br>
                            Level: ${program.level}<br>
                            Teacher: <a href="${pageContext.request.contextPath}/user/Profile?id=${program.user.id}"> ${program.user.name} ${program.user.surname}</a> <br>
                            <c:if test="${admin}">                            
                                <a href="${pageContext.request.contextPath}/program/EditProgram?id=${program.id}"><button class="button small round primary">UPDATE</button></a>
                                <a href="${pageContext.request.contextPath}/program/Delete?id=${program.id}"><button class="button small round error">DELETE</button></a>
                                <button class="button small round warning" style="color: #000;" onclick="publish()">PUBLISH</button>
                            </c:if>
                            <c:if test="${student}">                           
                                <a href="${pageContext.request.contextPath}/program/StartCourse?id=${program.id}"><button class="button small round error">START</button></a>
                            </c:if> 
                            <c:if test="${owner}">                           
                                <a href="${pageContext.request.contextPath}/program/CreateCourse?id=${program.id}"><button class="button small round error">START</button></a>
                            </c:if>     
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
                        <li class="active"><a href="#tab11">MATERIAL</a></li>
                        <li><a href="#tab13">TASK</a></li>
                    </ul>
                </nav>

                <div id="tab11"  >
                    <c:forEach items="${materials}" var="material">                   
                        <div class="row">
                            <div class="col">
                                <p>
                                    <a href = "${pageContext.request.contextPath}/material/Material?id=${material.id}">${material.name}</a> 
                                </p>
                            </div>
                            <c:if test="${admin}">                           
                                <div>
                                    <a href="${pageContext.request.contextPath}/material/EditMaterial?id=${material.id}"><button class="button small round primary">UPDATE</button></a>
                                    <a href="${pageContext.request.contextPath}/material/Delete?id=${material.id}"><button class="button small round error">DELETE</button></a>
                                </div>
                            </c:if>
                        </div>
                    </c:forEach>                       
                    
                    <c:if test="${admin}"> 
                        <div class="row">
                            <div class="col">
                                <p>
                                    Create new material 
                                </p>
                            </div>
                            <div>
                                <a href="${pageContext.request.contextPath}/material/CreateMaterial?program=${program.id}"><button class="button small round success">ADD</button></a>
                            </div>
                        </div>
                    </c:if>                        
                </div>
                
                               
                <div id="tab13">
                    <c:forEach items="${tasks}" var="task">                              
                        <div class="row">
                            <div class="col">
                                <p>
                                    <a href = "${pageContext.request.contextPath}/task/StartTask?id=${task.id}">${task.name}</a>
                                </p>
                            </div>
                            <c:if test="${admin}"> 
                                <div>
                                    <a href="${pageContext.request.contextPath}/task/Task?id=${task.id}"><button class="button small round primary">UPDATE</button></a>
                                    <a href="${pageContext.request.contextPath}/task/Delete?id=${task.id}"><button class="button small round error">DELETE</button></a>
                                </div>
                            </c:if>                            
                        </div>
                    </c:forEach>
                    <c:if test="${admin}"> 
                        <div class="row">
                            <div class="col">
                                <p>
                                    Create new task 
                                </p>
                            </div>
                            <div>
                                <a href="${pageContext.request.contextPath}/task/CreateTask?program=${program.id}"><button class="button small round success">ADD</button></a>
                            </div>
                        </div>
                    </c:if>                      
                </div>
            </div>
        </div>
        <%@include file="/footer.jsp" %>
    </body>
</html>