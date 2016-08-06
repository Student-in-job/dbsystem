<%-- 
    Document   : CreateCours
    Created on : 02.08.2016, 15:24:36
    Author     : ksinn
--%>

<%@page import="DataBase.Log"%>
<%@page import="Learning.Material"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("user");
    if(user==null) response.sendError(500, "You are not logined");
    if(!user.isLogined()) response.sendError(500, "You are not logined");
    
    Course course = (Course) session.getAttribute("course");
    ArrayList<Test> test = (ArrayList<Test>) session.getAttribute("test");
    ArrayList<Material> material = (ArrayList<Material>) session.getAttribute("material");
    
    SimpleDateFormat form = new SimpleDateFormat();
    form.applyPattern("yyyy-MM-dd");
    SimpleDateFormat form2 = new SimpleDateFormat();
    form2.applyPattern("yyyy-MM-dd HH:mm:ss"); 
    
    if(request.getParameter("create")!=null){
        ArrayList<Component> comp = new ArrayList<Component>();
        comp.addAll(material);
        comp.addAll(test);
        String mark = course.Write(user, comp);
        %><%=mark%><%
    }
    else{


    
    int program = Integer.parseInt(request.getParameter("program")); 
    Program prog = new Program(program);
    if((!prog.isPublished())&&prog.getCourse()!=null) 
        response.sendError(500, "This program is not publish or have course");
    else{
    
    if(course==null){
        
        
        if(request.getMethod().equals("GET")){%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>CreateCourse:1</h1>
        <form method="POST" action="CreateCourse.jsp">
            <input type="hidden" name="program" value="<%=program%>">
            <div>
                <p>Start Date:</p>
                <input requered type="date" name="start" value="<%=form.format(new Date(new Date().getTime() + 3600*1000*24*8))%>">
            </div>
            <input type="submit">
        </form>
    </body>
</html>
        <%}
        if(request.getMethod().equals("POST")){

            try{
                Date start = form.parse(request.getParameter("start"));
                if(start.compareTo(new Date(new Date().getTime() + 3600*1000*24*7))<0) 
                    response.sendError(500, "Uncorrect date");
                else{
                    course = new Course(start, prog);
                    session.setAttribute("course", course);
                    response.sendRedirect("CreateMaterialSchedule.jsp?program="+String.valueOf(program));
                }
                }
            catch(Exception ex){
                Log.getOut(ex.getMessage());
                response.sendRedirect("CreateCourse.jsp?program="+String.valueOf(program));}
            
        }
    }
    else response.sendRedirect("CreateMaterialSchedule.jsp?program="+String.valueOf(program));

}}%>
