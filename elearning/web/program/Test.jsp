<%-- 
    Document   : Test
    Created on : 13.07.2016, 16:56:55
    Author     : ksinn
--%>

<%@page import="DataBase.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("user");
    if(user==null){
        response.sendRedirect("../login.jsp"); return;}
    try{
        Test test = new Test(Integer.parseInt(request.getParameter("test")));
        ArrayList<TestTask> task = test.getTask();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            Name: <%=test.getName()%>
            <a href="EditTest.jsp?test=<%=test.getID()%>">*</a>
            <a href="Delete?test=<%=test.getID()%>">-</a>
        </h1>
        <h2>Day: <%=test.getDay()%></h2>
        <p><a href="CreateTestTask.jsp?testtask=0&test=<%=test.getID()%>">+Task</a></p>
        <ol>
<%for(int i=0; i<task.size(); i++){%>        
        <li>
            <p>
                <%=task.get(i).getQuestion()%> (<%=task.get(i).getPoint()%>)
                <a href="EditTestTask.jsp?testtask=<%=task.get(i).getID()%>">*</a>
                <a href="Delete?testtask=<%=task.get(i).getID()%>">-</a>
            </p>
            <ul>
                <li style="color: red;"><%=task.get(i).getAnswer()%></li>
                <li><%=task.get(i).getVariant1()%></li>
                <li><%=task.get(i).getVariant2()%></li>
                <li><%=task.get(i).getVariant3()%></li>
                <li><%=task.get(i).getVariant4()%></li>
            </ul>
        </li>
<%}%>
        </ol>
    </body>
</html>
<%
}catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=IllegalAction"); return;}
catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=ObjectNotFind"); return;}
catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=InvalidParameter"); return;} 
catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp"); return;}
        
%>

