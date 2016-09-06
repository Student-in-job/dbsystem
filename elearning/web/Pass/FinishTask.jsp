<%-- 
    Document   : FinishTest
    Created on : 10.08.2016, 14:39:43
    Author     : ksinn
--%>

<%@page import="java.util.Map.Entry"%>
<%@page import="DataBasePak.*"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="/avtorize.jsp"%>
<%
   

        AcceptTest accept = (AcceptTest) session.getAttribute("accept");
        if(accept==null){
            response.sendRedirect(request.getServletContext().getContextPath()+"/Userbar.jsp");
            return;
        }
        try{
            accept.Final();
            session.removeAttribute("accept"); 
        }catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=ObjectNotFind"); return;}
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp"); return;}
  
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../img/favicon.png" rel="shortcut icon" type="image/x-icon">
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
                <h4 class="col col-12">YOU RESULTS</h4>                
                <div class="col">
                    <h3><%=accept.getTest().getName()%></h3>
                    <h4><a href = "<%=request.getServletContext().getContextPath()%>/Course.jsp?course_id=<%=accept.getTest().getProgram().getID()%>"><%=accept.getTest().getProgram().getName()%></a></h4>
                    <p>
                        <%=accept.getTest().getInventory()%>
                    </p>
                    <span class="chart" data-percent="<%= 100* accept.getBall()/accept.getTest().getBall() %>">
                        <span class="percent"></span>
                        <span class="answers"><br><%=accept.getBall()%>/<%=accept.getTest().getBall()%></span>
                    </span>
                    <p></p>
                </div>  
            </div>
            <div class="row centered best-results">
                <h4 class="col col-12">BEST RESULTS</h4>
<%
for(Entry e : accept.getTest().getStatistic().entrySet()){
%>                
                <div class="col">
                    <span class="chart" data-percent="<%= 100* (int) e.getValue()/accept.getTest().getBall() %>">
                        <span class="percent"></span>
                        <span class="answers"><br><%=e.getValue()%>/<%=accept.getTest().getBall()%></span>
                    </span>
                    <p><%=((User)e.getKey()).getName()%> <%=((User)e.getKey()).getSurname()%></p>
                </div>
<%}%>              
            </div>
            <div class="col col-12 test-btn"></div>
        </div>
        <%@include file="../footer.jsp" %>
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
