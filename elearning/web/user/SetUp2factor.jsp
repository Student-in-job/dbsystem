<%-- 
    Document   : Error
    Created on : 24.07.2016, 11:37:12
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="en">
    <head>
        <title>SetUp :: ${initParam.SiteName} &mdash; 2016 </title>
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
                    <h3>Warning! You can not input data agane!</h3>
                    
                    <form method="post" action="">
                    <p>
                        
                        <input type="submit">
                    </p>
                    </form>
                    <img id = "qr" src="">
                    
                </div>
            </div>
        </div>
        <script>
        function get()  
            { 
                console.log(123);
                $("#qr").src = "${pageContext.request.contextPath}/img/favicon.png";
                
                /*$.ajax({  
                    url: "SetUp", 
                    method: "POST",
                    cache: false, 
                    error: function(){
                        window.location.href = "${pageContext.request.contextPath}/Error.jsp";
                    },
                    success: function(data){
                        
                        doc = new document();
                        doc.write(data);
                        //$("#qr").html(data); 

                    }  
                }); */ 
            } 
        </script>
        <%@include file="/footer.jsp" %>
    </body>
</html>