<%-- 
    Document   : UserBar
    Created on : 19.07.2016, 19:14:28
    Author     : ksinn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
try{    
    
User user = (User) session.getAttribute("user");
if(user!=null&&user.isLogined()){
    
    ArrayList<Program> program = user.getPrograms();
    ArrayList<Course> l_cours = user.getCourses();
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
                <h3>Programs:  <a href="program/CreateProgram.jsp?program=0" alt="registration">+</a></h3>
<%for(int i=0; i<program.size(); i++) {%>  
                <p>
                    <a href="program/Program.jsp?program=<%=program.get(i).getID()%>"><%=program.get(i).getName()%></a>
                    <a href="<%=program.get(i).isPublished()?"\">(Statistic)":"program/Publishe?program="+program.get(i).getID()+"\">(Publish)"%></a>
                </p>
<%}%>                
            </div>
            <div style="border: 1px solid black;">
                <h3>Learning Cours:  </h3>
<%for(int i=0; i<l_cours.size(); i++) {%>  
                <p>
                    <a href="program/Cours.jsp?cours=<%=l_cours.get(i).getID()%>"><%=l_cours.get(i).getProgram().getName()%></a>
                </p>
<%}%>                
            </div>
        
        </div> 
    </body>
</html>
        
<%}
else response.sendRedirect("/elearning/login.jsp");

}catch(Exception ex){
    response.sendRedirect("/elearning/Error.jsp");
}
%>


