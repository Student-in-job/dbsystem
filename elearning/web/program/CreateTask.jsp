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
    try{
        program = Integer.parseInt(request.getParameter("program"));
        pg = new Program(program);
        
    }catch(NumberFormatException ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidRequest"); return;}
    catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
    catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}
    
    if(user.getID()!=pg.getTeacherID()) {response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}
    
    String name=null, inventory = null, answer=null, question=null;
    int day=0, task, time=0, ball=0;
    Task nt;
    task = Integer.parseInt(request.getParameter("task")==null?"0":request.getParameter("task"));
 
if(request.getMethod().equals("GET")){
    if(task!=0){
        
        try{
            nt = new Task(task);
        }catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}
        name = nt.getName();
        day = nt.getDay();
        inventory = nt.getInventory();
        program = nt.getProgramID();
        answer=nt.getAnswer();
        time=nt.getTime();
        ball=nt.getBall();
        question=nt.getQuestion();

    }
    
}    
if(request.getMethod().equals("POST")){
    
    name = request.getParameter("name");
    inventory = request.getParameter("inventory");
    answer = request.getParameter("answer");
    day = Integer.parseInt(request.getParameter("day"));
    time = Integer.parseInt(request.getParameter("time"));
    ball = Integer.parseInt(request.getParameter("ball"));
    question = request.getParameter("question");
    
        try{
            if(task==0){

                nt = new Task(name, day, question, inventory, answer, time, ball);
                nt.Write(pg , user);
                response.sendRedirect("Task.jsp?task="+nt.getID()); return;
            }
            else{

                nt = new Task(task);
                nt.Change(name, question, inventory, day, user, time, ball, answer);
                response.sendRedirect("Task.jsp?task="+nt.getID()); return;
            }   
        }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}
        catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
        catch (IOException ex) {Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IOExtension"); return;} 
        catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidParameter"); return;}
        catch (InvalidQuery ex) {message=ex.getMessage();}
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}
        

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
        <script>tinymce.init({
    selector: '#input',
    theme: 'modern',
    width: 800,
    height: 400,
    plugins: [
      'advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker',
      'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
      'save table contextmenu directionality emoticons template paste textcolor'
    ],
    toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons'
    
    });
    
    
        </script>
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
                        <label>Name:</label>
                        <input class="width-100" required type="text" name="name" value="<%=name!=null?name:""%>">
                    </div>
                    
                    <div class="form-item">
                        <label>Inventory:</label>
                        <textarea required name="inventory"><%=inventory==null?"":inventory%></textarea>
                    </div>
                    
                    <div class="form-item">
                        <label>Day:</label>
                        <input class="width-100" required min="1" max="183" type="number" name="day" value="<%=day!=0?day:""%>">
                    </div>
                    
                    <div class="form-item">
                        <label>Question:</label>
                        <textarea id="input" required name="question"><%=question==null?"":question%></textarea>
                    </div>
                    
                    <div class="form-item">
                        <label>Answer Query:</label> <a target="blank" href="DataBaseManager.jsp?program=<%=program%>">DataBase Manager -></a>
                        <textarea required name="answer"><%=answer==null?"":answer%></textarea>
                    </div>
                    
                    <div class="form-item">
                        <label>Time(in minuts):</label>
                        <input class="width-100" required min="1" type="number" name="time" value="<%=time!=0?time:""%>">
                    </div>
                    
                    
                    <div class="form-item">
                        <label>Ball:</label>
                        <input class="width-100" required min="1" type="number" name="ball" value="<%=ball!=0?ball:""%>">
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
                            min: 1,
                            max: <%=pg.getDuration()%>
                        },
                            
                        inventory:{
                            required: true,
                            minlength: 20,
                            maxlength: 1000
                        },
                        
                        answer:{
                            required: true,
                            minlength: 10,
                            maxlength: 500
                        },
                                
                        question:{
                            required: true,
                            minlength: 10,
                            maxlength: 1000
                        },
                        
                        time:{
                            required: true,
                            number: true,
                            min: 1,
                            max: 120
                        },
                                
                        ball:{
                            required: true,
                            number: true,
                            min: 1,
                            max: 100
                        }       
                        
                   }

                });


            }); //end of ready
        </script> 
        <%@include file="../footer.jsp" %>
    </body>
</html>