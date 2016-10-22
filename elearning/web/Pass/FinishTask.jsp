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
   
        AcceptTask accept = (AcceptTask) session.getAttribute("accept");
        if(accept==null){
            response.sendRedirect(request.getServletContext().getContextPath()+"/Userbar.jsp");
            return;
        }
        try{
            accept.Final();
            session.removeAttribute("accept"); 
        }catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}
  
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
        <%@include file="../header.jsp" %>
        
        <div class="row centered text-center test">
            <div class="col col-8 ">
                <h3><%=accept.getTask().getName()%></h3>
                <h4><a href = "<%=request.getServletContext().getContextPath()%>/Course.jsp?course_id=<%=accept.getTask().getProgram().getID()%>"><%=accept.getTask().getProgram().getName()%></a></h4>
                <p>
                    <%=accept.getTask().getInventory()%>
                </p>
                <h4>Ball: <%=accept.getBall()%></h4>
                <a href="NextTask">Next</a>
            </div>            
        </div>
        <%@include file="/footer.jsp" %>
        <script src="<%=request.getServletContext().getContextPath()%>/js/jquery.min.js"></script>


   </body>
</html>
