<%-- 
    Document   : Test
    Created on : Aug 24, 2016, 5:17:51 PM
    Author     : javlonboy
--%>

<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="Learning.User_courses"%>
<%@page import="Learning.Test"%>
<%@page import="Learning.Course"%>
<%@page import="Learning.AcceptTest"%>

<%@include file="/avtorize.jsp"%>
<%  
    int tst;
    Test test;

            tst = Integer.parseInt(request.getParameter("test"));
            test = new Test(tst);
      
    if(request.getMethod().equals("POST")){
        
        if(user==null) {response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}
            
        Course cours; 
        User_courses uhc;
 
            cours = user.getActiveCourse(test.getProgramID());
            if(cours==null) {response.sendRedirect(request.getServletContext().getContextPath()+"/Course.jsp?course_id="+test.getProgramID()); return;}
            uhc = user.getHasCours(cours); 
              
        AcceptTest accept = (AcceptTest) session.getAttribute("accept");
        if(accept!=null){response.sendRedirect("PassTest.jsp?no=0"); return;}
            
        Date dt = uhc.getCourse().getSchadule().getDateOf(test);
        if(dt.before(new Date())){%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Error :: ${initParam.SiteName} &mdash; 2016 </title>
        <meta charset="utf-8">
        <link href="${pageContext.request.contextPath}/img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="css/kube.min.css">

        <link rel="stylesheet" href="css/kube-ext.css">
        <link rel="stylesheet" href="css/master.css">
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/kube.min.js"></script>
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
<% return;     }

            accept = new AcceptTest(uhc, test);
       
                    session.setAttribute("accept", accept);
                    response.sendRedirect("PassTest.jsp?no=0");
                    return;
    }

    if(request.getMethod().equals("GET")){
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test :: ${initParam.SiteName} &mdash; 2016 </title>
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
                <h3><%=test.getName()%></h3>
                <h4><a href = "${pageContext.request.contextPath}/Course.jsp?course_id=<%=test.getProgram().getId()%>"><%=test.getProgram().getName()%></a></h4>
                <p>
                    <%=test.getInventory()%>
                </p>
            </div>

            <div class="row centered best-results ">
                <h4 class="col col-12">BEST RESULTS</h4>
<%
for(Entry e : test.getStatistic().entrySet()){
%>                
                <div class="col">
                    <span class="chart" data-percent="<%= 100* (int) e.getValue()/test.getBall() %>">
                        <span class="percent"></span>
                        <span class="answers"><br><%=e.getValue()%>/<%=test.getBall()%></span>
                    </span>
                    <p><%=((User)e.getKey()).getName()%> <%=((User)e.getKey()).getSurname()%></p>
                </div>
<%}%>              
            </div>
            <div class="col col-12 test-btn">
<%if(user!=null)if(user.getId()!=test.getProgram().getTeacherID()){%>
                <form method="POST" action="StartTest.jsp">
                <input type="hidden" name="test" value="<%=tst%>">
                <input class="button round outline" type="submit" value="Start test &rarr;">
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
