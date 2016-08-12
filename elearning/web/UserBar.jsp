<%-- 
    Document   : UserBar
    Created on : 19.07.2016, 19:14:28
    Author     : ksinn
--%>

<%@page import="DataBase.Log"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
User user = (User) session.getAttribute("user");
if(user==null) {response.sendRedirect("Login.jsp"); return; }
if(!user.isLogined()){response.sendRedirect("Login.jsp"); return;}
    
    ArrayList<Program> program;
    ArrayList<Course> cours = user.getLearningCourses();
    UserSchedule ush = user.getSchedule();
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
    </head>
    <body>
       <div>
            <img src="http://cs623726.vk.me/v623726602/4a73a/xh1E6l3zWvw.jpg" height="100">
            <h3><%=user.getName() + user.getSurname()%></h3>
            <p>Rating: 100</p>
            <h6><a href="resetpasswd.jsp" alt="log in">Reset password</a></h6>  
            <h6><a href="resetmail.jsp" alt="log in">Reset mail</a></h6>



            
            <div style="border: 1px solid black;">
                <h3>Created Programs:  <a href="program/CreateProgram.jsp?program=0" alt="registration">+</a></h3>
<%try{
    program = user.getCreatedPrograms();
    for(int i=0; i<program.size(); i++) {%>  
                <p>
                    <a href="program/Program.jsp?program=<%=program.get(i).getID()%>"><%=program.get(i).getName()%></a>
                    <a href="program/Publishe?program=<%=program.get(i).getID()%>">Published</a>
                </p>
                
<%}
}catch(Exception ex){
    Log.getOut(ex.getLocalizedMessage()+"/n"+ex.getMessage());%>
    <h3>Ошибка: Контент не найден!</h3>
<%}%>                
            </div>




            
            <div style="border: 1px solid black;">
                <h3>Active Programs:  <a href="program/CreateProgram.jsp?program=0" alt="registration">+</a></h3>
<%try{
    program = user.getCreatedPrograms();
    for(int i=0; i<program.size(); i++) {%>  
                <p>
                    <a href="program/Program.jsp?program=<%=program.get(i).getID()%>"><%=program.get(i).getName()%></a>
                    <%if(program.get(i).getCourse()==null){%><a href="program/CreateCourse.jsp?program=<%=program.get(i).getID()%>">Start Course</a><%}%>
                </p>
<%}
}catch(Exception ex){
    Log.getOut(ex.getLocalizedMessage()+"/n"+ex.getMessage());%>
    <h3>Ошибка: Контент не найден!</h3>
<%}%>                
            </div>
            
            
            
            
            <div style="border: 1px solid black;">
                <h3>Learning Cours:  </h3>
<%try{
    cours=user.getLearningCourses();
    for(int i=0; i<cours.size(); i++) {
%>  
                <p>
                    <a href="program/Cours.jsp?cours=<%=cours.get(i).getID()%>"><%=cours.get(i).getProgram().getName()%></a>
                </p>
               
<%}
}catch(Exception ex){
    Log.getOut(ex.getLocalizedMessage()+"/n"+ex.getMessage());%>
    <h3>Ошибка: Контент не найден!</h3>
<%}%>               
            </div>
 
            
            
            
            
            
            <div style="border: 1px solid black;">
                <h3>Teaching Cours:  </h3>
<%try{
    cours = user.getTeachengCourses();
    for(int i=0; i<cours.size(); i++) {
%>  
                <p>
                    <a href="program/Cours.jsp?cours=<%=cours.get(i).getID()%>"><%=cours.get(i).getProgram().getName()%></a>
                </p>
<%}
}catch(Exception ex){
    Log.getOut(ex.getLocalizedMessage()+"/n"+ex.getMessage());%>
    <h3>Ошибка: Контент не найден!</h3>
<%}%>                
            </div>
            
            
            
            
            
            
            
            
            <div>
                <h3>Расписание</h3>
<%try{
Day d;
Calendar c = new GregorianCalendar();
for(int j=0; j<7; j++){
    c.add(Calendar.DAY_OF_YEAR, 1);
    d = ush.getDay(c);
        if(d!=null){
    %>
                <h4><%=d.getDateString()%></h4>
    <%
        for(int i=0; i<d.Size(); i++){%>
                    <p>
                        <a href="?program=<%=d.get(i).getProgram().getID()%>" ><%=d.get(i).getProgram().getName()%></a>
                        ->
    <%        if(d.get(i).getType().equals("test")){
    %>
    <a href="Pass/StartPassTest.jsp?uhc=<%=user.getHasCoursID(d.get(i).getCourseID())%>&test=<%=d.get(i).getID()%>"><%=d.get(i).getName()%></a>
    <%      }
            if(d.get(i).getType().equals("material")){
    %>
                        <a href="Read.jsp?material=<%=d.get(i).getID()%>"><%=d.get(i).getName()%></a>
    <%
            }%>     </p>
    <%
        }
    }
}
}catch(Exception ex){
    Log.getOut(ex.getLocalizedMessage()+"/n"+ex.getMessage());%>
    <h3>Ошибка: Контент не найден!</h3>
<%}%>     
            </div>
            
        </div> 
    </body>
</html>
        


