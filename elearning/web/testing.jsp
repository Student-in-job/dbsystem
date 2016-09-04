<%-- 
    Document   : testing
    Created on : Aug 30, 2016, 6:10:48 PM
    Author     : javlonboy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="avtorize.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
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
        <%@include file="header.jsp"%>

        <div class="row centered test">
            <div class="col col-11">
                <p>time-left: 0:25:10</p>
                <h4>PASS TEST!</h4>
            </div>
            <div class="col col-11 pagination">
                <ul class="pagination">

                    <li><a href="#">1</a></li>
                    <li><a class="active" href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">6</a></li>
                    <li><a href="#">7</a></li>

                </ul>
                <button class="button small round outline">Finish test</button>
            </div>
            <div class="col col-11">
                <p>1.1 Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod magna aliqua? </p>

                <input type="radio"  >
                <label >Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                <br>
                <input type="radio" >
                <label>Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                <br>
                <input type="radio">
                <label>Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                <br>
                <input type="radio" >
                <label>Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                <br>
                <input type="radio">
                <label>Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
            </div>
            <div class="col col-11">
                <button class="button round outline primary">Confirm &rArr;</button>
            </div>
        </div>

        <%@include file="footer.jsp"%>

    </body>
</html>
