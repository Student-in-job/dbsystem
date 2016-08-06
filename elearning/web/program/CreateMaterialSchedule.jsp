<%-- 
    Document   : CreateMaterialSchedule
    Created on : 06.08.2016, 11:47:59
    Author     : ksinn
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("user");
    if(user==null) response.sendError(500, "You are not logined");
    if(!user.isLogined()) response.sendError(500, "You are not logined");
    
    int program = Integer.parseInt(request.getParameter("program")); 
    Course course = (Course) session.getAttribute("course");
    if(course==null) response.sendRedirect("CreateCourse.jsp?program="+String.valueOf(program));
    ArrayList<Material> material = (ArrayList<Material>) session.getAttribute("material");
    
    SimpleDateFormat form = new SimpleDateFormat();
    form.applyPattern("yyyy-MM-dd");
    SimpleDateFormat form2 = new SimpleDateFormat();
    form2.applyPattern("yyyy-MM-dd HH:mm:ss");    
    
if(material==null){
        material = course.getProgram().getMaterials();
        if(request.getMethod().equals("GET")){
            
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>CreateCourse:1</h1>
        <form method="POST" action="CreateMaterialSchedule.jsp">
            <input type="hidden" name="program" value="<%=program%>">
<%for(int i=0; i<material.size(); i++){%>            
            <div>
                <p><%=material.get(i).getName()%></p>
                <input requered type="datetime" name="<%=material.get(i).getID()%>" value="<%=form2.format(new Date(course.getDate().getTime()+3600*24*1000*material.get(i).getDay()))%>">
            </div>
<%}%>
            <input type="submit">
        </form>
    </body>
</html>
<%}
        if(request.getMethod().equals("POST")){
            for(int i=0; i<material.size(); i++){
                Date date = form2.parse(request.getParameter(String.valueOf(material.get(i).getID())));
                material.get(i).setDate(date);
            }
            
            session.setAttribute("material", material);
            response.sendRedirect("CreateTestSchedule.jsp?program="+String.valueOf(program));
            
        }
    }
else response.sendRedirect("CreateTestSchedule.jsp?program="+String.valueOf(program));
%>