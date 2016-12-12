<%-- 
    Document   : CreateProgram
    Created on : 08.07.2016, 15:12:56
    Author     : ksinn
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Program :: ${initParam.SiteName} &mdash; 2016 </title>
        <link href="../img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
    </head>
    <body>
        <%@include file="../header.jsp"%>

        <div class="row centered registration">
            <div class="col col-4">

                <form id="form" class="form" action="" method="POST" enctype="multipart/form-data">
                    <h3 class="text-centered">Program</h3>
                    <input type="hidden" name="id" value="${program.id}">
                    <div class="form-item">
                        <label>Name:</label>
                        <input class="width-100" required type="text" name="name" value="${program.name}">
                    </div>
                    
                    <div class="form-item">
                        <label>Area:</label>
                        <select required name="area" >
                            <c:forEach items="${areas}" var="area">
                                <option value="${area.id}">${area.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <div class="form-item">
                        <label>Description:</label>
                        <textarea rows="6" required  name="discription">${program.description}</textarea>
                    </div> 
                      
                    <div class="form-item">
                        <label>Level:</label>
                        <label>Какой уровень будет после прохождения курса</label>
                        <input class="width-100" id="level" required type="number" min="1" max="3" name="level" value=${program.level}>
                    </div>
                    
                    <div class="form-item">
                        <label>Duration:</label>
                        поставить условие длительности
                        <input class="width-100" required type="number" name="duration" min="1" value="${program.duration}"> days.
                    </div>
                    
                    <div class="form-item">
                        <label>Picture:</label>
                        <input class="width-100" type="file" name="picture" >
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
                            maxlength: 128,
                        },
                        
                        discription:{
                            required: true,
                            maxlength: 4096,
                        },
                        
                        level:{
                            required: true,
                            number: true,
                            min: 1,
                            max: 3,
                        },
                        
                        duration:{
                            required: true,
                            number: true,
                            min: 1,
                            max: 183
                        },
                        
                picture:{
                            accept: "png|jpg|jpeg",
                        }                       
                   },

                });


            }); //end of ready
        </script>
        <%@include file="/footer.jsp" %>
    </body>
</html>
