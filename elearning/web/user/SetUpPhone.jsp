<%-- 
    Document   : Error
    Created on : 24.07.2016, 11:37:12
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="en">
    <head>
        <title>SetUp Phone</title>
        <meta charset="utf-8">
        <link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/kube.min.js"></script>
    </head>
    <body>
        <%@include file="/header.jsp" %>
        <div class="row centered bg-blue">
            <div class="col col-3 text-center">
                <img src="${pageContext.request.contextPath}/img/ghost.png" alt="error">
                <div class="p-error">
                    <h3></h3>
                    <form id="form" class="form" action="SetUpPhone" method="post">
                    <div class="form-item">
                        <label>Phone</label>
                        <label style="display: inline;">998 </label>
                        <input style="display: inline;" type="number" name="prefix" required > 
                        <input style="display: inline;" type="number" name="phone" required >
                    </div>

                    <div class="form-item">
                        <button class="button primary width-100 big">Sign Up</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script> 
        <script>
            $(document).ready(function(){

                $("#form").validate({

                   rules:{ 
                        phone:{
                            required: true,
                            minlength:7,
                            maxlength:7
                        },
                        prefix:{
                            required: true,
                            minlength:2,
                            maxlength:2
                        }
                        
                   }

                });


            }); //end of ready
        </script>
        <%@include file="/footer.jsp" %>
    </body>
</html>
