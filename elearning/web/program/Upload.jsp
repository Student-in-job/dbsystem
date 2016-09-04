<%-- 
    Document   : Upload
    Created on : 12.07.2016, 11:07:55
    Author     : ksinn
--%>

<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page import="DataBasePak.Log"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
    
    User user = (User) session.getAttribute("user");
    if(user==null){
        response.sendRedirect("../login.jsp"); return;}

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload</title>
        <link href="../img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/normalize.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube.min.css">

        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube-ext.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/master.css">
    </head>
    <body>
        <%@include file="../header.jsp"%>

        <div class="row centered registration">
            <div class="col col-4">

                <form id="form1" class="form" action="Upload" method="post" enctype="multipart/form-data">
                    <input name="material" type="hidden" value="<%=request.getParameter("material")%>"><br>
                    
                    <div class="form-item">        
                        <label>Title</label> 
                        <input name="title" type="text" >
                    </div>
                    <div class="form-item">        
                        <label>File</label> 
                        <input name="data" type="file"><br>
                    </div>
                    
                    <div class="form-item">        
                    	<button class="button primary width-100 big">Complete</button>
                    </div> 
                </form>
        
   
        
                <form id="form2" class="form" action="Upload" method="post">
                    <input name="material" type="hidden" value="<%=request.getParameter("material")%>"><br>
                    
                    <div class="form-item">        
                        <label>Title</label> 
                        <input name="title" type="text" >
                    </div>
                    
                    <div class="form-item">        
                        <label>Имя файла</label> 
                        <input name="file" type="text" >
                    </div>
                    
                    <div class="form-item">        
                    	<button class="button primary width-100 big">Complete</button>
                    </div> 
                </form>
            </div>
        </div>
        <script type="text/javascript" src="<%=request.getServletContext().getContextPath()%>/js/jquery.validate.min.js"></script> 
        <script>
            $(document).ready(function(){

                $("#form1").validate({

                   rules:{ 

                        title:{
                            required: true,
                            minlength: 6,
                            maxlength: 100
                        },
                        
                        data:{
                            required:true,
                            accept: "doc|docx|pdf|ppt|pptx|mp4"
                        }                        
                   }

                });
                
                $("#form2").validate({

                   rules:{ 

                        title:{
                            required: true,
                            minlength: 6,
                            maxlength: 100
                        },
                        
                        file:{
                            required: true,
                            minlength: 5,
                            maxlength: 100
                        }                        
                   }

                });


            }); //end of ready
        </script>
        <%@include file="../footer.jsp" %>
    </body>
</html>

