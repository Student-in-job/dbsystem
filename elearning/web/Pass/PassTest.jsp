<%-- 
    Document   : PassTest
    Created on : 09.08.2016, 16:40:28
    Author     : ksinn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="/avtorize.jsp"%>
<%
   request.setCharacterEncoding("UTF-8");
    
    AcceptTest accept = (AcceptTest) session.getAttribute("accept");
    if(accept==null){
        response.sendRedirect(request.getServletContext().getContextPath()+"/Userbar.jsp");
    }
    else{
        int no = Integer.parseInt(request.getParameter("no"));
        String answer = request.getParameter("answer");
        if(answer!=null){
            accept.putAnswer(no, answer);
            no++;}
            if(no>=accept.getQuantity()) no--;


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
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

        <div class="row centered">
            <div class="col col-11">
                <p>time-left: <span id="timer"></span></p>
                <h4>PASS TEST!</h4>
            </div>
            <div class="col col-11">
                <ul class="pagination">

<%for(int i=0; i<accept.getQuantity(); i++){%>            
                    <li>
                        <a href="?no=<%=i%>" 
                        <%if(accept.getAnswer(i)!=null){%> style="background-color: antiquewhite" <%}%>
                        <%if(i==no){%> class="active" <%}%>
                        ><%=i+1%>
                        </a>
                    </li>
<%}%>                   
                </ul>
                <button class="button small round outline" href="FinishTest.jsp">Finish test</button>
            </div>
            <form method="POST" action="PassTest.jsp">    
                <div class="col col-11">
                    <p><%=no+1%>. <%=accept.getQuestion(no)%> </p>

                        <input type="hidden" name="no" value="<%=no%>">
<%
ArrayList<String> var = accept.getVariants(no);
for(int i=0; i<var.size(); i++){
%>                
                    <input type="radio" name="color" <%=var.get(i).equals(accept.getAnswer(no))?"checked":""%> value="<%=var.get(i)%>" id="blue">
                    <label for="blue" class="blue"><%=var.get(i)%></label>
                    <br>
<%}%>          
                </div>
                <div class="col col-11">
                    <input type="submit" class="button round outline primary" value="Confirm &rArr;">
                </div>
            </form>            
        </div>
        
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
                    setTimeout(function(){window.location.href = "FinishTest.jsp"}, data);
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
        
        <%@include file="/footer.jsp" %>

    </body>
</html>
<%}%>