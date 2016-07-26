<%-- 
    Document   : CreateProgram
    Created on : 08.07.2016, 15:12:56
    Author     : ksinn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DataBase.Log"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Learning.*"%>

<%
try{
        
    User user = (User) session.getAttribute("user");
    if(user==null||!user.isLogined())
        response.sendRedirect("../login.jsp");
    
    String url, name = null, inventory=null, typ=null, mark ="";
    int level=0, minlevel=-1, duration=0, program=0, area=0;
    Program np;
    program = Integer.parseInt(request.getParameter("program")==null?"0":request.getParameter("program"));
    url=0==program?"CreateProgram.jsp":"EditProgram.jsp";
    
    if(request.getMethod()=="GET"){
    
        if(program!=0){

            np = new Program(program);
            name = np.getName();
            inventory = np.getInventory();
            area = np.getArea();
            typ = np.getTyp();
            level = np.getLevel();
            minlevel = np.getMinLevel();
            duration = np.getDuration();
            
        }
    }
    
    if(request.getMethod()=="POST"){
        
        name = request.getParameter("name");
        inventory = request.getParameter("inventory");
        try{
            area = Integer.parseInt(request.getParameter("area"));}
        catch(Exception ex){level=0;}
        typ = request.getParameter("typ");
        try{
            level = Integer.parseInt(request.getParameter("level"));}
        catch(Exception ex){level=0;}
        try{
            minlevel = Integer.parseInt(request.getParameter("minlevel"));}
        catch(Exception ex){minlevel=-1;}
        try{
            duration = Integer.parseInt(request.getParameter("duration"));}
        catch(Exception ex){duration=0;}
            
        if(program==0){
            
            np = new Program(name, inventory, new Area(area), typ, level, minlevel, duration);
            mark = np.Write(user);
            if(mark==null)
                response.sendRedirect("../UserBar.jsp");
            
        }
        
        else{
                
            np = new Program(program);
            mark = np.Change(name, inventory, typ, level, minlevel, duration, user);
            if(mark==null)
                response.sendRedirect("../UserBar.jsp");
            else{
                
                name = np.getName();
                inventory = np.getInventory();
                typ = np.getTyp();
                level = np.getLevel();
                
        }
    }
}    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new program</title>
    </head>
    <body>
        <h1>Error: <%=mark%></h1>
        <h1>Create new program: first step</h1>
        <form action="<%=url%>" method="POST">
            <input type="hidden" name="program" value="<%=program%>">
            <div>
                <p>Name:</p>
                <input required type="text" name="name" <%=name==null?"placeholder=\"Name":"value=\""+name%>">
            </div>
            <div>
                <p>Area:</p>
                <select name="area" requered>
<%
    ArrayList<Area> arealist = (new Area(1).getAll());
    for(int i=0; i<arealist.size(); i++){
    
%>
                    <option value="<%=arealist.get(i).getID()%>" <%=area==arealist.get(i).getID()?"selected":""%>><%=arealist.get(i).getName()%></option>
<%}%>
                </select>
            </div>
            <div>
                <p>Inventory:</p>
                <textarea required type="inventory" name="inventory" <%=inventory==null?"placeholder=\"Inventory\">":">"+inventory%></textarea>
            </div>
            <div>
                <p>Type:</p>
                <select name="typ" requered>
                    <option <%="Seminar".equals(typ)?"selected":""%> value="Seminar">Seminar</option>
                    <option <%="Mini".equals(typ)?"selected":""%> value="Mini">Mini</option>
                    <option <%="Standard".equals(typ)?"selected":""%> value="Standard">Standard</option>
                </select>
            </div>
                   
        <h1>Create new program: second step</h1> 
            <div>
                <p>Level:</p>
                <p>Какой уровень знаний будет после прохождения курса</p>
                <input required type="number" min="1" max="3" name="level" <%=level==0?"placeholder=\"1":"value=\""+level%>">
            </div>
            <div>
                <p>Min - Levet:</p>
                <p>Какого уровня курс надо прайти, для зачисления</p>
                <input required type="number" min="0" max="3" name="minlevel" <%=minlevel==-1?"placeholder=\"0":"value=\""+minlevel%>">
            </div>
            <div>
                <p>Duration:</p>
                поставить условие длительности
                <input required type="number" name="duration" min="1" <%=duration==0?"placeholder=\"1":"value=\""+duration%>"> days.
            </div>
            <input type="submit">
        </form>
        
    </body>
</html>
<%
}
catch(Exception ex){
Log.getOut(ex.getMessage());
    response.sendRedirect("/elearning/Error.jsp");
}
%>
