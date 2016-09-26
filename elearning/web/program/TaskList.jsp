<%-- 
    Document   : TaskList
    Created on : 24.09.2016, 16:47:35
    Author     : ksinn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DataBasePak.*"%>
<%@page import="java.io.IOException"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="/logfrag.jsp"%>
<%    TaskList list;
    try {
        list = new TaskList(Integer.parseInt(request.getParameter("tasklist")));
        if (list.getProgram().getTeacherID() != user.getID()) {
            throw new IllegalAction();
        }
    } catch (IllegalAction ex) {
        Log.getOut(ex.getMessage());
        response.sendRedirect(request.getServletContext().getContextPath() + "/Error.jsp?e=IllegalAction");
        return;
    } catch (ObjectNotFind ex) {
        Log.getOut(ex.getMessage());
        response.sendRedirect(request.getServletContext().getContextPath() + "/Error.jsp?e=ObjectNotFind");
        return;
    } catch (InvalidParameter ex) {
        Log.getOut(ex.getMessage());
        response.sendRedirect(request.getServletContext().getContextPath() + "/Error.jsp?e=InvalidParameter");
        return;
    } catch (Exception ex) {
        Log.getOut(ex.getMessage());
        response.sendRedirect(request.getServletContext().getContextPath() + "/Error.jsp");
        return;
    }

    ArrayList<Task> task = list.getTask();
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TaskList</title>
        <link href="../img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/normalize.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube.min.css">

        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube-ext.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/master.css">
    </head>
    <body>
<%@include file="/header.jsp" %>

        <div class=" test">
            <div class="row ">
                <div class="col col-3 offset-1">
                    <h3><%=list.getName()%> (<%=list.getTime()%> min)</h3>
                    <h4><a href="<%=request.getServletContext().getContextPath()%>/Course.jsp?course_id=<%=list.getProgram().getID()%>"><%=list.getProgram().getName()%></a></h4>
                </div>
                <div class="col col-1">
                    <a class="test-edit" href="CreateTask.jsp?program=<%=list.getProgramID()%>&task=<%=list.getID()%>">
                        <i class="fa fa-cog font-green" aria-hidden="true"></i>
                        Edit
                    </a>
                </div>
                <div class="col">
                    <a href="CreateTask.jsp?task=0&tasklist=<%=list.getID()%>">
                        <button class="button round outline small">
                            Add task <i class="fa fa-plus" aria-hidden="true"></i>

                        </button>
                    </a>
                </div>
            </div>
            <hr>
<%=task.isEmpty()?"<div class=\"row\"><div class=\"col\"><div class=\"col offset-1\"><p>Nothing yet</p></div></div></div>":""%>              
<%for (int i = 0; i < task.size(); i++) {%>                         
            <div class="row">
                <div class="col offset-1">
                    <a href="Task.jsp?task=<%=task.get(i).getID()%>"><p><%=task.get(i).getQuestion()%></a> (<%=task.get(i).getBall()%>)</p>
                    
                </div>
                <div class="col">
                    <a class="test-edit" href="<%=request.getServletContext().getContextPath()%>/Delete.jsp?task=<%=task.get(i).getID()%>">
                        <i class="fa fa-trash font-green"></i> Delete
                    </a> 
                    <a class="test-edit" href="CreateTask.jsp?tasklist=<%=list.getID()%>&task=<%=task.get(i).getID()%>">
                        <i class="fa fa-cog font-green"></i> Edit
                    </a>
                </div>
            </div>
<%}%>            

            <div class="col">

            </div>

        </div>
<%@include file="/footer.jsp" %>
    </body>
</html>
