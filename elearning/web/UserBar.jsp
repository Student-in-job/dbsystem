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
try{    
    
User user = (User) session.getAttribute("user");
if(user!=null&&user.isLogined()){
    
    ArrayList<Program> program = user.getCreatedPrograms();
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
`            
            <div style="border: 1px solid black;">
                <h3>Created Programs:  <a href="program/CreateProgram.jsp?program=0" alt="registration">+</a></h3>
<%for(int i=0; i<program.size(); i++) {%>  
                <p>
                    <a href="program/Program.jsp?program=<%=program.get(i).getID()%>"><%=program.get(i).getName()%></a>
                    <a href="program/Publishe?program=<%=program.get(i).getID()%>">Published</a>
                </p>
<%}
program = user.getActivePrograms();
%>                
            </div>
            
            <div style="border: 1px solid black;">
                <h3>Active Programs:  <a href="program/CreateProgram.jsp?program=0" alt="registration">+</a></h3>
<%for(int i=0; i<program.size(); i++) {%>  
                <p>
                    <a href="program/Program.jsp?program=<%=program.get(i).getID()%>"><%=program.get(i).getName()%></a>
                    <%if(program.get(i).getCourse()==null){%><a href="program/CreateCourse.jsp?program=<%=program.get(i).getID()%>">Start Course</a><%}%>
                </p>
<%}%>                
            </div>
            
            <div style="border: 1px solid black;">
                <h3>Learning Cours:  </h3>
<%for(int i=0; i<cours.size(); i++) {
    ArrayList<Component> sch = cours.get(i).getSchadule().getList();
%>  
                <p>
                    <a href="program/Cours.jsp?cours=<%=cours.get(i).getID()%>"><%=cours.get(i).getProgram().getName()%></a>
                </p>
                <ul>
<%for(int j=0; j<sch.size(); j++){%>                    
<li>
    <%=sch.get(j).getDateString()+" - "+ sch.get(j).getName()%>
</li>
                </ul>
<%}}%>                
            </div>
            
            <div style="border: 1px solid black;">
                <h3>Teaching Cours:  </h3>
<%
    cours = user.getTeachengCourses();
    for(int i=0; i<cours.size(); i++) {
    ArrayList<Component> sch = cours.get(i).getSchadule().getList();
%>  
                <p>
                    <a href="program/Cours.jsp?cours=<%=cours.get(i).getID()%>"><%=cours.get(i).getProgram().getName()%></a>
                </p>
                <ul>
<%for(int j=0; j<sch.size(); j++){%>                    
<li>
    <%=sch.get(j).getDateString()+" - "+ sch.get(j).getName()%>
</li>
                </ul>
<%}}%>                
            </div>
            
            <div>
                <h3>Расписание</h3>
<%
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
                <p><%=d.get(i).getProgram().getName()%>-><%=d.get(i).getName()%></p>
<%}
}} 
%>  
            </div>
            
        </div> 
    </body>
</html>
        
<%}
else response.sendRedirect("/elearning/login.jsp");

}catch(Exception ex){
Log.getOut(ex.getMessage());
    response.sendRedirect("/elearning/Error.jsp");
}
%>


