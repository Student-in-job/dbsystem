<%-- 
    Document   : course
    Created on : Aug 22, 2016, 5:56:08 PM
    Author     : javlonboy
--%>

<%@page import="Learning.User"%>
<%@page import="Learning.Files"%>
<%@page import="DataBasePak.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Learning.Material"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
Material mat;

    mat = new Material(Integer.parseInt(request.getParameter("material_id")));
boolean u = false;
if(user!=null) u = user.getId()==mat.getProgram().getTeacherID();

ArrayList<Files> dfile = mat.getDocFile();
ArrayList<Files> vfile = mat.getVideoFile();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=mat.getName()%> - <%=mat.getProgram().getName()%> :: ${initParam.SiteName} &mdash; 2016 </title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jwplayer/jwplayer.js"></script>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="row centered">
            <div class="col col-9">
                <h2><%=mat.getName()%></h2>
                <h3><a = href="${pageContext.request.contextPath}/Course.jsp?course_id=<%=mat.getProgramID()%>"><%=mat.getProgram().getName()%></a></h3> Day <%=mat.getDay()%>
                <p>
<%if(u){%>                    <a href="${pageContext.request.contextPath}/program/CreateMaterial.jsp?material=<%=mat.getId()%>&program=<%=mat.getProgramID()%>"><button class="button small round success">UPDATE</button></a>
                    <a href="${pageContext.request.contextPath}/program/Delete?material=<%=mat.getId()%>"><button class="button small round success">DELETE</button></a>
<%}%>                    
                </p>
                <p>
                    <%=mat.getInventory()%>
                </p>
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
                                                file:"${pageContext.request.contextPath}/<%=vfile.get(i).getURL()%>",
                                                title:"<%=vfile.get(i).getTitle()%>",
                                                image:"${pageContext.request.contextPath}/<%=mat.getProgram().getIco()%>"
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
                        <li class="active"><a href="#tab12">FILES</a></li>
                        <li><a href="#tab11">VIDEO</a></li>
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
<%if(u){%>                            <a href="${pageContext.request.contextPath}/program/Delete?files=<%=vfile.get(i).getId()%>" class="button round outline">Delete</a>
<%}%>                            <a href="${pageContext.request.contextPath}/<%=vfile.get(i).getURL()%>" class="button round outline">Download</a>
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
<%}
if(u){%>
                    <div class="row">
                        <div class="col">
                            <p>
                                Uploud new video 
                            </p>
                        </div>
                        <div class="col text-right">
                           <a href="${pageContext.request.contextPath}/program/Upload.jsp?material=<%=mat.getId()%>" class="button round outline">Upload</a>
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
<%if(u){%>                            <a href="${pageContext.request.contextPath}/program/Delete?files=<%=dfile.get(i).getId()%>" class="button round outline">Delete</a>
<%}%>                            <a href="${pageContext.request.contextPath}/<%=dfile.get(i).getURL()%>" class="button round outline">Download</a>
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
<%}
if(u){%>
                    <div class="row">
                        <div class="col">
                            <p>
                                Uploud new document 
                            </p>
                        </div>
                        <div class="col text-right">
                           <a href="${pageContext.request.contextPath}/program/Upload.jsp?material=<%=mat.getId()%>" class="button round outline">Upload</a>
                        </div>
                    </div>
<%}%>       
                </div>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp" %>
   
</body>
</html>
