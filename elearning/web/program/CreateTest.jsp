<%-- 
    Document   : CreateTest
    Created on : 13.07.2016, 13:51:17
    Author     : ksinn
--%>

<%@page import="DataBasePak.*"%>
<%@page import="java.io.IOException"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("user");
    if(user==null){
        response.sendRedirect("../login.jsp"); return;}
    
    String url=null, name=null, inventory = null, mark="";
    int day=0, test, program, time;
    Test nt;
    program = Integer.parseInt(request.getParameter("program")==null?"0":request.getParameter("program"));
    test = Integer.parseInt(request.getParameter("test")==null?"0":request.getParameter("test"));
    url = 0==test?"CreateTest.jsp":"EditTest.jsp";
    
if(request.getMethod()=="GET"){
    if(test!=0){
        
        try{
            nt = new Test(test);
        }catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=ObjectNotFind"); return;}
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp"); return;}
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
    day = Integer.parseInt(request.getParameter("day")==null?"0":request.getParameter("day"));
    time = Integer.parseInt(request.getParameter("time")==null?"0":request.getParameter("time"));
    boolean n = name==null||"".equals(name);
    boolean i = inventory==null||"".equals(inventory);
    boolean d = day<=0;
    boolean t = time<0;
    if(!(n||d||i||t)){
    
        try{
            if(test==0){

                Program prog = new Program(program);
                nt = new Test(name, day, inventory, time);
                nt.Write(prog , user);
                response.sendRedirect("Test.jsp?test="+nt.getID()); return;
            }
            else{

                nt = new Test(test);
                nt.Change(name, inventory, day, user, time);
                response.sendRedirect("Test.jsp?test="+nt.getID()); return;
            }   
        }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=IllegalAction"); return;}
        catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=ObjectNotFind"); return;}
        catch (IOException ex) {Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=IOExtension"); return;} 
        catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=InvalidParameter"); return;} 
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp"); return;}
        
    }  
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Test</title>
        <script type="text/javascript" src="/elearning/js/jquery-1.5.2.min.js"></script> 
        <script type="text/javascript" src="/elearning/js/jquery.validate.min.js"></script> 
    </head>
    <body>
        <h1>Create Test</h1>
        <h2><%=mark==null?"":mark%></h2>
        <form action="<%=url%>" method="POST">
        <input type="hidden" name="program" value="<%=program%>"> 
        <input type="hidden" name="test" value="<%=test%>"> 
            <div>
                <p>Name:</p>
                <input requered type="text" name="name" <%=name==null?" placeholder=\"Name of test":"value=\""+name%>">
            </div>
            <div>
                <p>Inventory:</p>
                <textarea requered name="inventory"><%=inventory==null?"":inventory%></textarea>
            </div>
            <div>
                <p>Day:</p>
                <input requered min="1" max="183" type="number" name="day" <%=day==0?" placeholder=\"1":"value=\""+day%>">
            </div>
            <div>
                <p>Time:</p>
                <input requered min="1" type="number" name="day" <%=day==0?" placeholder=\"1":"value=\""+day%>">
            </div>
            <input type="submit">
        </form>
    </body>
</html>