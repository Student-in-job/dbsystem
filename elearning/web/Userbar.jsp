<%-- 
    Document   : Userbar.jsp
    Created on : Aug 23, 2016, 4:41:08 PM
    Author     : javlonboy
--%>

<%@page import="API.AppInf"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="Learning.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="/logfrag.jsp" %>
<% 
    ArrayList<Course> learning_cours = user.getLearningCourses();
    ArrayList<Course> learned_cours = user.getLearnedCourses();
    ArrayList<Program> activ_program = user.getActivePrograms();
    ArrayList<Program> created_program = user.getCreatedPrograms();
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Userbar</title>
        <link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/normalize.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube.min.css">

        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube-ext.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/master.css">


    </head>
    <body>
        <div class=userbar>
            <%@include file="/header.jsp" %>
            <div class="row userbar-1">
                <div class="col col-3 text-right">
                    <img src="<%=request.getServletContext().getContextPath()%>/<%=user.getIco()%>" alt="" class="img-circle">
                </div>
                <div class="col col-3">
                    <br>
                    <p>
                        Name: <%=user.getName()%> <%=user.getSurname()%> <br>
                        Rating: <%=user.getRating()%><br>
                        Birthday: <%=user.getBirthday()%><br>
                        Gender: <%=user.getGenderString()%> <br>
                        Registered on: <%=user.getDateRegestration()%><br>
                    </p>
                </div>
                <div class="col text-center"> 
                    <br>
                    <br>
                    <a class="button round outline" href="<%=request.getServletContext().getContextPath()%>/UserSettings.jsp">Settings &rarr;</a>
                </div>
            </div>
            <div class="row userbar-2 ">
                <div class="col col-2 offset-1 nav">
                    <a href="#created_courses" class="tablink" onclick="openTab(event, 'created_courses')">Created courses</a>
                    <a href="#active_courses" class="tablink" onclick="openTab(event, 'active_courses')">Published courses</a>
                    <a href="#learn_courses" class="tablink  a-blue" onclick="openTab(event, 'learn_courses')">Current courses</a>
                    <a href="#finished_courses" class="tablink" onclick="openTab(event, 'finished_courses')">Studied courses</a>
<%--                    <a href="#schedule" class="tablink a-blue" onclick="openTab(event, 'schedule')">Schedule</a> --%>
                    <a href="#create" class="tablink" onclick="openTab(event, 'create')">Create course</a>
                </div>
                <div class="col col-8 border">
                    
                        
                            <div id="created_courses" class="courses">
                                <h3>Created courses</h3>
<%=created_program.isEmpty()?"<p>Nothing yet</p>":""%>                                
<%for(int i=0; i<created_program.size(); i++) {%>  
                <p>
                    <a href="<%=request.getServletContext().getContextPath()%>/Course.jsp?course_id=<%=created_program.get(i).getID()%>"><%=created_program.get(i).getName()%></a>
                </p>                
<%}%>                                               
                            </div>
                            
                            <div id="active_courses" class="courses">
                                <h3>Published courses</h3>
<%=activ_program.isEmpty()?"<p>Nothing yet</p>":""%>                                 
<%for(int i=0; i<activ_program.size(); i++) {%>  
                <p>
                    <a href="<%=request.getServletContext().getContextPath()%>/Course.jsp?course_id=<%=activ_program.get(i).getID()%>"><%=activ_program.get(i).getName()%></a>
                </p>                
<%}%>                                               
                            </div>
                            
                            <div id="learn_courses" class="courses">
                                <h3>Learn courses</h3>
<%=learning_cours.isEmpty()?"<p>Nothing yet</p>":""%>                                
<%for(int i=0; i<learning_cours.size(); i++) {%>  
                <p>
                    <a href="<%=request.getServletContext().getContextPath()%>/Course.jsp?course_id=<%=learning_cours.get(i).getID()%>"><%=learning_cours.get(i).getProgram().getName()%></a>   (<%=learning_cours.get(i).getDate()%>)
                </p>                
<%}%>                                               
                            </div>
                            
                            <div id="finished_courses" class="courses">
                                <h3>Finished courses</h3>
<%=learned_cours.isEmpty()?"<p>Nothing yet</p>":""%>                                 
<%for(int i=0; i<learned_cours.size(); i++) {%>  
                <p>
                    <a href="<%=request.getServletContext().getContextPath()%>/Course.jsp?course_id=<%=learned_cours.get(i).getID()%>"><%=learned_cours.get(i).getProgram().getName()%></a>   (<%=learned_cours.get(i).getDate()%>)
                </p>                
<%}%>                                               
                            </div>
                    
                        <div id="create" class="courses">
                            For creating course you need do next steps
                            <ul>
                                <li>Create new program</li>
                                <li>Create same material ther;</li>
                                <li>Create  test and Exem;</li>
                                <li>Publish;</li>
                            </ul>
                            <a href="<%=request.getServletContext().getContextPath()%>/program/CreateProgram.jsp"><button class="button round outline">Create course</button></a>
                            <a href="<%=request.getServletContext().getContextPath()%>/program/RederectTask.jsp"><button class="button round outline">Create task</button></a>
                        </div>
                </div>
            </div>
        </div>  
        <%@include file="/footer.jsp" %>
        <!-- Kube JS + jQuery are used for some functionality, but are not required for the basic setup -->
        <script src="<%=request.getServletContext().getContextPath()%>/js/jquery.min.js"></script>
        <script src="<%=request.getServletContext().getContextPath()%>/js/kube.min.js"></script>
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
