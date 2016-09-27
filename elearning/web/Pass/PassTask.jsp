<%-- 
    Document   : PassTest
    Created on : 09.08.2016, 16:40:28
    Author     : ksinn
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="/avtorize.jsp"%>
<%
   request.setCharacterEncoding("UTF-8");
    
    AcceptTask accept = (AcceptTask) session.getAttribute("accept");
    if(accept==null){
        response.sendRedirect(request.getServletContext().getContextPath()+"/Userbar.jsp");
    }
    else{
        if(request.getParameter("next") != null) accept.Next();
        String answer = request.getParameter("answer");
        accept.putAnswer(answer);


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

        <div class="row centered test">
            <div class="col col-11">
                <p>time-left: <span id="timer"></span></p>
                <h4>PASS TEST!</h4>
            </div>
            <div class="col col-11 pagination">
<%if(accept.NextExists()){%>                
                <a href="PassTask.jsp?next=ok"><button class="button small round outline">Next task</button></a>
<%}else{%>
                <a href="FinishTask.jsp"><button class="button small round outline">Finish task</button></a>
<%}%>
            </div>
            
            
                <div class="task-table">    
                    <div class="task-table-row">    
                        <div class="task-table-cell">
                                <p><%=accept.getTask().getQuestion()%> </p>                                 
                        </div>
                        <div class="task-table-cell">
                            <p class="error"><%=accept.isRight()?"Right result":accept.getErrorMessage()%></p>
                        </div>    
                    </div>
                    <div class="task-table-row">        
                        <form class="task-table-cell" method="POST" action="">    
                            <div class="col col-11">
                                    <textarea rows="6" required  name="answer"><%=accept.getAnswer()!=null?accept.getAnswer():""%></textarea>
                            </div>

                            <div class="col col-11">
                                <input type="submit" class="button round outline primary" value="Confirm &rArr;">
                            </div>
                        </form>
                        <table class="task-table-cell">
            <%
                try{
                    ResultSet rs = accept.getAnswerResult();

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

            <%}catch(Exception ex){}%>  
                            </table>
                    </div> 
                </div>   
                            
                            
        </div>
        

        
        <%@include file="/footer.jsp" %>
        <script>  
        function show()  
        {  
            $.ajax({  
                url: "<%=request.getServletContext().getContextPath()%>/timer",  
                cache: false, 
                error: function(){
                    window.location.href = "<%=request.getServletContext().getContextPath()%>/Error.jsp";
                },
                success: function(data){ 
                    setTimeout(function(){window.location.href = "FinishTask.jsp";}, data);
                    data = Math.floor(data/1000);
                    var h = Math.floor(data/3600);
                    data = Math.floor(data%3600);
                    var m = Math.floor(data/60);
                    var s = Math.floor(data%60);
                    $("#timer").html(h + ':' + m + ':' + s);  
                }  
            });  
        } 
        
        
      
        $(document).ready(function(){  
            show();  
            setInterval('show()',1000);  
        });  
    </script>
    </body>
</html>
<%}%>