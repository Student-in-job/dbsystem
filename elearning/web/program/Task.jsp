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
    try {
        task = new Task(Integer.parseInt(request.getParameter("task")));
        if (task.getProgram().getTeacherID() != user.getID()) {
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

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task</title>
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
                    <h3><%=task.getName()%> (<%=task.getTime()%> min)</h3>
                    <h4><a href="<%=request.getServletContext().getContextPath()%>/Course.jsp?course_id=<%=task.getProgram().getID()%>"><%=task.getProgram().getName()%></a></h4>
                    <h4>Ball: <%=task.getBall()%></h4>
                </div>
                <div class="col col-1">
                    <a class="test-edit" href="CreateTask.jsp?program=<%=task.getProgramID()%>&task=<%=task.getID()%>">
                        <i class="fa fa-cog font-green" aria-hidden="true"></i>
                        Edit
                    </a>
                </div>
            </div>
            <hr>            

            <div class="col">
                <h4><%=task.getAnswer()%></h4>
                <table>
<%
    try{
        ResultSet rs = task.getAnswerResult();

%>
                    <tr>
<%        for(int i=1; i<=rs.getMetaData().getColumnCount(); i++){%>
                        <th><%=rs.getMetaData().getColumnName(i)%></th>
<%}%>
                    </tr>
<%
    while(rs.next()){%>
                    <tr>
<%        for(int i=1; i<=rs.getMetaData().getColumnCount(); i++){%>
                        <td><%=rs.getString(i)%></td>
<%}%>
                    </tr>
<%}%>                
                </table>
<%}catch(Exception ex){;%>
<p><%=ex.getMessage()%></p>
<%}%>                
            </div>

        </div>
<%@include file="/footer.jsp" %>
    </body>
</html>
