<%-- 
    Document   : PassTest
    Created on : 09.08.2016, 16:40:28
    Author     : ksinn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   request.setCharacterEncoding("UTF-8");
    
    AcceptTest accept = (AcceptTest) session.getAttribute("accept");
    if(accept==null){
        response.sendRedirect("/elearning/UserBar.jsp");
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
        <script type="text/javascript" src="<%=request.getServletContext().getContextPath()%>/js/jquery.min.js"></script> 
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <div id="content"></div>  
      
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
                    $("#content").html(h + ':' + m + ':' + s);  
                }  
            });  
        } 
        
        
      
        $(document).ready(function(){  
            show();  
            setInterval('show()',1000);  
        });  
    </script> 
    
        
        <h1>Pass Test!</h1>
        <div>
<%for(int i=0; i<accept.getQuantity(); i++){%>            
            <a 
<%if(accept.getAnswer(i)!=null)
{%>style="background-color: antiquewhite"<%}%>
                href="?no=<%=i%>"><%=i+1%></a>
<%}%>   
            <a href="FinishTest.jsp">Finish</a>
        </div>
        
        <section>
            <p><%=no+1%>. <%=accept.getQuestion(no)%></p>
            <form method="POST" action="PassTest.jsp">
                <input type="hidden" name="no" value="<%=no%>">
<%
ArrayList<String> var = accept.getVariants(no);
for(int i=0; i<var.size(); i++){
%>                
<input <%=var.get(i).equals(accept.getAnswer(no))?"checked":""%> type="radio" name="answer" value="<%=var.get(i)%>"><%=var.get(i)%><br>
<%}%>          
                <input type="submit">
            </form>
            
        </section>
        
    </body>
</html>
<%}//}%>