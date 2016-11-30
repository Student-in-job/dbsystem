<%-- 
    Document   : Delete.jsp
    Created on : Sep 9, 2016, 11:42:30 AM
    Author     : javlonboy
--%>

<%@page import="Learning.Task"%>
<%@page import="Learning.Files"%>
<%@page import="Learning.TestTask"%>
<%@page import="Learning.Test"%>
<%@page import="Learning.Material"%>
<%@page import="Learning.Program"%>
<%@page import="Learning.Parent"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/logfrag.jsp" %>

<%
if(request.getMethod().equals("GET")){
    
    String param="", name = "", type = "";
            
            Enumeration<String> parameterNames = request.getParameterNames();
            param = parameterNames.nextElement();
            int id = Integer.parseInt(request.getParameter(param));
                if("program".equals(param)){

                    Program p = new Program(id);
                    name=p.getName();
                    type=p.getType();
                    
                }
                if("material".equals(param)){

                    Material p = new Material(id);
                    name=p.getName();
                    type=p.getType();
                }
                if("test".equals(param)){

                    Test p = new Test(id);
                    name=p.getName();
                    type=p.getType();
                }
                if("task".equals(param)){

                    Task p = new Task(id);
                    name=p.getName();
                    type=p.getType();
                }
                if("testtask".equals(param)){

                    TestTask p = new TestTask(id);
                    name=p.getQuestion();
                    type="test task";
                }
                if("files".equals(param)){

                    Files p = new Files(id);
                    name=p.getName();
                    type=p.getType();
                }
                if("user".equals(param)){

                    User p = (User) request.getSession().getAttribute("user");
                    name=p.getName();
                    type=p.getType();
                }
                   

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accept delete</title>


        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
    </head>
    <body>
        <%@include file="/header.jsp" %>
        <div class="row centered bg-blue">
            <div class="col col-7 text-center">
                <form action="" class="form centered" method="POST">
                    <img class="delete-img" src="${pageContext.request.contextPath}/img/Delete.png">
                    <p class="">Are you absolutely sure you want to delete <%=type%> "<%=name%>"?
                    </p>
                    <input type="hidden" name="param" value="<%=param%>">
                    <input type="hidden" name="value" value="<%=request.getParameter(param)%>">
                    <input class="button round error" type="submit" value="Acept delete">
                    <button class="button round primary" onclick="window.history.back()">Cancel</button>
                </form>
            </div>
        </div>
        <%@include file="/footer.jsp"%>
    </body>
</html>
<%
    }
if(request.getMethod().equals("POST")){
    
    String param=request.getParameter("param"); int value=Integer.parseInt(request.getParameter("value"));
        Parent pg=null;    
                if("program".equals(param)){

                    Program p = new Program(value);
                    if(user.getID()!=p.getTeacherID()) throw new IllegalAction();
                    pg=p.getTeacher();
                    p.Delete();
                }
                if("material".equals(param)){

                    Material p = new Material(value);
                    pg=p.getProgram();
                    if(user.getID()!=p.getProgram().getTeacherID()) throw new IllegalAction();
                    p.Delete();
                }
                if("test".equals(param)){

                    Test p = new Test(value);
                    if(user.getID()!=p.getProgram().getTeacherID()) throw new IllegalAction();
                    if(p.getName().equals("Exem")&&p.getDay()==p.getProgram().getDuration()) throw new IllegalAction();
                    pg=p.getProgram();
                    p.Delete();
                }
                if("task".equals(param)){

                    Task p = new Task(value);
                    if(user.getID()!=p.getProgram().getTeacherID()) throw new IllegalAction();
                    pg=p.getProgram();
                    p.Delete();
                }
                if("testtask".equals(param)){

                    TestTask p = new TestTask(value);
                    if(user.getID()!=p.getTest().getProgram().getTeacherID()) throw new IllegalAction();
                    pg=p.getTest();
                    p.Delete();
                }
                if("files".equals(param)){

                    Files p = new Files(value);
                    if(user.getID()!=p.getMaterial().getProgram().getTeacherID()) throw new IllegalAction();
                    
                    pg=p.getMaterial();
                    p.Delete();
                }
                if("user".equals(param)){

                    User p = (User) request.getSession().getAttribute("user");
                    if(user.getID()!=p.getID()) throw new IllegalAction();
                    p.Delete();
                }

        if(pg==null) response.sendRedirect(request.getServletContext().getContextPath());
        switch(pg.getType()){
            case "program": {response.sendRedirect(request.getServletContext().getContextPath()+"/Course.jsp?course_id="+pg.getID()); return;}
            case "material": {response.sendRedirect(request.getServletContext().getContextPath()+"/Material.jsp?material_id="+pg.getID()); return;}
            case "task_list": {response.sendRedirect(request.getServletContext().getContextPath()+"/program/TaskList.jsp?tasklist="+pg.getID()); return;}
            case "test": {response.sendRedirect(request.getServletContext().getContextPath()+"/program/Test.jsp?test="+pg.getID()); return;}
            case "user": {response.sendRedirect(request.getServletContext().getContextPath()+"/Userbar.jsp"); return;}
            default: {response.sendRedirect(request.getServletContext().getContextPath()); return;}
        }
}

%>