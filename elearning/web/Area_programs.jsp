<%-- 
    Document   : Area_programs
    Created on : Jul 28, 2016, 4:28:02 PM
    Author     : javlonboy
--%>
<%@page import="Learning.*"%>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           int area = Integer.parseInt(request.getParameter("area"));
           ArrayList<Program> programs = (new Area(area)).getPrograms();
           if(programs!=null){
               for(int i=0; i<programs.size(); i++){
        %>
        <div>
            <a href="one_course.jsp?programID=<%=programs.get(i).getID()%>">
                <%=programs.get(i).getName()%>
            </a>
        </div>
        
        <%
               }
           }
       %>
    </body>
</html>
