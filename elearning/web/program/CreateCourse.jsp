<%-- 
    Document   : CreateCours
    Created on : 02.08.2016, 15:24:36
    Author     : ksinn
--%>

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
    
    int program = Integer.parseInt(request.getParameter("program")); 
    Program prog = new Program(program);
    Course course = (Course) session.getAttribute("course");
    ArrayList<Test> test = (ArrayList<Test>) session.getAttribute("test");
    ArrayList<Material> material = (ArrayList<Material>) session.getAttribute("material");
    
    SimpleDateFormat form = new SimpleDateFormat();
    form.applyPattern("yyyy-MM-dd");
    SimpleDateFormat form2 = new SimpleDateFormat();
    form2.applyPattern("yyyy-MM-dd HH:mm:ss");
    
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
                <input requered type="date" name="start" value="<%=form.format(new Date())%>">
            </div>
            <input type="submit">
        </form>
    </body>
</html>
        <%}
        if(request.getMethod().equals("POST")){

            try{
                Date start = form.parse(request.getParameter("start"));
                course = new Course(start, prog);
                session.setAttribute("course", course);
                }
            catch(Exception ex){response.sendRedirect("CreateCourse.jsp");}
            response.sendRedirect("CreateCourse.jsp?program="+String.valueOf(program));
        }
    }else
    
    if(material==null){
        material = prog.getMaterials();
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
        <form method="POST" action="CreateCourse.jsp">
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
            response.sendRedirect("CreateCourse.jsp?program="+String.valueOf(program));
        }
    }else
    if(test==null){
        test = prog.getTests();
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
        <form method="POST" action="CreateCourse.jsp">
            <input type="hidden" name="program" value="<%=program%>">
<%for(int i=0; i<test.size(); i++){%>            
            <div>
                <p><%=test.get(i).getName()%></p>
                <input requered type="datetime" name="<%=test.get(i).getID()%>" value="<%=form2.format(new Date(course.getDate().getTime()+3600*24*1000*material.get(i).getDay()))%>">
            </div>
<%}%>
            <input type="submit">
        </form>
    </body>
</html>
<%}
        if(request.getMethod().equals("POST")){
            for(int i=0; i<test.size(); i++){
                Date date = form2.parse(request.getParameter(String.valueOf(test.get(i).getID())));
                test.get(i).setDate(date);
            }
            session.setAttribute("test", test);
        
    
        ArrayList<Component> comp = new ArrayList<Component>();
        comp.addAll(material);
        comp.addAll(test);
        String mark = course.Write(user, comp);
        %><%=mark%><%
        }
    }

%>
