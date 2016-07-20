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
    
    String url=null, test=null, program=null, name=null;
    int day=0;
    Test nt;
    program = request.getParameter("program");
    test = request.getParameter("test");
    url = "0".equals(test)?"CreateTest.jsp":"EditTest.jsp";
    
if(request.getMethod()=="GET"){
    if(!"0".equals(test)){
        
        nt = new Test(test);
        name = nt.getName();
        day = nt.getDay();
    }
    
}    
if(request.getMethod()=="POST"){
    
    name = request.getParameter("name");
    try{
    day = Integer.parseInt(request.getParameter("day"));}
    catch(Exception ex){day=0;}
    
    if("0".equals(test)){
        
        nt = new Test(program, name, day);
        if(user.Create(nt))
                    response.sendRedirect("Program.jsp?program="+program);
    }
    else{
        
        nt = new Test(test);
        nt.setName(name);
        nt.setDay(day);
        if(user.Update(nt))
                response.sendRedirect("Program.jsp?program="+program);
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
        <form action="<%=url%>" method="POST">
        <input type="hidden" name="program" value="<%=program%>"> 
        <input type="hidden" name="test" value="<%=test%>"> 
            <div>
                <p>Name:</p>
                <input requered type="text" name="name" <%=name==null?" placeholder=\"Name of test":"value=\""+name%>">
            </div>
            <div>
                <p>Day:</p>
                <input requered min="1" max="183" type="number" name="day" <%=day==0?" placeholder=\"1":"value=\""+day%>">
            </div>
            <input type="submit">
        </form>
    </body>
</html>