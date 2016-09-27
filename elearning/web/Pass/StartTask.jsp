<%-- 
    Document   : Test
    Created on : Aug 24, 2016, 5:17:51 PM
    Author     : javlonboy
--%>

<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="Learning.User_courses"%>
<%@page import="Learning.TaskList"%>
<%@page import="Learning.Course"%>
<%@page import="Learning.AcceptTask"%>

<%@include file="/avtorize.jsp"%>
<%  
    int ts;
    TaskList task;
        try{
            ts = Integer.parseInt(request.getParameter("tasklist"));
            task = new TaskList(ts);
        }catch(NumberFormatException ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidRequest"); return;}
        catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}

    if(request.getMethod().equals("POST")){
        
        if(user==null) {response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}
            
        Course cours; 
        User_courses uhc;
        try{
            cours = user.getActiveCourse(task.getProgramID());
            if(cours==null) {response.sendRedirect(request.getServletContext().getContextPath()+"/Course.jsp?course_id="+task.getProgramID()); return;}
            uhc = user.getHasCours(cours); 
        }catch(NumberFormatException ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidRequest"); return;}
        catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}

        
        AcceptTask accept = (AcceptTask) session.getAttribute("accept");
        if(accept!=null){response.sendRedirect("PassTask.jsp"); return;}
            
        Date dt = uhc.getCourse().getSchadule().getDateOf(task);
        if(dt.before(new Date())){%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Error</title>
        <meta charset="utf-8">
        <link href="<%=request.getServletContext().getContextPath()%>/img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="css/kube.min.css">

        <link rel="stylesheet" href="css/kube-ext.css">
        <link rel="stylesheet" href="css/master.css">
        <script src="<%=request.getServletContext().getContextPath()%>/js/jquery.min.js"></script>
        <script src="<%=request.getServletContext().getContextPath()%>/js/kube.min.js"></script>
    </head>
    <body>
        <%@include file="/header.jsp" %>
        <div class="row centered bg-blue">
            <div class="col col-3 text-center">
                <img src="img/ghost.png" alt="error">
                <div class="p-error">
                    <h3>WHOOPS!</h3>
                    <p>You can not start this task!</p>
                    <p>Time for this task laft!</p>
                </div>
            </div>
        </div>
        <%@include file="/footer.jsp" %>
    </body>
</html>
<% return;      }
        try{
            accept = new AcceptTask(uhc, task);
        }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}
        catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
        catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidParameter"); return;} 
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}       

                    session.setAttribute("accept", accept);
                    response.sendRedirect("PassTask.jsp");
                    return;
    }

    if(request.getMethod().equals("GET")){
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <%@include file="../header.jsp" %>
        
        <div class="row centered text-center test">
            <div class="col col-8 ">
                <h3><%=task.getName()%></h3>
                <h4><a href = "<%=request.getServletContext().getContextPath()%>/Course.jsp?course_id=<%=task.getProgram().getID()%>"><%=task.getProgram().getName()%></a></h4>
                <p>
                    <%=task.getInventory()%>
                </p>
            </div>

<%--            <div class="row centered best-results ">
                <h4 class="col col-12">BEST RESULTS</h4>
<%
for(Entry e : task.getStatistic().entrySet()){
%>                
                <div class="col">
                    <span class="chart" data-percent="<%= 100* (int) e.getValue()/task.getBall() %>">
                        <span class="percent"></span>
                        <span class="answers"><br><%=e.getValue()%>/<%=task.getBall()%></span>
                    </span>
                    <p><%=((User)e.getKey()).getName()%> <%=((User)e.getKey()).getSurname()%></p>
                </div>
<%}%>              
            </div>--%>
            <div class="col col-12 test-btn">
<%if(user!=null)if(user.getID()!=task.getProgram().getTeacherID()){%>
                <form method="POST" action="StartTask.jsp">
                <input type="hidden" name="tasklist" value="<%=ts%>">
                <input class="button round outline" type="submit" value="Start test &rarr;">
                </form>
<%}%>   
            </div>             
        </div>
        <%@include file="/footer.jsp" %>
        <script src="<%=request.getServletContext().getContextPath()%>/js/jquery.min.js"></script>


        <script src="<%=request.getServletContext().getContextPath()%>/js/jquery.easypiechart.min.js"></script>
        <script>
            $(function () {
                $('.chart').easyPieChart({
                    easing: 'easeOutBounce',
                    onStep: function (from, to, percent) {
                        $(this.el).find('.percent').text(Math.round(percent));
                    }
                });
            });
        </script>

    </body>
</html>
<%}
%>