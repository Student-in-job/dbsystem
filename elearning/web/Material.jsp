<%-- 
    Document   : course
    Created on : Aug 22, 2016, 5:56:08 PM
    Author     : javlonboy
--%>

<%@page import="Learning.Files"%>
<%@page import="DataBasePak.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Learning.Material"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Material mat;  
try{
    mat = new Material(Integer.parseInt(request.getParameter("material_id")));
}catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=IllegalAction"); return;}
catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=ObjectNotFind"); return;}
catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=InvalidParameter"); return;} 
catch(NumberFormatException ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=InvalidRequest"); return;}
catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp"); return;}

ArrayList<Files> dfile = mat.getDocFile();
ArrayList<Files> vfile = mat.getVideoFile();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=mat.getName()%> - <%=mat.getProgram().getName()%></title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <script type="text/javascript" src="/elearning/js/jwplayer/jwplayer.js"></script>
        
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="css/kube.min.css">

        <link rel="stylesheet" href="css/kube-ext.css">
        <link rel="stylesheet" href="css/master.css">
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="row centered">
            <div class="col col-9">
                <h2><%=mat.getName()%></h2>
                <p>
                    <%=mat.getText()%>
                </p>
<%
if(!vfile.isEmpty()){
%>                 
                <div id="myPlayer" class="imgc">Загрузка плеера...</div>
                <script type="text/javascript">
                                    jwplayer("myPlayer").setup({
                                        width: 1000, 
                                        height: 330,
                                        skin: {
                                            name: "bekle",
                                            active: "red",
                                            inactive: "white",
                                            background: "white"
                                        },
                                        listbar: {
                                            position:'right',
                                            size:400},
                                        playlist: [
                                            <%for(int i=0; i<vfile.size(); i++){%>  
                                            {
                                                file:"/elearning/<%=vfile.get(i).getURL()%>",
                                                title:"<%=vfile.get(i).getTitle()%>",
                                                image:"/elearning/img/logo-full.png"
                                            },
                                            <%}%>
                                        ]

                                    });
                </script>
<%}%>                             
            </div>
        </div>
        <div class="row centered course-2">
            <div class="col col-9">
                <h3>ADJUSTMENTS</h3>
                <nav class="tabs" data-component="tabs"  data-equals="true">
                    <ul>
                        <li class="active"><a href="#tab11">VIDEO</a></li>
                        <li><a href="#tab12">FILES</a></li>
                    </ul>
                </nav>

                <div id="tab11" class="tab-live" >
<%if(!vfile.isEmpty()){
    for(int i=0; i<vfile.size(); i++){
%>                    
                    <div class="row">
                        <div class="col">
                            <p>
                                <%=vfile.get(i).getTitle()%> 
                            </p>
                        </div>
                        <div class="col text-right">
                            <a href="/elearning/<%=vfile.get(i).getURL()%>" class="button round outline">Download</a>
                        </div>
                    </div>
<%
    }
}
else{%>
                    <div class="row">
                        <div class="col">
                            <p>
                                Have not same video. 
                            </p>
                        </div>
                    </div>
<%}%>                    
                </div>
                <div id="tab12">
<%if(!dfile.isEmpty()){
    for(int i=0; i<dfile.size(); i++){
%>                    
                    <div class="row">
                        <div class="col">
                            <p>
                                <%=dfile.get(i).getTitle()%> 
                            </p>
                        </div>
                        <div class="col text-right">
                            <a href="/elearning/<%=dfile.get(i).getURL()%>" class="button round outline">Download</a>
                        </div>
                    </div>
<%
    }
}
else{%>
                    <div class="row">
                        <div class="col">
                            <p>
                                Have not same video. 
                            </p>
                        </div>
                    </div>
<%}%>       
                </div>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp" %>

    <!-- Kube JS + jQuery are used for some functionality, but are not required for the basic setup -->
    <script src="js/jquery.min.js"></script>
    <script src="js/kube.min.js"></script>
    <script>
        function openNav() {
            document.getElementById("sidenav").style.width = "100%";
        }

        function closeNav() {
            document.getElementById("sidenav").style.width = "0";
        }
    </script>
</body>
</html>
