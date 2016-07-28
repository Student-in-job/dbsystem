<%-- 
    Document   : CreateMaterial
    Created on : 11.07.2016, 16:40:31
    Author     : ksinn
--%>

<%@page import="DataBase.Log"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
try{    
    User user = (User) session.getAttribute("user");
    if(user!=null&&user.isLogined()){
        
    String mark=null, url, typ="Lecture", text=null, name=null, inventory=null;
    int day=0, material = Integer.parseInt(request.getParameter("material")), program = Integer.parseInt(request.getParameter("program")==null?"0":request.getParameter("program"));
    Material nm;

    url=material==0?"CreateMaterial.jsp":"EditMaterial.jsp";
    
if(request.getMethod()=="GET"){
    if(material!=0){
        
        nm = new Material(material);
        typ = nm.getTyp();
        text = nm.getText();
        name = nm.getName();
        inventory = nm.getInventory();
        day = nm.getDay();
        program=nm.getProgramID();
    }
    
}   
if(request.getMethod()=="POST"){
    
    
    typ = "Lecture";
    text = request.getParameter("text");
    name = request.getParameter("name");
    inventory = request.getParameter("inventory");
    day = Integer.parseInt(request.getParameter("day")==null?"0":request.getParameter("day"));
    
    boolean n = name==null||"".equals(name);
    boolean i = inventory==null||"".equals(inventory);
    boolean d = day<=0;
    if(!(n||d||i)){
    
        if(material==0){

            Program prog = new Program(program);
            nm = new Material(typ, text, name, inventory, day);    
            mark = nm.Write(prog , user);
            if(mark==null)

                response.sendRedirect("Upload.jsp?material="+prog.getLastMaterial().getID());
        }
        else{

            nm = new Material(material);
            mark = nm.Change(typ, text, name, inventory, day, user);
            if(mark==null)
                    response.sendRedirect("Material.jsp?material="+nm.getID());
        }
    }
}
%>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new material</title>
        <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
        <script>tinymce.init({
            selector: '#input',
            theme: 'modern',
            width: 600,
            height: 300,
            plagin: "image link"
            });
        </script>
        
    </head>
    <body>
        
        <h1>Create new material</h1>
        <h1><%=mark==null?"":mark%></h1>
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
                <textarea requered name="text" id="input"><%=text==null?"":text%></textarea>
            </div> 
            <input type="submit"> 
        </form>
            
    </body>
</html>
   
<%}
else response.sendRedirect("login.jsp");

}
catch(Exception ex){
Log.getOut(ex.getMessage());
    response.sendRedirect("/elearning/Error.jsp");
}
%>


