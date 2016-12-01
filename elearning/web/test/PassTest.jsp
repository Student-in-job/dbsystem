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
        <%@include file="/header.jsp" %>

        <div class="row centered test">
            <div class="col col-11">
                <p>time: <span id="timer"></span></p>
                <h4>PASS TEST!</h4>
            </div>
            <div class="col col-11 pagination">
                <ul class="pagination">

<%for(int i=0; i<accept.getQuantity(); i++){%>            
                    <li>
                        <a href="?no=<%=i%>" 
                        <%if(accept.getAnswer(i)!=null){%> style="background-color: #8bc34a" <%}%>
                        <%if(i==no){%> class="active" <%}%>
                        ><%=i+1%>
                        </a>
                    </li>
<%}%>                   
                </ul>
                <a href="FinishTest.jsp"><button class="button small round outline">Finish test</button></a>
            </div>
            <form method="POST" action="PassTest.jsp">    
                <div class="col col-11">
                    <p><%=no+1%>. <%=accept.getQuestion(no)%> </p>

                        <input type="hidden" name="no" value="<%=no%>">
<%
ArrayList<String> var = accept.getVariants(no);
for(int i=0; i<var.size(); i++){
%>                
                    <input type="radio" name="answer" <%=var.get(i).equals(accept.getAnswer(no))?"checked":""%> value="<%=var.get(i)%>">
                    <label><%=var.get(i)%></label>
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
                url: "${pageContext.request.contextPath}/timer",  
                cache: false, 
                error: function(){
                    window.location.href = "${pageContext.request.contextPath}/Error.jsp";
                },
                success: function(data){ 
                    setTimeout(function(){window.location.href = "FinishTest.jsp";}, data);
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