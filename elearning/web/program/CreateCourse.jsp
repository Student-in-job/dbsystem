<%-- 
    Document   : CreateCours
    Created on : 02.08.2016, 15:24:36
    Author     : ksinn
--%>

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
    form.parse("yyyy-mm-dd");
    
    
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
            <div>
                <p>Start Date:</p>
                <input type="date" name="start" value="<%=form.format(new Date())%>">
            </div>
    </body>
</html>
        <%}
        if(request.getMethod().equals("POST")){



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
        <h1>Hello World!</h1>
    </body>
</html>
