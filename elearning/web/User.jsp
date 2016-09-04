<%-- 
    Document   : User
    Created on : 26.08.2016, 10:58:44
    Author     : ksinn
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="Learning.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="/avtorize.jsp" %>
<% 
    int user_id = 0;
    User show_user;
    try{
        user_id = Integer.parseInt(request.getParameter("user_id"));
        show_user = new User(user_id);
        
    }catch(NumberFormatException ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidRequest"); return;}
    catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
    catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}
    
    ArrayList<Course> learning_cours = show_user.getLearningCourses();
    ArrayList<Course> learned_cours = show_user.getLearnedCourses();
    ArrayList<Program> activ_program = show_user.getActivePrograms();
    UserSchedule ush = show_user.getMySchedule();
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>User</title>
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
                    <img src="<%=request.getServletContext().getContextPath()%>/<%=show_user.getIco()%>" alt="" class="img-circle">
                </div>
                <div class="col col-3">
                    <br>
                    <p>
                        Name: <%=show_user.getName()%> <%=show_user.getSurname()%> <br>
                        Rating: <%=show_user.getRating()%><br>
                        Birthday: <%=show_user.getBirthday()%><br>
                        Gender: <%=show_user.getGenderString()%> <br>
                        Registered on: <%=show_user.getDateRegestration()%><br>
                    </p>
                    <%--<button class="button small round">
                        <i class="fa fa-envelope-o" aria-hidden="true"></i>
                        Send message
                    </button>--%>
                </div>
                
            </div>
            <div class="row userbar-2 ">
                <div class="col col-2 offset-1 nav nav-user">
                    <a href="#active_courses" class="tablink" onclick="openTab(event, 'active_courses')">Active courses</a>
                    <a href="#learn_courses" class="tablink a-blue" onclick="openTab(event, 'learn_courses')">Current courses</a>
                    <a href="#finished_courses" class="tablink" onclick="openTab(event, 'finished_courses')">Studied courses</a>
                    
                </div>
                <div class="col col-8 border">
                    
                        
                            <div id="active_courses" class="courses">
                                <h3>Active courses</h3>
<%=activ_program.isEmpty()?"<p>Nothing yet</p>":""%>                                 
<%for(int i=0; i<activ_program.size(); i++) {%>  
                <p>
                    <a href="Course.jsp?course_id=<%=activ_program.get(i).getID()%>"><%=activ_program.get(i).getName()%></a>
                </p>                
<%}%>                                               
                            </div>
                            
                            <div id="learn_courses" class="courses">
                                <h3>Learn courses</h3>
<%=learning_cours.isEmpty()?"<p>Nothing yet</p>":""%>
<%for(int i=0; i<learning_cours.size(); i++) {%>  
                <p>
                    <a href="<%=request.getServletContext().getContextPath()%>/Course.jsp?course_id=<%=learning_cours.get(i).getID()%>"><%=learning_cours.get(i).getProgram().getName()%></a>
                </p>                
<%}%>                                               
                            </div>
                            
                            <div id="finished_courses" class="courses">
                                <h3>Finished courses</h3>
<%=learned_cours.isEmpty()?"<p>Nothing yet</p>":""%>  
<%for(int i=0; i<learned_cours.size(); i++) {%>  
                <p>
                    <a href="<%=request.getServletContext().getContextPath()%>/Course.jsp?course_id=<%=learned_cours.get(i).getID()%>"><%=learned_cours.get(i).getProgram().getName()%></a>
                </p>                
<%}%>                                               
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

