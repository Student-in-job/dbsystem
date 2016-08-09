<%-- 
    Document   : courses.jsp
    Created on : Jul 27, 2016, 3:26:13 PM
    Author     : javlonboy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Learning.*"%>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Области</h2>
        <div id="areas">
            <% ArrayList<Area> area = (new Area(1)).getAll();
            if(area!=null){
                
            
            for(int i=0; i<area.size(); i++){
            
            %>
            
            
                <div class="area">
                    <a href="Area_programs.jsp?area=<%=area.get(i).getID()%>">
                    <%=area.get(i).getName()%>
                    </a>
                </div>
            
            <%}
            } 
        else{response.sendRedirect("Error.jsp");
}
            %>
            
        </div>
            <div>
            <hr />
            <br />
            <% 
                ArrayList<Program> programs =(new Program(1)).getAll();
            if(programs!=null){
                for(int i = 0; i < 15; i++){
                    if(i==programs.size()){
                    break;
                }
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
            </div>
    </body>
</html>
