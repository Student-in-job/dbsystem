<%-- 
    Document   : Test
    Created on : 13.07.2016, 16:56:55
    Author     : ksinn
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DataBasePak.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="/logfrag.jsp"%>
<%    Task task;

        task = new Task(Integer.parseInt(request.getParameter("task")));
        if (task.getProgram().getTeacherID() != user.getId()) {
            throw new IllegalAction();
        }

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task :: ${initParam.SiteName} &mdash; 2016 </title>
        <link href="../img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
    </head>
    <body>
<%@include file="/header.jsp" %>

        <div class=" test">
            <div class="row ">
                <div class="col col-3 offset-1">
                    <h3><%=task.getName()%> (<%=task.getTime()%> m (at <%=task.getStartTime()%>) duaring <%=task.getPeriod()%> d)</h3>
                    <h4><a href="${pageContext.request.contextPath}/Course.jsp?course_id=<%=task.getProgram().getId()%>"><%=task.getProgram().getName()%></a></h4>
                    <h4><%=task.getCount()%> tasks from group <%=task.getGroup()%></h4>
                    <p><%=task.getInventory()%></p>
                </div>
                <div class="col col-1">
                    <a class="test-edit" href="CreateTask.jsp?program=<%=task.getProgramID()%>&task=<%=task.getId()%>">
                        <i class="fa fa-cog font-green" aria-hidden="true"></i>
                        Edit
                    </a>
                </div>
            </div>
            <hr>            

            <div class="col">               
            </div>

        </div>
<%@include file="/footer.jsp" %>
    </body>
</html>