<%-- 
    Document   : CreateTask
    Created on : 05.09.2016, 11:17:11
    Author     : ksinn
--%>

<%@page import="DataBasePak.*"%>
<%@page import="java.io.IOException"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../logfrag.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    String message="";
    int program = 0;
    Program pg;

        program = Integer.parseInt(request.getParameter("program"));
        pg = new Program(program);
        
    if(user.getID()!=pg.getTeacherID()) {response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}
    
    int task=0, group=0, count=0, time=0, starttime=0, period=0, day = 0;
    String name=null, inventory=null;
    Task nt;
    task = Integer.parseInt(request.getParameter("task")==null?"0":request.getParameter("task"));
 
if(request.getMethod().equals("GET")){
    if(task!=0){

            nt = new Task(task);
        name = nt.getName();
        day = nt.getDay();
        inventory = nt.getInventory();
        program = nt.getProgramID();
        time=nt.getTime();
        starttime=nt.getStartTime();
        period=nt.getPeriod();
        group = nt.getGroup();

    }
    
}    
if(request.getMethod().equals("POST")){
    
    name = request.getParameter("name");
    inventory = request.getParameter("inventory");
    day = Integer.parseInt(request.getParameter("day"));
    time = Integer.parseInt(request.getParameter("time"));
    starttime = Integer.parseInt(request.getParameter("starttime"));
    group = Integer.parseInt(request.getParameter("group"));
    count = Integer.parseInt(request.getParameter("count"));
    period = Integer.parseInt(request.getParameter("period"));
    

            if(task==0){

                nt = new Task(name, inventory, day, period, time, starttime, group, count);
                nt.Write(pg , user);
                response.sendRedirect("Task.jsp?task="+nt.getID()); return;
            }
            else{

                nt = new Task(task);
                nt.Change(user, name, inventory, day, period, time, starttime, group, count);
                response.sendRedirect("Task.jsp?task="+nt.getID()); return;
            }   
        

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
        <script src="<%=request.getServletContext().getContextPath()%>/js/tinymce/tinymce.min.js"></script>
        
    </head>
    <body>
        <div  class="box " >
            <div id="mesagge" class="middle-text"><%=message%></div>
        </div>
        <%@include file="../header.jsp"%>

        <div class="row centered registration">
            <div class="col col-4">

                <form id="form" class="form" action="" method="POST">
                    <h3 class="text-centered">Task</h3>
                    <input type="hidden" name="program" value="<%=program%>"> 
                    <input type="hidden" name="test" value="<%=task%>"> 
                    
                    <div class="form-item">
                        <label>Group ID:</label>
                        <input class="width-100" required type="number" name="group" value="<%=day!=0?day:""%>">
                    </div>
                    
                    <div class="form-item">
                        <label>Count:</label>
                        <input class="width-100" required  type="number" name="count" value="<%=day!=0?day:""%>">
                    </div>
                    
                    <div class="form-item">
                        <label>Name:</label>
                        <input class="width-100" required type="text" name="name" value="<%=name!=null?name:""%>">
                    </div>
                    
                    <div class="form-item">
                        <label>Inventory:</label>
                        <textarea required name="inventory"><%=inventory==null?"":inventory%></textarea>
                    </div>
                    
                    <div class="form-item">
                        <label>Day:</label>
                        <input class="width-100" required type="number" name="day" value="<%=day!=0?day:""%>">
                    </div>
                    
                    <div class="form-item">
                        <label>Period:</label>
                        <input class="width-100" required type="number" name="period" value="<%=period!=0?period:""%>">
                    </div>
                    
                    <div class="form-item">
                        <label>Start Time(hour):</label>
                        <input class="width-100" required type="number" name="starttime" value="<%=starttime!=0?starttime:""%>">
                    </div>
                    
                    <div class="form-item">
                        <label>Time(in minuts):</label>
                        <input class="width-100" required type="number" name="time" value="<%=time!=0?time:""%>">
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

                        name:{
                            required: true,
                            minlength: 6,
                            maxlength: 50
                        },
                        
                        day:{
                            required: true,
                            number: true,
                            min: 1
                        },
                                
                        period:{
                            required: true,
                            number: true,
                            min: 1
                        },        
                            
                        inventory:{
                            required: true,
                            minlength: 20,
                            maxlength: 1000
                        },
                        
                        starttime:{
                            required: true,
                            number: true,
                            min: 0,
                            max: 21
                        },
                        
                        time:{
                            required: true,
                            number: true,
                            min: 1,
                            max: 180
                        },
                                
                        group:{
                            required: true,
                            number: true,
                            min: 1
                        },
                        
                        count:{
                            required: true,
                            number: true,
                            min: 1
                        } 
                        
                   }

                });


            }); //end of ready
        </script> 
        <%@include file="../footer.jsp" %>
    </body>
</html>