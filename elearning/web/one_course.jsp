<%-- 
    Document   : one_course
    Created on : Jul 28, 2016, 5:50:11 PM
    Author     : javlonboy
--%>
<%@page import="Learning.*"%>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if(request.getMethod()=="POST"){
        String mark ="";
        User user = (User) session.getAttribute("user");
        if(user==null||!user.isLogined())
        {
                    response.sendRedirect("login.jsp");
        }
        else{
            User_courses user_course = new User_courses();
            user_course.setCourse_id(Integer.parseInt(request.getParameter("programID")));
            user_course.setUser_id(user.getID());
            mark = user_course.Write();
            if(mark==null)
                    response.sendRedirect("../UserBar.jsp");
            
        }
        
    }
    


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            int programs = Integer.parseInt(request.getParameter("programID"));
            Program program = new Program(programs);
         %>
        <div>
            
            Название: <%=program.getName()%><br />
            Продолжительность: <%=program.getDuration()%><br />
            <%=program.getAreaName()%><br />           
            <%=program.getDuration()%><br />
            <%=program.getInventory()%><br />
            <%=program.getState()%><br />
            <%=program.getTyp()%><br />
            <%=program.getType()%><br />
            <%=program.getArea()%><br />
            <%=program.getID()%><br />
            <%=program.getLevel()%><br />
            <%=program.getMaterials()%><br />
            <%=program.getMinLevel()%><br />
            <%=program.getTeacherID()%><br />
            <%=program.getTests()%><br />
            <%=program.getTypeIndex()%><br />
            <form action="one_course.jsp?programID=<%=programs%>" method="POST">
                <input type="submit" value="Subscribe">
            </form>
            
        </div>
           
        </body>
</html>
