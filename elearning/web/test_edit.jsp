<%-- 
    Document   : test_edit
    Created on : Aug 31, 2016, 11:58:09 AM
    Author     : javlonboy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="avtorize.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="css/kube.min.css">

        <link rel="stylesheet" href="css/kube-ext.css">
        <link rel="stylesheet" href="css/master.css">
    </head>
    <body>
        <%@include file="header.jsp" %>

        <div class="test-edit test">
            <div class="row ">
                <div class="col col-2 offset-1">
                    <h3>TEST NAME</h3>
                </div>
                <div class="col">
                    <a href="#">
                        <i class="fa fa-cog font-green" aria-hidden="true"></i>
                        Edit
                    </a>
                </div>
            </div>
            <div class="row">
                <div class="col offset-1">
                    <p>1.1 Lorem ipsum dolor sit amet, consectetur adipisicing elit?</p>
                    <form method="post" action="" class="form">
                        <div class="form-item checkboxes">
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                        </div>
                    </form>
                </div>
                <div class="col">
                    <a href="">
                        <i class="fa fa-trash font-green"></i> Delete
                    </a> 
                    <a href="">
                        <i class="fa fa-cog font-green"></i> Edit
                    </a>
                </div>
            </div>
            <div class="row">
                <div class="col offset-1">
                    <p>1.1 Lorem ipsum dolor sit amet, consectetur adipisicing elit?</p>
                    <form method="post" action="" class="form">
                        <div class="form-item checkboxes">
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                        </div>
                    </form>
                </div>
                <div class="col">
                    <a href="">
                        <i class="fa fa-trash font-green"></i> Delete
                    </a> 
                    <a href="">
                        <i class="fa fa-cog font-green"></i> Edit
                    </a>
                </div>
            </div>
            <div class="row">
                <div class="col offset-1">
                    <p>1.1 Lorem ipsum dolor sit amet, consectetur adipisicing elit?</p>
                    <form method="post" action="" class="form">
                        <div class="form-item checkboxes">
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                        </div>
                    </form>
                </div>
                <div class="col">
                    <a href="">
                        <i class="fa fa-trash font-green"></i> Delete
                    </a> 
                    <a href="">
                        <i class="fa fa-cog font-green"></i> Edit
                    </a>
                </div>
            </div>
            <div class="row">
                <div class="col offset-1">
                    <p>1.1 Lorem ipsum dolor sit amet, consectetur adipisicing elit?</p>
                    <form method="post" action="" class="form">
                        <div class="form-item checkboxes">
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                        </div>
                    </form>
                </div>
                <div class="col">
                    <a href="">
                        <i class="fa fa-trash font-green"></i> Delete
                    </a> 
                    <a href="">
                        <i class="fa fa-cog font-green"></i> Edit
                    </a>
                </div>
            </div>
            <div class="row">
                <div class="col offset-1">
                    <p>1.1 Lorem ipsum dolor sit amet, consectetur adipisicing elit?</p>
                    <form method="post" action="" class="form">
                        <div class="form-item checkboxes">
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                            <label><input type="radio"> Lorem ipsum dolor sit amet, consectetur adipisicing elit</label>
                        </div>
                    </form>
                </div>
                <div class="col">
                    <a href="">
                        <i class="fa fa-trash font-green"></i> Delete
                    </a> 
                    <a href="">
                        <i class="fa fa-cog font-green"></i> Edit
                    </a>
                </div>
            </div>
            <div class="col">
                <button class="button round outline small">
                    Add test <i class="fa fa-plus" aria-hidden="true"></i>

                </button>
            </div>
            <div class="text-center">
                <button class="button round  green-bg">
                    Confirm <i class="fa fa-arrow-right" aria-hidden="true"></i>
                </button>
            </div>

        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>