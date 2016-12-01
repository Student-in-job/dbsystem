<%-- 
    Document   : CreateArea
    Created on : 20.08.2016, 12:42:36
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Area :: ${initParam.SiteName} &mdash; 2016 </title>
        <link href="../img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">

    </head>
    <body>
        <%@include file="/header.jsp"%>

        <div class="row centered registration">
            <div class="col col-4">

                <form id="form" action="" method="post" class="form" enctype="multipart/form-data">
                    <h3 class="text-centered">Area</h3>

                    <div class="form-item">
                        <label>Name</label>
                        <input class="width-100" name="name" type="text" value="${area.name}" required>
                    </div>
                    
                    <div class="form-item">
                        Area Picture:
                        <input type="file" name="picture" required>
                    </div>

                    <div class="form-item">
                        <button class="button primary width-100 big">Complete</button>
                    </div>
                </form>
            </div>
        </div>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script> 
        <script>
            $(document).ready(function(){

                $("#form").validate({

                   rules:{ 

                        name:{
                            required: true,
                            maxlength: 64
                        },
                        
                        picture:{
                            required: true,
                            accept: "png|jpg|jpeg"
                        }
                        
                   }

                });


            }); //end of ready
        </script>
        <%@include file="/footer.jsp" %>
    </body>
</html>