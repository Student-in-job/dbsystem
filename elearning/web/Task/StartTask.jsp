<%-- 
    Document   : Test
    Created on : Aug 24, 2016, 5:17:51 PM
    Author     : javlonboy
--%>

<%@page import="API.AppInf"%>
<%@page import="API.WorkSWT"%>
<%@page import="Learning.AcceptTask"%>
<%@page import="Learning.Task"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="Learning.User_courses"%>
<%@page import="Learning.Test"%>
<%@page import="Learning.Course"%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/Error.jsp"%>

<%@include file="/avtorize.jsp"%>
<%  
    int tst;
    Task task;
            tst = Integer.parseInt(request.getParameter("task"));
            task = new Task(tst);
        
    if(request.getMethod().equals("POST")){
        
        if(user==null) {response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}
        AcceptTask accept = user.getAliveAcceptTask(task); 
        if(accept!=null) {
            WorkSWT wt = new WorkSWT();
            wt.putData(accept, AppInf.main, AppInf.task+"/pass/Start", new Date().getTime() + 5*60*1000);
                

            
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Rederect</title>
        <meta charset="utf-8">
        <link href="${pageContext.request.contextPath}/img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/kube.min.js"></script>
    </head>
    <script> 
        
     window.location.href = "<%=AppInf.task%>/pass/Start?<%=wt.getURLParam()%>";   
    
    </script>
    <body>
<%--        <%@include file="/header.jsp" %>
        <div class="row centered bg-blue">
            <div class="col col-3 text-center">
                <div class="p-error">
                    <p><a href="<%=AppInf.task%>/pass/Start?<%=wt.getURLParam()%>">Go to link for start</a></p>
                </div>
            </div>
        </div>
        <%@include file="/footer.jsp" %>--%>
    </body>     
</html>
<%
     } else {
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Error</title>
        <meta charset="utf-8">
        <link href="${pageContext.request.contextPath}/img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/kube.min.js"></script>
    </head>
    <body>
        <%@include file="/header.jsp" %>
        <div class="row centered bg-blue">
            <div class="col col-3 text-center">
                <img src="${pageContext.request.contextPath}/img/ghost.png" alt="error">
                <div class="p-error">
                    <p>You cant start</p>
                </div>
            </div>
        </div>
        <%@include file="/footer.jsp" %>
    </body>
</html>
<%
        }               
    }

    if(request.getMethod().equals("GET")){
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task</title>
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
        <%@include file="../header.jsp" %>
        
        <div class="row centered text-center test">
            <div class="col col-12 ">
                <h3><%=task.getName()%></h3>
                <h4><a href = "${pageContext.request.contextPath}/Course.jsp?course_id=<%=task.getProgram().getID()%>"><%=task.getProgram().getName()%></a></h4>
                <p>
                    <%=task.getInventory()%>
                </p>
            </div>

            <div class="row centered best-results ">
                <h4 class="col col-12"></h4>            
            </div>
            <div class="col col-12 test-btn">
<%if(user!=null)if(user.getID()!=task.getProgram().getTeacherID()){%>
                <form method="POST" action="">
                <input type="hidden" name="test" value="<%=tst%>">
                <input class="button round outline" type="submit" value="Start task &rarr;">
                </form>
<%}%>   
            </div>             
        </div>
        <%@include file="/footer.jsp" %>
        <script src="${pageContext.request.contextPath}/js/jquery.easypiechart.min.js"></script>
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
