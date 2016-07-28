<%-- 
    Document   : Material
    Created on : 13.07.2016, 12:31:37
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
    
    if(request.getParameter("material")==null) 
        response.sendRedirect("../UserBar.jsp");
    
        Material material = new Material(Integer.parseInt(request.getParameter("material")));
           

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Material</title>
        <script type="text/javascript" src="/elearning/jwplayer/jwplayer.js"></script>
        
    </head>
    <body>
        <h1>
            <%=material.getProgram().getName()%> -> <%=material.getProgram().getName()%><%=material.getName()%>
            <a href="EditMaterial.jsp?material=<%=material.getID()%>">*</a>
            <a href="Delete?material=<%=material.getID()%>">-</a>
            <a href="Upload.jsp?material=<%=material.getID()%>">+f</a>
        </h1>
        <h3>Inventory: <%=material.getInventory()%></h3>
        <p><%=material.getText()%></p>
<%
ArrayList <Files> file = material.getDocFile();
if(file!=null){
for(int i=0; i<file.size(); i++){%>
<p>
    <a href="<%=file.get(i).getURL()%>"><%=file.get(i).getName()%></a>
    <a href="Delete?files=<%=file.get(i).getID()%>">-</a>
</p>
<%}}

file = material.getVideoFile();
if(file!=null){
%>        
        <p>
            <div id="myElement">Загрузка плеера...</div>
            <script type="text/javascript">
                    jwplayer("myElement").setup({
                        width: 400, 
                        height: 240,
                        listbar: {
                            position:'bottom',
                            size:150},
                        playlist: [
                            <%for(int i=0; i<file.size(); i++){%>  
                            {
                                file:"<%=file.get(i).getURL()%>",
                                title:"<%=file.get(i).getName()%>"
                            },
                            <%}%>
                        ]
                                
                    });
            </script>
        </p>
<%}%>        
    </body>
</html>
<%
}
else response.sendRedirect("login.jsp");
}
catch(Exception ex){
Log.getOut(ex.getMessage());
    response.sendRedirect("/elearning/Error.jsp");
}
%>
