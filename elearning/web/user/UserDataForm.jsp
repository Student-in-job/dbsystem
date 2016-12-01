<%-- 
    Document   : Registration
    Created on : Aug 23, 2016, 4:57:22 PM
    Author     : javlonboy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"  errorPage="/Error.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration :: ${initParam.SiteName} &mdash; 2016 </title>
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
        <%@include file="/header.jsp" %>

        <div class="row centered registration">
            <div class="col col-4">

                <form id="form" action="" method="post" class="form" enctype="multipart/form-data">
                    <h3 class="text-centered">REGISTRATION</h3> 
                    
                    <div class="form-item">
                        <label>Email</label>
                        <input class="width-100" type="email" name="mail" value="${user.mail}" required>
                    </div>

                    <div class="form-item">
                        <label>Name</label>
                        <input class="width-100" name="name" type="text" value="${user.name}" required >
                    </div>

                    <div class="form-item">
                        <label>Surname</label>
                        <input class="width-100" name="surname" type="text" value="${user.surname}" required >
                    </div>

                    <div class="form-item">
                        <label>Gender</label>
                        <select name="gender" required>
                            <option selected value="m">Men</option>
                            <option value="w">Women</option>
                        </select>
                    </div>

                    <div class="form-item">
                        Your photo:
                        <input type="file" name="picture">
                    </div>

                    <div class="form-item">
                        <button class="button primary width-100 big">Complete Sign Up</button>
                    </div>
                </form>
            </div>
        </div>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script> 
        <script>
            $(document).ready(function(){

                $("#form").validate({

                   rules:{ 

                        mail:{
                            required: true,
                            email: true
                            maxlength: 32
                        },
                        
                        surname:{
                            required: true,
                            maxlength: 32
                        },
                        
                        name:{
                            required: true,
                            maxlength: 32
                        },
                        
                        picture:{
                            accept: "png|jpg|jpeg"
                        }
                        
                   }

                });


            }); //end of ready
        </script>
        <%@include file="/footer.jsp" %>
    </body>
</html>