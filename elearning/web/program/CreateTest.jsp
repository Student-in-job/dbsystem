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
    try{
        program = Integer.parseInt(request.getParameter("program"));
        pg = new Program(program);
        
    }catch(NumberFormatException ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidRequest"); return;}
    catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
    catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}
    
    if(user.getID()!=pg.getTeacherID()) {response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}
    
    String name=null, inventory = null;
    int day=0, test, time=0;
    Test nt;
    test = Integer.parseInt(request.getParameter("test")==null?"0":request.getParameter("test"));
 
if(request.getMethod()=="GET"){
    if(test!=0){
        
        try{
            nt = new Test(test);
        }catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}
        name = nt.getName();
        day = nt.getDay();
        inventory = nt.getInventory();
        program = nt.getProgramID();
        time=nt.getTime();

    }
    
}    
if(request.getMethod()=="POST"){
    
    name = request.getParameter("name");
    inventory = request.getParameter("inventory");
    day = Integer.parseInt(request.getParameter("day"));
    time = Integer.parseInt(request.getParameter("time"));
    
        try{
            if(test==0){

                nt = new Test(name, day, inventory, time);
                nt.Write(pg , user);
                response.sendRedirect("Test.jsp?test="+nt.getID()); return;
            }
            else{

                nt = new Test(test);
                nt.Change(name, inventory, day, user, time);
                response.sendRedirect("Test.jsp?test="+nt.getID()); return;
            }   
        }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}
        catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
        catch (IOException ex) {Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IOExtension"); return;} 
        catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidParameter"); return;} 
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}
        

}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test</title>
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
        <%@include file="../header.jsp"%>

        <div class="row centered registration">
            <div class="col col-4">

                <form id="form" class="form" action="CreateTest.jsp" method="POST">
                    <h3 class="text-centered">Test</h3>
                    <input type="hidden" name="program" value="<%=program%>"> 
                    <input type="hidden" name="test" value="<%=test%>"> 
                    
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
                        <label>Time(in minuts):</label>
                        <input class="width-100" required min="1" type="number" name="time" value="<%=time!=0?time:""%>">
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
                            maxlength: 50,
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
                            maxlength: 1000,
                        },
                        
                        time:{
                            required: true,
                            number: true,
                            min: 3,
                            max: 120,
                        },
                        
                   }

                });


            }); //end of ready
        </script> 
        <%@include file="../footer.jsp" %>
    </body>
</html>