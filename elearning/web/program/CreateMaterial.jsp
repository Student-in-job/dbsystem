<%-- 
    Document   : CreateMaterial
    Created on : 11.07.2016, 16:40:31
    Author     : ksinn
--%>

<%@page import="Learning.NewMaterial"%>
<%@page import="Learning.Program"%>
<%@page import="Learning.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    User user = (User) session.getAttribute("user");
    if(user==null||!user.isLogined())
        response.sendRedirect("../login.jsp");
%>

<%
    NewMaterial nm = (NewMaterial) session.getAttribute("nMaterial");
    if(nm==null){
        nm = new NewMaterial();
        Program program = user.getProgram(request.getParameter("program"));
        nm.setProgram(program);
        session.setAttribute("nMaterial", nm);        
    }
   
%>

<%
if(request.getMethod()=="POST"){
%>
<jsp:setProperty name="nMaterial" property="*"/>
<%
    
    if(nm.isGood())
    {
        response.sendRedirect("Upload.jsp");
        
    }
        
}

    
if(nm.getProgram().MayAddMaterial()){
%>    

<jsp:useBean id="nMaterial" class="Learning.NewMaterial" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new material</title>
    </head>
    <body>
        
        <h1>Create new material</h1>
        
        <form method="POST" action="CreateMaterial.jsp">
            <div>
                <p>Name: </p>
                <input type="text" name="name" value="<jsp:getProperty name="nMaterial" property="name"/>">
            </div>
            <div>
                <p>Typ: </p>
                <input type="text" name="typ" value="<jsp:getProperty name="nMaterial" property="typ"/>">
            </div>
            <div>
                <p>Day: </p>
                <input type="number" name="day" value="<jsp:getProperty name="nMaterial" property="day"/>" >
            </div>
            <div>
                <p>Inventory: </p>
                <textarea name="inventory"><jsp:getProperty name="nMaterial" property="inventory"/></textarea>
            </div>
            <input type="submit"> 
        </form>
        
    </body>
</html>
<%}
else
response.sendRedirect("Program.gsp");%>

