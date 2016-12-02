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
        <title>Task :: ${initParam.SiteName} &mdash; 2016 </title>
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
        <%@include file="/header.jsp"%>

        <div class="row centered registration">
            <div class="col col-4">

                <form id="form" class="form" action="" method="POST">
                    <h3 class="text-centered">Task</h3>
                    <input type="hidden" name="program" value="${program.id}"> 
                    <input type="hidden" name="task" value="${task.id}"> 
                    
                    <div class="form-item">
                        <label>Group ID:</label>
                        <input class="width-100" required type="number" name="group" value="${task.groupId}">
                    </div>
                    
                    <div class="form-item">
                        <label>Name:</label>
                        <input class="width-100" required type="text" name="name" value="${task.name}">
                    </div>
                    
                    <div class="form-item">
                        <label>Day:</label>
                        <input class="width-100" required type="number" name="day" value="${task.day}">
                    </div>
                    
                    <div class="form-item">
                        <label>Total Count:</label>
                        <input class="width-100" required  type="number" name="total_count" value="${task.totalCount}">
                    </div>
                    
                    <div class="form-item">
                        <label>Passing Count:</label>
                        <input class="width-100" required  type="number" name="passing_count" value="${task.passingCount}">
                    </div>
                    
                    <div class="form-item">
                        <label>Period:</label>
                        <input class="width-100" required type="number" name="period" value="${task.period}">
                    </div>
                    
                    <div class="form-item">
                        <label>Start Time(hour):</label>
                        <input class="width-100" required type="number" name="starttime" value="${task.startTime}">
                    </div>
                    
                    <div class="form-item">
                        <label>Time(in minuts):</label>
                        <input class="width-100" required type="number" name="time" value="${task.time}">
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
                        
                        day:{
                            required: true,
                            number: true,
                            min: 1
                        },
                                
                        period:{
                            required: true,
                            number: true,
                            min: 1
                        },        
                        
                        starttime:{
                            required: true,
                            number: true,
                            min: 0
                        },
                        
                        time:{
                            required: true,
                            number: true,
                            min: 1
                        },
                                
                        group:{
                            required: true,
                            number: true,
                            min: 1
                        },
                        
                        total_count:{
                            required: true,
                            number: true,
                            min: 1
                        } ,
                        passing_count:{
                            required: true,
                            number: true,
                            min: 1
                        } 
                        
                   }

                });


            }); //end of ready
        </script> 
        <%@include file="/footer.jsp" %>
    </body>
</html>