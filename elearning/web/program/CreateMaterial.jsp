<%-- 
    Document   : CreateMaterial
    Created on : 11.07.2016, 16:40:31
    Author     : ksinn
--%>

<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    User user = (User) session.getAttribute("user");
    if(user==null||!user.isLogined())
        response.sendRedirect("../login.jsp");
    String url, material, program, typ="Lecture", text=null, name=null, inventory=null;
    int day=0;
    Material nm;
    
    material = request.getParameter("material");
    program = request.getParameter("program");
    url="0".equals(material)?"CreateMaterial.jsp":"EditMaterial.jsp";
    
if(request.getMethod()=="GET"){
    if(!"0".equals(material)){
        
        nm = new Material(material);
        typ = nm.getTyp();
        text = nm.getText();
        name = nm.getName();
        inventory = nm.getInventory();
        day = nm.getDay();
    }
    
}   
if(request.getMethod()=="POST"){
    
    typ = "Lecture";
    text = request.getParameter("text");
    name = request.getParameter("name");
    inventory = request.getParameter("inventory");
    try{
    day = Integer.parseInt(request.getParameter("day"));}
    catch(Exception ex){day=0;}
    
    if("0".equals(material)){
    
        nm = new Material(program, typ, text, name, inventory, day);    
        if(user.Create(nm))
            response.sendRedirect("Program.jsp");
    }
    else{
        
        nm = new Material(material);
        nm.setName(name);
        nm.setInventory(inventory);
        nm.setDay(day);
        nm.setTyp(typ);
        nm.setText(text);
        if(user.Update(nm))
                response.sendRedirect("Program.jsp");
    }
}
%>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new material</title>
        <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
        <script>tinymce.init({ selector:'#text' });</script>
    </head>
    <body>
        
        <h1>Create new material</h1>
        
        <form method="POST" action="<%=url%>">
            <input type="hidden" name="program" value="<%=program%>">
            <input type="hidden" name="material" value="<%=material%>">
            
            <div>
                <p>Name: </p>
                <input requered type="text" name="name" <%=name==null?" placeholder=\"Name":"value=\""+name%>">
            </div>
            <div>
                <p>Day: </p>
                <input requered type="number" min="1" name="day" <%=day==0?" placeholder=\"1":"value=\""+day%>" >
            </div>
            <div>
                <p>Inventory: </p>
                <textarea requered name="inventory" <%=inventory==null?" placeholder=\"Inventory\">":">"+inventory%></textarea>
            </div>
            <div>
                <p>Text: </p>
                <textarea requered name="text" id="text"><%=text==null?"":text%></textarea>
            </div>            
            <input type="submit"> 
        </form>
        
    </body>
</html>


