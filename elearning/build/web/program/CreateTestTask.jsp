<%-- 
    Document   : CreateTestTask
    Created on : 13.07.2016, 18:49:09
    Author     : ksinn
--%>

<%@page import="DataBasePak.*"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("user");
    if(user==null){
        response.sendRedirect("../login.jsp"); return;}
    
    String mark="", url=null, question=null, answer=null, v1=null, v2=null, v3=null, v4=null;
    int point=0, tst, testtask;
    TestTask nt;
    testtask = Integer.parseInt(request.getParameter("testtask")==null?"0":request.getParameter("testtask"));
    tst = Integer.parseInt(request.getParameter("test")==null?"0":request.getParameter("test"));
    url = testtask==0?"CreateTestTask.jsp":"EditTestTask.jsp";
    
if(request.getMethod()=="GET"){
    if(0!=testtask){
        
        try{
            nt = new TestTask(testtask);
        }catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=ObjectNotFind"); return;}
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp"); return;}
        
        question=nt.getQuestion();
        answer=nt.getAnswer();
        v1=nt.getVariant1();
        v2=nt.getVariant2();
        v3=nt.getVariant3();
        v4=nt.getVariant4();
        point=nt.getPoint();
        tst = nt.getTestID();
    }
}    
    
if(request.getMethod()=="POST"){
    
    
    question=request.getParameter("question");
    answer=request.getParameter("answer");
    v1=request.getParameter("v1");
    v2=request.getParameter("v2");
    v3=request.getParameter("v3");
    v4=request.getParameter("v4");
    point = Integer.parseInt(request.getParameter("point")==null?"0":request.getParameter("point"));
    boolean nul = question==null||answer==null||v1==null||v2==null||v3==null||v4==null;
    if(!nul){
        boolean p = question.length()*answer.length()*v1.length()*v2.length()*v3.length()*v4.length()*point==0;
        if(!p){
            try{
                if(0==testtask){

                    nt = new TestTask(question, answer, v1, v2, v3, v4, point);
                    nt.Write(new Test(tst), user);
                    response.sendRedirect("Test.jsp?test="+nt.getTest());
                }
                else{

                    nt = new TestTask(testtask);
                    nt.Change(question, answer, v1, v2, v3, v4, point, user);
                    response.sendRedirect("Test.jsp?test="+nt.getTestID());
                }
            }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=IllegalAction"); return;}
            catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=ObjectNotFind"); return;}
            catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=InvalidParameter"); return;} 
            catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp"); return;}
        
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
        <h2><%=mark==null?"":mark%></h2>
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
                <input requered type="text" name="v4" <%=v4==null?"placeholder=\"Variant":"value=\""+v4%>">
            </div>
            
            <input type="submit">
        </form>
    </body>
</html>
%>