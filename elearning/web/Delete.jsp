<%-- 
    Document   : Delete.jsp
    Created on : Sep 9, 2016, 11:42:30 AM
    Author     : javlonboy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="avtorize.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accept delete</title>


        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="css/kube.min.css">

        <link rel="stylesheet" href="css/kube-ext.css">
        <link rel="stylesheet" href="css/master.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="row centered bg-blue">
            <div class="col col-7 text-center">
                <form action="" class="form centered">
                    <img class="delete-img" src="img/Delete.png">
                    <p class="">Are you absolutely sure you want to delete 
                    "file name"
                    ?
                    </p>
                    <button class="button round error">Accept delete</button>
                    <button class="button round primary">Cancel</button>
                </form>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
