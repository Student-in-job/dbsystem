<%-- 
    Document   : Userbar.jsp
    Created on : Aug 23, 2016, 4:41:08 PM
    Author     : javlonboy
--%>

<%@page import="Learning.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="/logfrag.jsp" %>
<% 
    ArrayList<Course> learning_cours = user.getLearningCourses();
    ArrayList<Course> learned_cours = user.getLearnedCourses();
    ArrayList<Program> aprogram = user.getActivePrograms();
    ArrayList<Program> cprogram = user.getCreatedPrograms();
    UserSchedule ush = user.getMySchedule();
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Userbar</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="css/kube.min.css">

        <link rel="stylesheet" href="css/kube-ext.css">
        <link rel="stylesheet" href="css/master.css">


    </head>
    <body>
        <div class=userbar>
            <%@include file="header.jsp" %>
            <div class="row userbar-1">
                <div class="col col-3 text-right">
                    <img src="/elearning/<%=user.getIco()%>" alt="" class="img-circle">
                </div>
                <div class="col col-3">
                    <br>
                    <p>
                        Имя: <%=user.getName()%> <%=user.getSurname()%> <br>
                        Дата рождения: <%=user.getBirthday()%><br>
                        Пол: <%=user.getGender()%> <br>
                        Дата регистрации: <%=user.getDateRegestration()%><br>
                    </p>
                </div>
                <div class="col text-center"> 
                    <br>
                    <br>
                    <a class="button round outline">Settings &rarr;</a>
                </div>
            </div>
            <div class="row userbar-2 ">
                <div class="col col-2 offset-1 nav">
                    <a href="#created_courses" class="tablink" onclick="openTab(event, 'created_courses')">Созданные курсы</a>
                    <a href="#active_courses" class="tablink" onclick="openTab(event, 'active_courses')">Опубликованные курсы</a>
                    <a href="#learn_courses" class="tablink" onclick="openTab(event, 'learn_courses')">Текущие курсы</a>
                    <a href="#finished_courses" class="tablink" onclick="openTab(event, 'finished_courses')">Изученные курсы</a>
                </div>
                <div class="col col-8 border">
                    <div class="row">
                        <div class="col col-7 userbar-tab">
                            <div id="created_courses" class="courses">
                                <h3>Created courses</h3>
for(int i=0; i<created_course.size(); i++) {%>  
                <p>
                    <a href="program/Program.jsp?program=<%=program.get(i).getID()%>"><%=program.get(i).getName()%></a>
                    <a href="program/Publishe?program=<%=program.get(i).getID()%>">Published</a>
                </p>
                
<%}%>                                               
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum illum corporis tempora, nemo vitae repellendus dignissimos asperiores molestiae ab harum nisi laudantium explicabo earum dolores similique aspernatur commodi ad expedita!</p>
                            </div>
                            <div id="active_courses" class="courses">
                                <h3>Active courses</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere, maiores provident voluptate error harum, accusantium pariatur doloribus numquam consectetur illum perspiciatis nobis exercitationem, natus tempora repellat dolorem mollitia quis! Ducimus?</p>
                            </div>
                            <div id="learn_courses" class="courses">
                                <h3>Learn courses</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Id vero, omnis blanditiis ab autem doloremque illo. Aliquid ea at similique officia harum facilis, voluptates atque commodi, eveniet, odio nesciunt enim?</p>
                            </div>
                            <div id="finished_courses" class="courses">
                                <h3>Finished courses</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat architecto doloremque aperiam minima iusto explicabo nam dolore earum, ducimus dicta, excepturi dolores nulla maiores laudantium blanditiis officia temporibus asperiores ad.</p>
                            </div>
                        </div>
                        <div class="col col-5">
                            <h3>Расписание</h3>
                            <p>Lorem ipsum dolor - 12:00am 12.09.2016 </p>
                            <p>Lorem ipsum dolor - 12:00am 12.09.2016 </p>
                            <p>Lorem ipsum dolor - 12:00am 12.09.2016 </p>
                            <p>Lorem ipsum dolor - 12:00am 12.09.2016 </p>
                            <p>Lorem ipsum dolor - 12:00am 12.09.2016 </p>
                            <p>Lorem ipsum dolor - 12:00am 12.09.2016 </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
        <%@include file="footer.jsp" %>
        <!-- Kube JS + jQuery are used for some functionality, but are not required for the basic setup -->
        <script src="js/jquery.min.js"></script>
        <script src="js/kube.min.js"></script>
        <script>
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
