<%-- 
    Document   : Read
    Created on : 09.08.2016, 14:14:23
    Author     : ksinn
--%>

<%@page import="DataBase.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%try{
    Material mat = new Material(Integer.parseInt(request.getParameter("material")));
    ArrayList<Files> file = mat.getDocFile();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="/elearning/jwplayer/jwplayer.js"></script>
        <title><%=mat.getName()%></title>
    </head>
    <body>
        <h1><%=mat.getProgram().getName()%></h1>
        <h2><%=mat.getName()%></h2>
        <div>
            <%=mat.getText()%>
        </div>
            <div>
<%
for(int i=0; i<file.size(); i++){
%>               
                <a href="<%=file.get(i).getURL()%>"><%=file.get(i).getName()%></a>
<%}%>
            </div>
            <div>
<%
file = mat.getVideoFile();
if(!file.isEmpty()){
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
            </div>        
    </body>
</html>
<%
}catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=IllegalAction"); return;}
catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=ObjectNotFind"); return;}
catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=InvalidParameter"); return;} 
catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp"); return;}
%>   