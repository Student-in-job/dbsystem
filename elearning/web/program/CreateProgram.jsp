<%-- 
    Document   : CreateProgram
    Created on : 08.07.2016, 15:12:56
    Author     : ksinn
--%>

<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Learning.*"%>

<%
    
    User user = (User) session.getAttribute("user");
    if(user==null||!user.isLogined())
        response.sendRedirect("../login.jsp");
    
    String url, name = null, inventory=null, area=null, typ=null, program=null;
    int level=0, minlevel=-1, duration=0;
    Program np;
    program = request.getParameter("program");
    url="0".equals(program)?"CreateProgram.jsp":"EditProgram.jsp";
    
    if(request.getMethod()=="GET"){
    
        if(!"0".equals(program)){

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
        area = request.getParameter("area");
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
            
        if("0".equals(program)){
            
            np = new Program(name, inventory, area, typ, level, minlevel, duration);
            if(user.Create(np))
                response.sendRedirect("../UserBar.jsp");
            
        }
        
        else{
                
            np = new Program(program);
            np.setName(name);
            np.setInventory(inventory);
            np.setArea(area);
            np.setTyp(typ);
            np.setLevel(level);
            np.setMinLevel(minlevel);
            np.setDuration(duration);
            if(user.Update(np))
                response.sendRedirect("../UserBar.jsp");
            /*else{
                
                name = np.getName();
                inventory = np.getInventory();
                area = np.getArea();
                typ = np.getTyp();
                level = np.getLeavel();
             */
                
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
    HashMap<Integer, String> arealist = Program.getAreaList();
    int ar;
    ar=Integer.parseInt(area==null?"0":area);
    for(Entry entry : arealist.entrySet()){
    
%>
                    <option value="<%=entry.getKey()%>" <%=ar==(int)entry.getKey()?"selected":""%>><%=entry.getValue()%></option>
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
