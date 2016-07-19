<%-- 
    Document   : CreateTest
    Created on : 13.07.2016, 13:51:17
    Author     : ksinn
--%>

<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    User user = (User) session.getAttribute("user");
    if(user==null||!user.isLogined())
        response.sendRedirect("../login.jsp");
%>

<%
if(request.getMethod()=="POST"){
    
    String program, name;
    int day;
    program = request.getParameter("program");
    name = request.getParameter("name");
    try{
    day = Integer.parseInt(request.getParameter("day"));}
    catch(Exception ex){day=0;}
    Test nt = new Test(program, name, day);
    if(user.Create(nt))
                {
                    response.sendRedirect("Program.jsp");
                }
      
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Test</title>
    </head>
    <body>
        <h1>Create Test</h1>
        <form action="CreateTest.jsp>" method="POST">
            <input type="hidden" name="program" value="<%=request.getParameter("program")%>">    
            <div>
                <p>Name:</p>
                <input requered type="text" name="name" <%=request.getParameter("name")==null?" placeholder=\"Name of test":"value=\""+request.getParameter("name")%>">
            </div>
            <div>
                <p>Day:</p>
                <input requered type="number" name="day" <%=request.getParameter("day")==null?" placeholder=\"1":"value=\""+request.getParameter("day")%>">
            </div>
            <input type="submit">
        </form>
    </body>
</html>