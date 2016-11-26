<%-- 
    Document   : CreateTask
    Created on : 05.09.2016, 11:17:11
    Author     : ksinn
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/Error.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Group</title>
        <link href="../img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
        <script src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"></script>
    </head>
    <body>
        <%@include file="../header.jsp"%>

        <div class="row centered registration">
            <div class="col col-4">

                <form id="form" class="form" action="" method="POST">
                    <h3 class="text-centered">Group</h3>
                    <input type="hidden" name="group" value="${group.id}">
                    
                    <div class="form-item">
                        <label>Name:</label>
                        <input class="width-100" type="text" id="input" required name="name" value="${group.name}">
                    </div>
                    
                    <div class="form-item">
                        <input type="checkbox" name="publish">public
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
                            minlength: 1,
                            maxlength: 32
                        }      
                        
                   }

                });


            }); //end of ready
        </script> 
        <%@include file="../footer.jsp" %>
    </body>
</html>