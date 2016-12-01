<%-- 
    Document   : CreateTest
    Created on : 13.07.2016, 13:51:17
    Author     : ksinn
--%>

<%@page import="DataBasePak.*"%>
<%@page import="java.io.IOException"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../logfrag.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    
    int program = 0;
    Program pg;

        program = Integer.parseInt(request.getParameter("program"));
        pg = new Program(program);
        
   
    if(user.getId()!=pg.getTeacherID()) {response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}
    
    String name="Exam", inventory = "Required final exam for the program "+pg.getName();
    int day=pg.getDuration(), test, time=0;
    Test nt;
    test = Integer.parseInt(request.getParameter("test")==null?"0":request.getParameter("test"));
 
if(request.getMethod().equals("GET")){
    if(test!=0){
        

            nt = new Test(test);
        program = nt.getProgramID();
        time=nt.getTime();

    }
    
}    
if(request.getMethod().equals("POST")){
    
    time = Integer.parseInt(request.getParameter("time"));
    

            if(test==0){

                nt = new Test(name, day, inventory, time);
                nt.Write(pg , user);
                response.sendRedirect("Test.jsp?test="+nt.getId()); return;
            }
            else{

                nt = new Test(test);
                nt.Change(name, inventory, day, user, time);
                response.sendRedirect("Test.jsp?test="+nt.getId()); return;
            }   
        

}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exem :: ${initParam.SiteName} &mdash; 2016 </title>
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
        <%@include file="../header.jsp"%>

        <div class="row centered registration">
            <div class="col col-4">

                <form id="form" class="form" action="CreateTest.jsp" method="POST">
                    <h3 class="text-centered">Exem</h3>
                    <input type="hidden" name="program" value="<%=program%>"> 
                    <input type="hidden" name="test" value="<%=test%>"> 
                    
                    <div class="form-item">
                        <label>Name:</label>
                        <input class="width-100" readonly required type="text" name="name" value="<%=name%>">
                    </div>
                    
                    <div class="form-item">
                        <label>Inventory:</label>
                        <textarea required readonly name="inventory"><%=inventory%></textarea>
                    </div>
                    
                    <div class="form-item">
                        <label>Day:</label>
                        <input class="width-100" readonly required min="1" max="183" type="number" name="day" value="<%=day%>">
                    </div>
                    
                    <div class="form-item">
                        <label>Time(in minuts):</label>
                        <input class="width-100" required min="1" type="number" name="time" value="<%=time!=0?time:""%>">
                    </div>
                    
                    <div class="form-item">
                        <button class="button primary width-100 big">Complete</button>
                    </div>
                </form>
            </div>
        </div>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script> 
        <script>
            $(document).ready(function(){

                $("#form").validate({

                   rules:{ 

                        name:{
                            required: true
                            
                        },
                        
                        day:{
                            required: true,
                            number: true,
                            min: 1,
                            max: <%=pg.getDuration()%>
                        },
                            
                        inventory:{
                            required: true,
                            minlength: 20,
                            maxlength: 500
                        },
                        
                        time:{
                            required: true,
                            number: true,
                            min: 5,
                            max: 120
                        }
                        
                   }

                });


            }); //end of ready
        </script> 
        <%@include file="../footer.jsp" %>
    </body>
</html>