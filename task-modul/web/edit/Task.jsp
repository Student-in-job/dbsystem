<%-- 
    Document   : CreateTask
    Created on : 05.09.2016, 11:17:11
    Author     : ksinn
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task</title>
        <link href="../img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
        <script src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"></script>
        <!--<script>tinymce.init({
            selector: '#input',
            theme: 'modern',
            width: 800,
            height: 400,
            plugins: [
              'advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker',
              'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
              'save table contextmenu directionality emoticons template paste textcolor'
            ],
            toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons'

            });
        </script>-->
    </head>
    <body>
        <%@include file="../header.jsp"%>

        <div class="row centered registration">
            <div class="col col-4">

                <form id="form" class="form" action="" method="POST">
                    <h3 class="text-centered">Task</h3>
                    <input type="hidden" name="group" value="${task.group.id}"> 
                    <input type="hidden" name="task" value="${task.id}"> 
                    
                    <div class="form-item">
                        <label>Question:</label>
                        <textarea id="input" required name="question">${task.question}</textarea>
                    </div>
                    
                    <div class="form-item">
                        <label>Answer Query:</label> <a target="blank" href="DataBaseManager.jsp?program=${task.group}">DataBase Manager -></a>
                        <textarea required name="answer">${task.answer}</textarea>
                    </div>
                    
                    <div class="form-item">
                        <label>Time(in minuts):</label>
                        <input class="width-100" min="1" type="number" name="time" value="${task.time}">
                    </div>
                    
                    
                    <div class="form-item">
                        <label>Ball:</label>
                        <input class="width-100" min="1" type="number" name="ball" value="${task.ball}">
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

                        answer:{
                            required: true,
                            minlength: 10,
                            maxlength: 500
                        },
                                
                        question:{
                            required: true,
                            minlength: 10,
                            maxlength: 1000
                        },
                        
                        time:{
                            number: true,
                            min: 0,
                            max: 120
                        },
                                
                        ball:{
                            number: true,
                            min: 0,
                            max: 100
                        }       
                        
                   }

                });


            }); //end of ready
        </script> 
        <%@include file="../footer.jsp" %>
    </body>
</html>