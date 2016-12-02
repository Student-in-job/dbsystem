<%-- 
    Document   : CreateCours
    Created on : 02.08.2016, 15:24:36
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course :: ${initParam.SiteName} &mdash; 2016 </title>
        <link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
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
                    <h3 class="text-centered">Course</h3>
                    <input type="hidden" name="program" value="${program.id}">
                    <div class="form-item">
                        <label>Start Date</label>
                        <input class="width-100" name="start_date" type="date" value="${date}" required>
                    </div>
                    
                    <div class="form-item">
                        <label>Public</label>
                        <input type="checkbox" name="public">
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

                        start:{
                            required: true,
                            date: true,
                        }                        
                   },

                });


            }); //end of ready
        </script>
        <%@include file="/footer.jsp" %>
    </body>
</html>
 
