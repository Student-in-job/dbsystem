<%-- 
    Document   : CreateTestTask
    Created on : 13.07.2016, 18:49:09
    Author     : ksinn
--%>

<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("user");
    if(user!=null&&user.isLogined()){
    
    String url=null, tst=null, testtask=null, question=null, answer=null, v1=null, v2=null, v3=null, v4=null;
    int point=0;
    TestTask nt;
    testtask = request.getParameter("testtask");
    tst = request.getParameter("test");
    url = "0".equals(testtask)?"CreateTestTask.jsp":"EditTestTask.jsp";
    
if(request.getMethod()=="GET"){
    if(!"0".equals(testtask)){
        
        nt = new TestTask(testtask);
        question=nt.getQuestion();
        answer=nt.getAnswer();
        v1=nt.getVariant1();
        v2=nt.getVariant2();
        v3=nt.getVariant3();
        v4=nt.getVariant4();
        point=nt.getPoint();
    }
}    
    
if(request.getMethod()=="POST"){
    
    
    question=request.getParameter("question");
    answer=request.getParameter("answer");
    v1=request.getParameter("v1");
    v2=request.getParameter("v2");
    v3=request.getParameter("v3");
    v4=request.getParameter("v4");
    try{
    point = Integer.parseInt(request.getParameter("point"));}
    catch(Exception ex){point = 0;}
    
    if("0".equals(testtask)){
        
        nt = new TestTask(tst, question, answer, v1, v2, v3, v4, point);
        if(user.Create(nt))
            response.sendRedirect("Test.jsp?test="+tst);
    }
    else{
    
        nt = new TestTask(testtask);
        nt.setQuestion(question);
        nt.setAnswer(answer);
        nt.setVariant1(v1);
        nt.setVariant2(v2);
        nt.setVariant3(v3);
        nt.setVariant4(v4);
        nt.setPoint(point);
        if(user.Update(nt))
        {
            response.sendRedirect("Test.jsp?test="+nt.getTestID());
        }
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
        <h1>Create TestTask</h1>
        <form action="<%=url%>" method="POST">
        <input type="hidden" name="testtask" value="<%=testtask%>"> 
        <input type="hidden" name="test" value="<%=tst%>"> 
            <div>
                <p>Question:</p>
                <input requered type="text" name="question" <%=question==null?"placeholder=\"Qwestion":"value=\""+question%>">
            </div>
            <div>
                <p>Point:</p>
                <input requered type="number" name="point" <%=point==0?"placeholder=\"1":"value=\""+point%>">
            </div>
            <div>
                <p>*Answer:</p>
                <input requered type="text" name="answer" <%=answer==null?"placeholder=\"Right answer":"value=\""+answer%>">
            </div>
            <div>
                <p>V1:</p>
                <input requered type="text" name="v1" <%=v1==null?"placeholder=\"Variant":"value=\""+v1%>">
            </div>
            <div>
                <p>V2:</p>
                <input requered type="text" name="v2" <%=v2==null?"placeholder=\"Variant":"value=\""+v2%>">
            </div>
            <div>
                <p>V3:</p>
                <input requered type="text" name="v3" <%=v3==null?"placeholder=\"Variant":"value=\""+v3%>">
            </div>
            <div>
                <p>V4:</p>
                <input requered type="text" name="v4" <%=request.getParameter("v4")==null?"placeholder=\"Variant":"value=\""+request.getParameter("v4")%>">
            </div>
            
            <input type="submit">
        </form>
    </body>
</html>
<%}
else response.sendRedirect("login.jsp");
%>