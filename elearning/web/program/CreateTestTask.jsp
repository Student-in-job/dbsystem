<%-- 
    Document   : CreateTestTask
    Created on : 13.07.2016, 18:49:09
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

    TestTask nt = new TestTask();
    nt.setTestID(request.getParameter("test"));
    nt.setQuestion(request.getParameter("question"));
    nt.setAnswer(request.getParameter("answer"));
    nt.setVariant1(request.getParameter("v1"));
    nt.setVariant2(request.getParameter("v2"));
    nt.setVariant3(request.getParameter("v3"));
    nt.setVariant4(request.getParameter("v4"));
    nt.setPoint(Integer.parseInt(request.getParameter("point")));
    if(user.Create(nt))
                {
                    response.sendRedirect("Test.jsp?test="+nt.getTestID());
                }
      
}
%>
<jsp:useBean id="nTest" class="Learning.Test" scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Test</title>
    </head>
    <body>
        <h1>Create TestTask</h1>
        <form action="CreateTestTask.jsp" method="POST">
            <input type="hidden" name="test" value="<%=request.getParameter("test")%>">    
            <div>
                <p>Question:</p>
                <input type="text" name="question" value="<%=request.getParameter("question")%>">
            </div>
            <div>
                <p>Point:</p>
                <input type="number" name="point" value="<%=request.getParameter("point")%>">
            </div>
            <div>
                <p>*Answer:</p>
                <input type="text" name="answer" value="<%=request.getParameter("answer")%>">
            </div>
            <div>
                <p>V1:</p>
                <input type="text" name="v1" value="<%=request.getParameter("v1")%>">
            </div>
            <div>
                <p>V2:</p>
                <input type="text" name="v2" value="<%=request.getParameter("v2")%>">
            </div>
            <div>
                <p>V3:</p>
                <input type="text" name="v3" value="<%=request.getParameter("v3")%>">
            </div>
            <div>
                <p>V4:</p>
                <input type="text" name="v4" value="<%=request.getParameter("v4")%>">
            </div>
            
            <input type="submit">
        </form>
    </body>
</html>