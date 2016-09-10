<%-- 
    Document   : DataBaseManager
    Created on : 05.09.2016, 17:59:03
    Author     : ksinn
--%>

<%@page import="Learning.DBManeger"%>
<%@page import="Learning.Program"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>\

<%@include file="../logfrag.jsp" %>
<%
String message = "";
String query = "";
if(request.getMethod().equals("POST")){
    query = request.getParameter("query");
    try{
        DBManeger man = new DBManeger(query, new Program(1));
        if(man.Complite()) message = "Query complite!";
        else message = man.getException().getMessage();
        message = man.getMessage();
    }catch(Exception ex){response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}
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
        <div><%=message%></div>
        <%@include file="../header.jsp"%>

        <div class="row centered registration">
            <div class="col col-4">

                <form id="form" class="form" action="" method="POST">
                    
                    <div class="form-item">
                        <label>SQL Query:</label>
                        <textarea required name="query"><%=query%></textarea>
                    </div>
                    
                    <div class="form-item">
                        <button class="button primary width-100 big">Complete</button>
                    </div>
                </form>
            </div>
        </div>
        <script type="text/javascript" src="<%=request.getServletContext().getContextPath()%>/js/jquery.validate.min.js"></script> 
        <script>
            $(document).ready(function(){

                $("#form").validate({

                   rules:{ 

                        query:{
                            required: true,
                            minlength: 10
                        }                        
                   }

                });


            }); //end of ready
        </script> 
        <%@include file="../footer.jsp" %>
    </body>
</html>
